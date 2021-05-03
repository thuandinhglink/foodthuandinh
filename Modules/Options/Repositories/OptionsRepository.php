<?php
namespace Modules\Options\Repositories;

use Auth;
use Carbon\Carbon;
use DB;
use Modules\CustomField\Models\CustomField;
use Modules\Helper\Helpers\EmailsHelper;
use Modules\Options\Models\Options;
use Modules\Options\Models\OptionsTranslation;
use Modules\Options\Models\OptionsValue;
use Modules\Options\Models\OptionsValueTranslation;
use Modules\UserActivity\Models\UserActivity;
use Modules\User\Models\Department\Department;
use Modules\User\Models\User\User;
use Modules\Helper\Repositories\HelperRepository;
use Modules\Slack\Repositories\SlackRepository;
use Modules\Helper\Helpers\WebHelper;
use Storage;

/**
 * Class OptionsRepository
 *
 * Options CRUD functionality
 *
 * Options create, update, delete and view
 *
 * PHP version 7.1.3
 *
 * @options  PM
 * @package   Modules\Options
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class OptionsRepository
{
	protected $helperRepo;
	protected $emailRepo;
	protected $slackRepo;

	/**
	 * Instantiate a new repository instance.
	 *
	 * @param HelperRepository $helperRepo [Object]
	 * @param EmailsHelper     $emailRepo  [Object]
	 *
	 * @return void
	 */
	public function __construct(
		HelperRepository $helperRepo,
		EmailsHelper $emailRepo,
		WebHelper $webHelper,
		SlackRepository $slackRepo
	) {
		$this->helperRepo = $helperRepo;
		$this->emailRepo = $emailRepo;
		$this->webHelper = $webHelper;
		$this->slackRepo = $slackRepo;
	}

	/**
	 * Display a listing of the resource.
	 *
	 * @return Object
	 */
	public function findAll($request)
	{
		$options = Options::join('web_options_translation', 'web_options.id', 'web_options_translation.options_id')->where('web_options_translation.langcode', 'vi')->where('web_options.options_types_indentify', $request->input('typeOption'))->get();
		foreach ($options as $key => $value) {
			$value->value = OptionsValue::where('options_indentify', $value->indentify)->where('options_types_indentify', $value->options_types_indentify)->get();
		}
		return $options;
	}


	public function getAllOptions($request)
	{
		$user = Auth::user();
		$columns = array(
				0 => 'web_options.id',
				1 => 'web_options_translation.name',
				2 => 'web_options_translation.description'
			);
		$input = $request->input();
		$limit = $request->input('length');
		$start = $request->input('start');
		$order = $columns[$request->input('order.0.column')];
		$dir = $request->input('order.0.dir');

		$options = Options::join('web_options_translation', 'web_options.id', 'web_options_translation.options_id')->where('web_options_translation.langcode', 'vi')->where('web_options.options_types_indentify', $request->input('moduletype'));
		if (!empty($request->input('search.value'))) {
			$search = $request->input('search.value');

			$options = $options->where(
				function ($query) use ($search) {
					$query->where('web_options_translation.name', 'LIKE', "%{$search}%")
						->orWhere('web_options_translation.description', 'LIKE', "%{$search}%");
				}
			);
		}

		$totalData = $options->count();
		$totalFiltered = $totalData;


		$data = $options->offset($start)
			->limit($limit)
			->select('*', 'web_options.id as id')
			->orderBy($order, $dir)
			->get();
		return array(
			"draw"            => intval($request->input('draw')),
			"recordsTotal"    => intval($totalData),
			"recordsFiltered" => intval($totalFiltered),
			// "statusCount"     => $statusCount,
			"data"            => $data
		);
	}
	public function findById($id)
	{
		$data = Options::join('web_options_translation', 'web_options_translation.options_id', 'web_options.id')->where('web_options_translation.langcode', 'vi')->where('web_options.id', $id)->select('*', 'web_options.id as id')->first();
		if($data){
			$data->options = OptionsValue::where('options_indentify', $data->indentify)->where('options_types_indentify', $data->options_types_indentify)->get();
			return $data;
		}
		return false;
	}
	public function create($request)
	{
		$input = $request->all();
		$user = Auth::user();
		DB::beginTransaction();
		try {
			$options = Options::create([
		        'indentify'=>$this->webHelper->stripVN($input['name']),
		        'options_types_indentify'=>$input['options_types_indentify']
			]);
			if ($options) {
				OptionsTranslation::create([
					'langcode'=>'vi',
					'options_id'=>$options->id,
			        'name'=>$input['name'],
			        'description'=>$input['description'],
				]);
				if(count($input['options'] ) > 0) {
					foreach ($input['options'] as $key => $value) {
						OptionsValue::create([
							'indentify'=>$this->webHelper->stripVN($value['name']),
							'name'=>$value['name'],
							'options_indentify'=>$options->indentify,
							'options_types_indentify'=>$input['options_types_indentify'],
						]);
					}
				}
				DB::commit();
				return true;
			} else {
				return false;
			}
		} catch (\Exception $e) {
		    DB::rollback();
		    return $this->webHelper->ParseException($e);
		}
	}
	public function update($request, $id)
	{
		$input = $request->all();
		$user = Auth::user();
		DB::beginTransaction();
		try {
			Options::where('id', $id)->update([
		        'indentify'=>$this->webHelper->stripVN($input['name']),
		        'options_types_indentify'=>$input['options_types_indentify']
			]);
			$options = Options::where('id', $id)->first();
			if ($options) {
				OptionsTranslation::where('langcode', 'vi')->where('options_id', $options->id)->update([
			        'name'=>$input['name'],
			        'description'=>$input['description'],
				]);
				OptionsValue::where('options_indentify', $options->indentify)->where('options_types_indentify', $options->options_types_indentify)->whereNotIn('id', array_column($input['options'], 'id'))->delete();
				if(count($input['options'] ) > 0) {
					foreach ($input['options'] as $key => $value) {
						if(isset($value['id']) && $value['id'] != ''){
							$optionsValue = OptionsValue::where('id', $value['id'])->update([
								'indentify'=>$this->webHelper->stripVN($value['name']),
								'options_indentify'=>$options->indentify,
								'name'=>$value['name'],
								'options_types_indentify'=>$options->options_types_indentify
							]);
							// OptionsValueTranslation::where('options_value_id',$value['id'])->where('langcode', 'vi')->update([
						 //        'name'=>$value['name'],
							// ]);
						} else {
							$optionsValue = OptionsValue::create([
								'indentify'=>$this->webHelper->stripVN($value['name']),
								'name'=>$value['name'],
								'options_indentify'=>$options->indentify,
								'options_types_indentify'=>$options->options_types_indentify
							]);
							// OptionsValueTranslation::create([
						 //        'options_value_id'=>$optionsValue->id,
						 //        'langcode'=>'vi',
						 //        'name'=>$value['name'],
							// ]);
						}
						
					}
				}
				DB::commit();
				return true;
			} else {
				return false;
			}
		} catch (\Exception $e) {
		    DB::rollback();
		    return $this->webHelper->ParseException($e);
		}
	}
	public function delete($id)
	{
		DB::beginTransaction();
		try {
			$dataDelete = Options::where('id', $id)->first();
			OptionsTranslation::where('options_id', $id)->delete();
			OptionsValue::where('options_indentify', $dataDelete->indentify)->where('options_types_indentify', $dataDelete->options_types_indentify)->delete();
			Options::where('id', $id)->delete();
			DB::commit();
			return true;
		} catch (\Exception $e) {
		    DB::rollback();
		    return $this->webHelper->ParseException($e);
		}
		return true;
	}

	public function checkPermission($options_id, $action)
	{
		$user = Auth::user();
		if ($user->hasRole('admin') || $user->is_super_admin) {
			return true;
		}

		$optionsUser = OptionsUser::where('options_id', $options_id)
			->where('user_id', Auth::user()->id)
			->where($action, true)
			->first();
		if ($optionsUser) {
			return true;
		}
		return false;
	}
}
