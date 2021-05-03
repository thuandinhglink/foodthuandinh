<?php
namespace Modules\Categorys\Repositories;

use Auth;
use Carbon\Carbon;
use DB;
use Modules\CustomField\Models\CustomField;
use Modules\Helper\Helpers\EmailsHelper;
use Modules\Categorys\Models\Categorys;
use Modules\Categorys\Models\CategorysTranslation;
use Modules\Options\Models\OptionsValue;
use Modules\Options\Models\Options;
use Modules\Categorys\Models\CategoryInfotechs;
use Modules\Page\Models\Page;
use Modules\Page\Models\PagesTranslation;
use Modules\User\Models\User\User;
use Modules\Helper\Repositories\HelperRepository;
use Modules\Slack\Repositories\SlackRepository;
use Modules\Helper\Models\PathAlias;
use Modules\Seo\Models\PathAliasSeo;
use Modules\Helper\Helpers\WebHelper;
use Storage;

/**
 * Class CategoryRepository
 *
 * Categorys CRUD functionality
 *
 * Categorys create, update, delete and view
 *
 * PHP version 7.1.3
 *
 * @category  PM
 * @package   Modules\Categorys
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class CategoryRepository
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
		SlackRepository $slackRepo,
		WebHelper $webHelper
	) {
		$this->helperRepo = $helperRepo;
		$this->emailRepo = $emailRepo;
		$this->slackRepo = $slackRepo;
		$this->webHelper = $webHelper;
	}

	/**
	 * Display a listing of the resource.
	 *
	 * @return Object
	 */
	public function findAll()
	{
		$user = Auth::user();
		$categorys = Categorys::join('web_po_cates_translation', 'web_po_cates_translation.po_cates_id', 'web_po_cates.id')->where('langcode', 'vi')->select('*', 'web_po_cates.id as id')->get();
		$data = [['id'=>null,  'specifications'=>[], 'name'=>'Parent']];
		foreach ($categorys as $key => $value) {
			$value->specifications = Options::join('web_options_translation', 'web_options.id', 'web_options_translation.options_id')->join('web_pro_ginfotechs', 'web_pro_ginfotechs.options_indentify', 'web_options.indentify')->where('web_options_translation.langcode', 'vi')->where('web_pro_ginfotechs.po_cates_id', $value->id)->get();
			foreach ($value->specifications as $specValue) {
				$specValue->value = OptionsValue::where('options_indentify', $specValue->indentify)->where('options_types_indentify', $specValue->options_types_indentify)->get();
			}
			array_push($data, $value);
		}
		return $data;
	}

	public function getTemplate()
	{
		return Page::join('web_pages_translation', 'web_pages_translation.pages_id', '=', 'web_pages.id')->where('web_pages_translation.langcode', 'vi')->where('web_pages.type', 1)->select('*', 'web_pages.id as id')->get();
	}

	public function getAllCategorys($request)
	{
		$user = Auth::user();
		$columns = array(
				0 => 'web_po_cates.id',
				1 => 'web_po_cates_translation.name',
				2 => 'web_po_cates_translation.title',
				3 => 'web_po_cates_translation.description'
			);
		$input = $request->input();
		$limit = $request->input('length');
		$start = $request->input('start');
		$order = $columns[$request->input('order.0.column')];
		$dir = $request->input('order.0.dir');
		

		$categorys = Categorys::join('web_po_cates_translation', 'web_po_cates_translation.po_cates_id', 'web_po_cates.id')
						->join('web_path_alias', 'web_path_alias.pages_id', 'web_po_cates.id')->where('web_po_cates_translation.langcode', 'vi')->where('web_po_cates.po_types_indentify', $request->input('moduletype'))->where('web_path_alias.type', 1);
		if (!empty($request->input('search.value'))) {
			$search = $request->input('search.value');

			$categorys = $categorys->where(
				function ($query) use ($search) {
					$query->where('web_po_cates_translation.name', 'LIKE', "%{$search}%")
						->orWhere('web_po_cates_translation.title', 'LIKE', "%{$search}%")
						->orWhere('web_po_cates_translation.description', 'LIKE', "%{$search}%");
				}
			);
		}

		$totalData = $categorys->count();
		$totalFiltered = $totalData;


		$data = $categorys->offset($start)
			->limit($limit)
			->orderBy($order, $dir)
			->select('web_po_cates.*','web_po_cates_translation.*', 'web_path_alias.prefix', 'web_path_alias.alias', 'web_po_cates.id as id')
			->get();
		return array(
			"draw"            => intval($request->input('draw')),
			"recordsTotal"    => intval($totalData),
			"recordsFiltered" => intval($totalFiltered),
			// "statusCount"     => $statusCount,
			"data"            => $data
		);
	}

	/**
	 * Display a category of the resource.
	 *
	 * @param Int $id [Row id]
	 *
	 * @return Object
	 */
	public function findById($id)
	{
		$data = Categorys::join('web_po_cates_translation', 'web_po_cates_translation.po_cates_id', 'web_po_cates.id')->where('web_po_cates_translation.langcode', 'vi')->where('web_po_cates.id', $id)->select('*', 'web_po_cates.id as id')->first();

		if($data){
			$pathData = PathAlias::where('type', 1)->where('pages_id', $data->id)->where('langcode', 'vi')->first();
			$data->page_title = $pathData->title;
			$data->page_description = $pathData->description;
			$data->url_and_handle = $pathData->alias;
			$data->seo = PathAliasSeo::where('path_alias_id', $pathData->id)->pluck('meta_id');
			$data->seoData = PathAliasSeo::join('web_meta', 'web_meta.id', '=', 'web_path_alias_seo.meta_id')->where('path_alias_id', $pathData->id)->select('web_meta.id', 'web_path_alias_seo.content', DB::raw('CONCAT(web_meta.attr, \'=\', web_meta.value) as label'))->get();
			$data->specifications = CategoryInfotechs::where('po_cates_id', $id)->pluck('options_indentify');
			return $data;
		}
		return false;
	}


	public function create($request)
	{
		$input = $request->all();
		$user = Auth::user();
		$category = new Categorys;
		DB::beginTransaction();
		try {
			if (!empty($input['avatar'])) {
				$input['avatar'] = $this->webHelper->_uploadImage($input['avatar'], 'project_uploads');
			}

			$categorys = $category->create([
				'pages_id'=>$input['pages_id'],
				'parent_id'=>$input['parent_id'],
				'active'=>$input['active'],
				'avatar'=>$input['avatar'],
				'created_by_id'=>$user->id,
				'po_types_indentify'=>$input['po_types_indentify']
			]);

			if ($categorys) {
				CategorysTranslation::create([
					'langcode'=>'vi',
					'po_cates_id'=>$categorys->id,
					'name'=>$input['name'],
					'description'=>$input['description'],
					'created_by_id'=>$user->id
				]);
				$pathAlias = PathAlias::create([
			        'pages_id'=>$categorys->id,
			        'langcode'=>'vi',
			        'title'=>$input['page_title'],
			        'description'=>$input['page_description'],
			        'alias'=>$this->webHelper->stripVN($input['url_and_handle']),
			        'type'=>1
				]);
				$this->webHelper->saveMetaSeo($input['seoData'], $pathAlias->id);
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

	/**
	 * Update the specified resource in storage.
	 *
	 * @param Request $request [Request for update category]
	 * @param Int     $id      [Row id]
	 *
	 * @return Object
	 */
	public function update($request, $id)
	{
		
		$input = $request->all();
		$user = Auth::user();
		DB::beginTransaction();
		try {
			$category = Categorys::findOrFail($id);
			if (!empty($input['avatar']) && $category->avatar != $input['avatar']) {
				$input['avatar'] = $this->webHelper->_uploadImage($input['avatar'], 'project_uploads');
			}
			Categorys::where('id', $id)->update([
				'pages_id'=>$input['pages_id'],
				'avatar'=>$input['avatar'],
				'parent_id'=>$input['parent_id'],
				'active'=>$input['active'],
			]);
			CategorysTranslation::where('po_cates_id', $id)->where('langcode', 'vi')->update([
				'name'=>$input['name'],
				'description'=>$input['description'],
			]);
			CategoryInfotechs::where('po_cates_id', $id)->whereNotIn('options_indentify', $input['specifications'])->delete();
			if(isset($input['specifications']) && count($input['specifications']) > 0){
				foreach ($input['specifications'] as $key => $value) {
					$checkSpecifications = CategoryInfotechs::where('po_cates_id', $id)->where('options_indentify', $value)->first();
					if(!$checkSpecifications){
						CategoryInfotechs::create([
							'po_cates_id'=>$id,
	        				'options_indentify'=>$value
						]);
					}
				}
			}
			$pathAlias = PathAlias::where('pages_id', $id)->where('langcode', 'vi')->where('type', 1)->first();
			PathAlias::where('pages_id', $id)->where('langcode', 'vi')->where('type', 1)->update([
		        'title'=>$input['page_title'],
		        'description'=>$input['page_description'],
		        'alias'=>$this->webHelper->stripVN($input['url_and_handle'])
			]);
			$this->webHelper->relevantPageRebuild($id, [1,2]);
			$this->webHelper->saveMetaSeo($input['seoData'], $pathAlias->id);
			DB::commit();
			return true;
		} catch (\Exception $e) {
		    DB::rollback();
		    return $this->webHelper->ParseException($e);
		}
		return false;
	}
	/**
	 * Remove the specified resource from storage.
	 *
	 * @param Request $request [Request for delete category]
	 * @param Int     $id      [Row id]
	 *
	 * @return Boolean
	 */
	public function delete($request, $id)
	{
		DB::beginTransaction();
		try {
			$categorys = Categorys::where('id', $id)->first();
			CategorysTranslation::where('po_cates_id', $id)->delete();
			PathAlias::where('pages_id', $id)->where('langcode', 'vi')->where('type', 1)->delete();
			Categorys::where('id', $id)->delete();
			DB::commit();
			return true;
		} catch (\Exception $e) {
		    DB::rollback();
		    return $this->webHelper->ParseException($e);
		}
	}

	public function checkPermission($category_id, $action)
	{
		$user = Auth::user();
		if ($user->hasRole('admin') || $user->is_super_admin) {
			return true;
		}

		$categoryUser = CategoryUser::where('category_id', $category_id)
			->where('user_id', Auth::user()->id)
			->where($action, true)
			->first();

		if ($categoryUser) {
			return true;
		}
		return false;
	}
}
