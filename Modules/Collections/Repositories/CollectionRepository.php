<?php
namespace Modules\Collections\Repositories;

use Auth;
use Carbon\Carbon;
use DB;
use Modules\CustomField\Models\CustomField;
use Modules\Helper\Helpers\EmailsHelper;
use Modules\CollectionPlannerSprint\Models\CollectionPlannerSprint;
use Modules\CollectionSprintTask\Models\CollectionSprintTask;
use Modules\Collections\Models\Collections;
use Modules\Collections\Models\CollectionsConditions;
use Modules\Collections\Models\CollectionsTranslation;
use Modules\Collections\Models\CollectionUser;
use Modules\Page\Models\Page;
use Modules\Page\Models\PagesTranslation;
use Modules\Task\Models\Task;
use Modules\Team\Models\Team;
use Modules\UserActivity\Models\UserActivity;
use Modules\User\Models\Department\Department;
use Modules\User\Models\User\User;
use Modules\Helper\Repositories\HelperRepository;
use Modules\Slack\Repositories\SlackRepository;
use Modules\Helper\Models\PathAlias;
use Modules\Seo\Models\PathAliasSeo;
use Modules\Helper\Helpers\WebHelper;
use Modules\Widget\Models\WidgetData;
use Modules\Page\Models\IncludeWidget;
use Storage;

