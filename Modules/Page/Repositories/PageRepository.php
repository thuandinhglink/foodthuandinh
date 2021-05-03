<?php
namespace Modules\Page\Repositories;

use Auth;
use DB;
use Modules\Defect\Models\Defect;
use Modules\Helper\Helpers\CommonHelper;
use Modules\Incident\Models\Incident;
use Modules\Projects\Models\Project;
use Modules\Task\Models\Task;
use Modules\Page\Models\Page;
use Modules\Page\Models\PagesTranslation;
use Illuminate\Support\Facades\File;
use Modules\Template\Models\Template;
use Modules\Template\Models\TemplateRegion;
use Modules\Page\Models\IncludeWidget;
use Modules\Helper\Helpers\WebHelper;
use Modules\Helper\Models\PathAlias;
use Modules\Seo\Models\PathAliasSeo;

/**
 * Class PageRepository
 *
 * Page create, update, delete and view.
 *
 * PHP version 7.1.3
 *
 * @category  PM
 * @package   Modules\Page
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class PageRepository
{
    protected $commonHelper;

    /**
     * Instantiate a new repository instance.
     *
     * @param CommonHelper $commonHelper [Object]
     *
     * @return void
     */
    public function __construct(CommonHelper $commonHelper, WebHelper $webHelper)
    {
        $this->commonHelper = $commonHelper;
	    $this->webHelper = $webHelper;
    }

	/**
	 * Get all user.
	 *
	 * @param Request $request [Request for get pages]
	 *
	 * @return Object
	 */
	public function getAllPages($request)
	{
		$page = Page::join('web_templates', 'web_templates.id', '=', 'web_pages.templates_id')->join('web_pages_translation', 'web_pages.id', '=', 'web_pages_translation.pages_id')->join('web_templates_translation', 'web_templates.id', '=', 'web_templates_translation.templates_id')->where('web_templates_translation.langcode', 'vi')->where('web_pages_translation.langcode', 'vi');
		$totalData = $page->count();
		$totalFiltered = $totalData;

		$columns = array(
			0 => 'web_pages.id',
			1 => 'name',
			2 => 'description',
			3 => 'title',
			4 => 'url'
		);

		$limit = $request->input('length');
		$start = $request->input('start');
		$order = $columns[$request->input('order.0.column')];
		$dir = $request->input('order.0.dir');

		if (!empty($request->input('search.value'))) {
			$search = $request->input('search.value');

			$page = $page->where(
				function ($query) use ($search) {
					$query->where('web_pages_translation.name', 'LIKE', "%{$search}%")
					    ->orWhere('web_pages_translation.description', 'LIKE', "%{$search}%")
						->orWhere('web_pages_translation.url', 'LIKE', "%{$search}%")
						->orWhere('web_pages_translation.title', 'LIKE', "%{$search}%");
				}
			);

			$totalFiltered = $page->count();
		}

		$page = $page->offset($start)
		                   ->limit($limit)
		                   ->orderBy($order, $dir)
							->select('web_pages_translation.*', 'web_pages.*', 'web_templates_translation.name as template_name')
		                   ->get();

		$json_data = array(
			"draw"            => intval($request->input('draw')),
			"recordsTotal"    => intval($totalData),
			"recordsFiltered" => intval($totalFiltered),
			"data"            => $page
		);

		return $json_data;
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param Request $request [Params for create custom field]
	 *
	 * @return Boolean
	 */
	public function create($request)
	{
		$page = new Page;
		$input = $request->all();
		DB::beginTransaction();
		try {
			$input['machine_name'] = $this->webHelper->stripVN($input['name']);
			$page->fill($input);
			if ($page->save()) {
				PagesTranslation::insert([
			        'pages_id'=>$page->id,
			        'langcode'=>'vi',
			        'title'=>$input['title'],
				    'url'=>$this->webHelper->stripVN($input['url']),
			        'description'=>$input['description'],
				    'name'=>$input['name']
				]);
				$pathAlias = PathAlias::create([
			        'pages_id'=>$page->id,
			        'langcode'=>'vi',
			        'title'=>$input['title'],
			        'description'=>$input['description'],
			        'alias'=>$this->webHelper->stripVN($input['url']),
			        'type'=>$input['type']
				]);
				if($input['type'] == 0){
					$this->webHelper->saveMetaSeo($input['seoData'], $pathAlias->id);	
				}
				$this->webHelper->buildPage($page->id);
				DB::commit();
				return true;
			}
		} catch (\Exception $e) {
		    DB::rollback();
		    return $this->webHelper->ParseException($e);
		}
		return false;
	}

	public function getById($id)
	{
		$page = Page::join('web_pages_translation', 'web_pages.id', '=', 'web_pages_translation.pages_id')->where('web_pages.id', $id)->where('langcode', 'vi')->select('*', 'web_pages.id as id')->first();
		$pathAlias = PathAlias::where('pages_id', $page->id)->where('langcode', 'vi')->first();
		if($pathAlias){
			$page->seo = PathAliasSeo::where('path_alias_id', $pathAlias->id)->pluck('meta_id');
			$page->seoData = PathAliasSeo::join('web_meta', 'web_meta.id', '=', 'web_path_alias_seo.meta_id')->where('path_alias_id', $pathAlias->id)->select('web_meta.id', 'web_path_alias_seo.content', DB::raw('CONCAT(web_meta.attr, \'=\', web_meta.value) as label'))->get();
		} else {
			$page->seo = [];
			$page->seoData = [];
		}
		
		if ($page) {
			return $page;
		}

		return false;
	}

	public function update($request, $id)
	{
		DB::beginTransaction();
		try {
			$input = $request->all();
			$input['machine_name'] = $this->webHelper->stripVN($input['name']);
			$page = Page::findOrFail($id);
			$page->fill($input);
			if ($page->save()) {
				if($input['type'] != 0){
					$input['title'] = '';
					$input['url'] = '';
				}
				PagesTranslation::where('pages_id', $id)->where('langcode', 'vi')->update([
			        'title'=>$input['title'],
				    'url'=>$this->webHelper->stripVN($input['url']),
			        'description'=>$input['description'],
				    'name'=>$input['name']
				]);
				$pathAlias = PathAlias::where('pages_id', $page->id)->where('langcode', 'vi')->first();
				if($pathAlias){
					PathAlias::where('id', $pathAlias->id)->update([
				        'title'=>$input['title'],
				        'description'=>$input['description'],
				        'alias'=>$this->webHelper->stripVN($input['url']),
				        'type'=>$input['type']
					]);
				}
				if($input['type'] == 0){
					$this->webHelper->saveMetaSeo($input['seoData'], $pathAlias->id);	
				}
				$this->webHelper->buildPage($page->id);
				
				DB::commit();
				return true;
			}
		} catch (\Exception $e) {
		    DB::rollback();
		    return $this->webHelper->ParseException($e);
		}
		return false;
	}
	public function delete($id)
	{	
		DB::beginTransaction();
		try {
			PagesTranslation::where('pages_id', $id)->delete();
			$page = Page::find($id);
	        if ($page->delete()) {
	        	PathAlias::where('pages_id', $id)->where('langcode', 'vi')->where('type', $page->type)->delete();
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


	public function getAllManagerWidgets($request)
	{
		$pageData = Page::join('web_pages_translation', 'web_pages.id', '=', 'web_pages_translation.pages_id')->where('web_pages.id', $request->input('page_id'))->select('*', 'web_pages.id as id')->first();
		$template = TemplateRegion::join('web_regions', 'web_regions.id', '=', 'web_template_region.regions_id')->join('web_regions_translation', 'web_regions.id', '=', 'web_regions_translation.regions_id')
		                          ->where('web_template_region.templates_id', $pageData->templates_id)
		                          ->select('web_template_region.*', 'web_regions_translation.name as region_name', 'web_regions.number_content as number_content')
		                          ->orderBy('index')->get();

		foreach ($template as $value){
			$widgetData = [];
			for ($x = 0; $x < $value->number_content; $x++) {
				$dataChid = IncludeWidget::join('web_widgets', 'web_widgets.id', '=', 'web_include_widget.widgets_id')->join('web_widgets_translation', 'web_widgets.id', '=', 'web_widgets_translation.widgets_id')
												  ->where('web_widgets_translation.langcode', 'vi')
				                                  ->where('web_include_widget.pages_id', $pageData->id)
				                                  ->where('web_include_widget.regions_number', $x)
				                                  ->where('web_include_widget.regions_id', $value->regions_id)->orderBy('web_include_widget.index')->select('web_include_widget.*', 'web_widgets_translation.name as widget_name')->get();
				array_push($widgetData, $dataChid);
			}
			$value->widgetData = $widgetData;
		}

		$templateData = Template::join('web_templates_translation', 'web_templates_translation.templates_id', '=', 'web_templates.id')->where('web_templates.id', $pageData->templates_id)->first();
		$pageData->template_name = $templateData->name;
		$pageData->template_machine_name = $templateData->machine_name;
		$json_data = array(
			"recordsTotal"    => 0,
			"recordsFiltered" => 0,
			"data"            => $template,
		"parentData"          => $pageData
		);

		return $json_data;
	}

	public function addWidget($request)
	{
		$includeWidget = new IncludeWidget;
		$input = $request->all();
		$includeWidget->fill($input);
		if ($includeWidget->save()) {
			$this->webHelper->buildPage($includeWidget->pages_id);
			return true;
		}
		return false;
	}

	public function getWidgetById($id)
	{
		$includeWidget = IncludeWidget::where('id', $id)->first();
		if ($includeWidget) {
			return $includeWidget;
		}

		return false;
	}

	public function updateManagerWidget($request, $id)
	{
		$input = $request->all();

		$includeWidget = IncludeWidget::findOrFail($id);
		$includeWidget->fill($input);
		if ($includeWidget->save()) {
			$this->webHelper->buildPage($includeWidget->pages_id);
			return true;
		}
		return false;
	}

	public function deleteManagerWidget($id)
	{
		$includeWidget = IncludeWidget::find($id);

		if ($includeWidget->delete()) {
			$this->webHelper->buildPage($includeWidget->pages_id);
			return true;
		} else {
			return false;
		}
	}

	public function clonePage($id){
		$pageData = Page::join('web_pages_translation', 'web_pages.id', '=', 'web_pages_translation.pages_id')->where('web_pages.id', $id)->where('web_pages_translation.langcode', 'vi')->select('*', 'web_pages.id as id')->first()->toArray();
		$oldPageId = $pageData['id'];
		unset($pageData['id']);
		$pageData['machine_name'] = $pageData['machine_name'].'_copy';
		$pageData['name'] = $pageData['name'].' copy';
		$page = new Page;
		$page->fill($pageData);
		if ($page->save()) {
			PagesTranslation::insert([
		        'title'=>$pageData['title'],
		        'pages_id'=>$page->id,
		        'langcode'=>'vi',
			    'url'=>$pageData['url'].'_copy',
		        'description'=>$pageData['description'],
			    'name'=>$pageData['name']
			]);
			$oldInclude = IncludeWidget::where('pages_id', $oldPageId)->get()->toArray();
			foreach ($oldInclude as $value){
				unset($value['id']);
				$value['pages_id'] = $page['id'];
				$includeWidget = new IncludeWidget;
				$includeWidget->fill($value);
				$includeWidget->save();
			}
			$pathAlias = PathAlias::where('pages_id', $oldPageId)->where('langcode', 'vi')->first();
			if($pathAlias){
				$pathAlias = PathAlias::create([
			        'pages_id'=>$page->id,
			        'langcode'=>'vi',
			        'title'=>$pageData['title'],
			        'description'=>$pageData['description'],
			        'alias'=>$this->webHelper->stripVN($pageData['url']).'_copy',
			        'type'=>$pageData['type']
				]);
				if($pageData['type'] == 0){
					$seoData = PathAliasSeo::join('web_meta', 'web_meta.id', '=', 'web_path_alias_seo.meta_id')->where('path_alias_id', $pathAlias->id)->select('web_meta.id', 'web_path_alias_seo.content', DB::raw('CONCAT(web_meta.attr, \'=\', web_meta.value) as label'))->get();
					$this->webHelper->saveMetaSeo($seoData, $pathAlias->id);	
				}
			}
			$this->webHelper->buildPage($page['id']);
			return true;
		}
		return false;
	}

	public function changeStatus($request, $id)
	{
		$status = $request->get('status');
		$includeWidget = IncludeWidget::findOrFail($id);
		$includeWidget->status = $status;
		if($includeWidget->save()){
			$this->webHelper->buildPage($includeWidget->pages_id);
			return true;
		}
		return false;
	}
}