/**
 * Class CollectionRepository
 *
 * Collections CRUD functionality
 *
 * Collections create, update, delete and view
 *
 * PHP version 7.1.3
 *
 * @collection  PM
 * @package   Modules\Collections
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class CollectionRepository
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
		$collections = Collections::join('web_collections_translation', 'web_collections_translation.collections_id', 'web_collections.id')->where('langcode', 'vi')->select('*', 'web_collections.id as id')->get();
		$data = [['id'=>null, 'name'=>'Parent']];
		foreach ($collections as $key => $value) {
			array_push($data, $value);
		}
		return $data;
	}

	public function getTemplate()
	{
		return Page::join('web_pages_translation', 'web_pages_translation.pages_id', '=', 'web_pages.id')->where('web_pages_translation.langcode', 'vi')->where('web_pages.type', 2)->select('*', 'web_pages.id as id')->get();
	}

	public function getAllCollections($request)
	{
		$user = Auth::user();
		$columns = array(
				0 => 'web_collections.id',
				1 => 'web_collections_translation.name',
				2 => 'web_collections_translation.description'
			);
		$input = $request->input();
		$limit = $request->input('length');
		$start = $request->input('start');
		$order = $columns[$request->input('order.0.column')];
		$dir = $request->input('order.0.dir');

		$collections = Collections::join('web_collections_translation', 'web_collections_translation.collections_id', 'web_collections.id')->where('web_collections_translation.langcode', 'vi')->join('web_path_alias', 'web_path_alias.pages_id', 'web_collections.id')->where('web_collections.po_types_indentify', $request->input('moduletype'))->where('web_path_alias.type', 2);
		if (!empty($request->input('search.value'))) {
			$search = $request->input('search.value');

			$collections = $collections->where(
				function ($query) use ($search) {
					$query->where('web_collections_translation.name', 'LIKE', "%{$search}%")
						->orWhere('web_collections_translation.title', 'LIKE', "%{$search}%")
						->orWhere('web_collections_translation.description', 'LIKE', "%{$search}%");
				}
			);
		}

		$totalData = $collections->count();
		$totalFiltered = $totalData;


		$data = $collections->offset($start)
			->limit($limit)
			->orderBy($order, $dir)
			->select('*', 'web_path_alias.prefix', 'web_path_alias.alias', 'web_collections.id as id', 'web_collections_translation.description')
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
	 * Display a collection of the resource.
	 *
	 * @param Int $id [Row id]
	 *
	 * @return Object
	 */
	public function findById($id)
	{
		$data = Collections::join('web_collections_translation', 'web_collections_translation.collections_id', 'web_collections.id')->where('web_collections_translation.langcode', 'vi')->where('web_collections.id', $id)->select('*', 'web_collections.id as id')->first();
		$data->conditions = CollectionsConditions::where( 'collections_id', $id)->pluck('type');
		$data->filter = CollectionsConditions::where( 'collections_id', $id)->get();
		$data['type']  = $data['type'] == 'select' ? 0 : 1;
		if($data){
			$pathData = PathAlias::where('type', 2)->where('pages_id', $data->id)->where('langcode', 'vi')->first();
			$data->page_title = $pathData->title;
			$data->page_description = $pathData->description;
			$data->url_and_handle = $pathData->alias;
			$data->seo = PathAliasSeo::where('path_alias_id', $pathData->id)->pluck('meta_id');
			$data->seoData = PathAliasSeo::join('web_meta', 'web_meta.id', '=', 'web_path_alias_seo.meta_id')->where('path_alias_id', $pathData->id)->select('web_meta.id', 'web_path_alias_seo.content', DB::raw('CONCAT(web_meta.attr, \'=\', web_meta.value) as label'))->get();
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
			if (!empty($input['avatar'])) {
				$input['avatar'] = $this->webHelper->_uploadImage($input['avatar'], 'project_uploads');
			}
			$collections = Collections::create([
				'pages_id'=>$input['pages_id'],
				'active'=>$input['active'],
				'type'=>$input['type'] == 1 ? 'auto' : 'select',
				'avatar'=>$input['avatar'],
				'condition_type'=>$input['condition_type'],
				'created_by_id'=>$user->id,
				'po_types_indentify'=>$input['po_types_indentify']
			]);
			if ($collections) {
				CollectionsTranslation::create([
					'langcode'=>'vi',
					'collections_id'=>$collections->id,
					'name'=>$input['name'],
					'description'=>$input['description'],
					'created_by_id'=>$user->id
				]);
				$pathAlias = PathAlias::create([
			        'pages_id'=>$collections->id,
			        'langcode'=>'vi',
			        'title'=>$input['page_title'],
			        'description'=>$input['page_description'],
			        'alias'=>$this->webHelper->stripVN($input['url_and_handle']),
			        'type'=>2
				]);
				$this->webHelper->saveMetaSeo($input['seoData'], $pathAlias->id);
				foreach ($input['filter'] as $key => $value) {
					CollectionsConditions::create([
				        'collections_id'=>$collections->id,
				        'name'=>$value['name'],
				        'condition'=>$value['condition'],
				        'value'=>$value['value'],
				        'type'=>$value['type']
					]);
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

	/**
	 * Update the specified resource in storage.
	 *
	 * @param Request $request [Request for update collection]
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
			$collections = Collections::findOrFail($id);
			if (!empty($input['avatar']) && $collections->avatar != $input['avatar']) {
				$input['avatar'] = $this->webHelper->_uploadImage($input['avatar'], 'project_uploads');
			}
			$collections = Collections::where('id',  $id)->update([
				'pages_id'=>$input['pages_id'],
				'condition_type'=>$input['condition_type'],
				'active'=>$input['active'],
				'type'=>$input['type'] == 1 ? 'auto' : 'select',
				'avatar'=>$input['avatar'],
				'created_by_id'=>$user->id
			]);
			if ($collections) {
				CollectionsTranslation::where('collections_id',  $id)->where('langcode', 'vi')->update([
					'name'=>$input['name'],
					'description'=>$input['description'],
					'created_by_id'=>$user->id
				]);
				PathAlias::where('pages_id',  $id)->where('langcode', 'vi')->where('type', 2)->update([
			        'title'=>$input['page_title'],
			        'description'=>$input['page_description'],
			        'alias'=>$this->webHelper->stripVN($input['url_and_handle'])
				]);

				$this->webHelper->relevantPageRebuild($id, [4,5]);

				$pathAlias = PathAlias::where('pages_id',  $id)->where('langcode', 'vi')->where('type', 2)->first();
				$this->webHelper->saveMetaSeo($input['seoData'], $pathAlias->id);
				CollectionsConditions::where('collections_id', $id)->delete();
				foreach ($input['filter'] as $key => $value) {
					CollectionsConditions::create([
				        'collections_id'=>$id,
				        'name'=>$value['name'],
				        'condition'=>$value['condition'],
				        'value'=>$value['value'],
				        'type'=>$value['type']
					]);
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
		return false;
	}
	/**
	 * Remove the specified resource from storage.
	 *
	 * @param Request $request [Request for delete collection]
	 * @param Int     $id      [Row id]
	 *
	 * @return Boolean
	 */
	public function delete($request, $id)
	{
		DB::beginTransaction();
		try {
			PathAlias::where('pages_id',  $id)->where('langcode', 'vi')->where('type', 'collections')->delete();
			CollectionsTranslation::where('collections_id', $id)->delete();
			CollectionsConditions::where('collections_id', $id)->delete();
			Collections::where('id', $id)->delete();
			$this->webHelper->relevantPageRebuild($id, [4,5]);
			DB::commit();
			return true;
		} catch (\Exception $e) {
		    DB::rollback();
		    return $this->webHelper->ParseException($e);
		}
	}

	public function checkPermission($collection_id, $action)
	{
		$user = Auth::user();
		if ($user->hasRole('admin') || $user->is_super_admin) {
			return true;
		}

		$collectionUser = CollectionUser::where('collection_id', $collection_id)
			->where('user_id', Auth::user()->id)
			->where($action, true)
			->first();

		if ($collectionUser) {
			return true;
		}
		return false;
	}
}
