<?php
namespace Modules\Template\Repositories;

use Auth;
use DB;
use Modules\Defect\Models\Defect;
use Modules\Helper\Helpers\CommonHelper;
use Modules\Incident\Models\Incident;
use Modules\Page\Models\Page;
use Modules\Projects\Models\Project;
use Modules\Task\Models\Task;
use Modules\Template\Models\Template;
use Modules\Template\Models\TemplateTranslation;
use Modules\Template\Models\TemplateRegion;
use Modules\Helper\Helpers\WebHelper;
use Illuminate\Support\Facades\File;

/**
 * Class TemplateRepository
 *
 * Template create, update, delete and view.
 *
 * PHP version 7.1.3
 *
 * @category  PM
 * @package   Modules\Template
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class TemplateRepository
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

	public function findAll()
	{
		return Template::join('web_templates_translation', 'web_templates_translation.templates_id', '=', 'web_templates.id')->where('web_templates_translation.langcode', 'vi')->select('web_templates.id', 'web_templates_translation.name', 'web_templates_translation.description')->get();
	}

	public function getAllTemplates($request)
	{

		$template = Template::join('web_templates_translation', 'web_templates_translation.templates_id', '=', 'web_templates.id')->where('web_templates_translation.langcode', 'vi');
		$totalData = $template->count();
		$totalFiltered = $totalData;

		$columns = array(
			0 => 'web_templates.id',
			1 => 'web_templates_translation.name',
			2 => 'web_templates_translation.description',
		);

		$limit = $request->input('length');
		$start = $request->input('start');
		$order = $columns[$request->input('order.0.column')];
		$dir = $request->input('order.0.dir');

		if (!empty($request->input('search.value'))) {
			$search = $request->input('search.value');

			$template = $template->where(
				function ($query) use ($search) {
					$query->where('web_templates_translation.name', 'LIKE', "%{$search}%")
					      ->orWhere('web_templates_translation.description', 'LIKE', "%{$search}%");
				}
			);

			$totalFiltered = $template->count();
		}

		$template = $template->offset($start)
		                   ->limit($limit)
		                   ->select('*', 'web_templates.id as id')
		                   ->orderBy($order, $dir)
		                   ->get();
       
		$json_data = array(
			"draw"            => intval($request->input('draw')),
			"recordsTotal"    => intval($totalData),
			"recordsFiltered" => intval($totalFiltered),
			"data"            => $template
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
		$template = new Template;
		$input = $request->all();
		$input['machine_name'] = $this->webHelper->stripVN($input['name']);
		DB::beginTransaction();
		try {
			$template->fill($input);
			if ($template->save()) {
				// $this->webHelper->buildTemplate($template->id);
				TemplateTranslation::insert([
					'name'=>$input['name'],
					'templates_id'=>$template->id,
			        'langcode'=>'vi',
			        'description'=>$input['description']
				]);
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
		$template = Template::join('web_templates_translation', 'web_templates_translation.templates_id', '=', 'web_templates.id')->where('web_templates_translation.langcode', 'vi')->where('web_templates.id', $id)->select('web_templates.id', 'web_templates_translation.name', 'web_templates_translation.description')->first();

		if ($template) {
			return $template;
		}

		return false;
	}

	public function update($request, $id)
	{
		$input = $request->all();
		$input['machine_name'] = $this->webHelper->stripVN($input['name']);
		DB::beginTransaction();
		try {
			$template = Template::findOrFail($id);
			$template->fill($input);
			if ($template->save()) {
				TemplateTranslation::where('langcode', 'vi')->where('templates_id', $template->id)->update([
					'name'=>$input['name'],
			        'description'=>$input['description']
				]);
				// $this->webHelper->buildTemplate($template->id);
				DB::commit();
				return true;
			}


			// $template->fill($input);
			// if ($template->save()) {
			// 	// $this->webHelper->buildTemplate($template->id);
			// 	TemplateTranslation::insert([
			// 		'name'=>$input['name'],
			// 		'templates_id'=>$template->id,
			//         'langcode'=>'vi',
			//         'description'=>$input['description']
			// 	]);
			// 	DB::commit();
			// 	return true;
			// }
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
			TemplateRegion::where('templates_id', $id)->delete();
			TemplateTranslation::where('templates_id', $id)->delete();
			Template::where('id', $id)->delete();
			DB::commit();
			return true;
		} catch (\Exception $e) {
		    DB::rollback();
		    return $this->webHelper->ParseException($e);
		}
		// $template = Template::find($id);
  //       if ($template->delete()) {
	 //        $this->webHelper->buildTemplate($template->id);
  //           return true;
  //       } else {
  //           return false;
  //       }
	}

	public function getAllManagerRegions($request)
	{
		$templateData = Template::where('id', $request->input('template_id'))->first();


		$template = TemplateRegion::join('web_templates', 'web_templates.id', '=', 'web_template_region.templates_id')
		                          ->join('web_regions', 'web_regions.id', '=', 'web_template_region.regions_id')
		                          ->join('web_regions_translation', 'web_regions_translation.regions_id', '=', 'web_regions.id')
		                          ->where('web_templates.id', $request->input('template_id'))
		                          ->where('web_regions_translation.langcode', 'vi');

		$columns = array(
			0 => 'web_template_region.index',
			1 => 'web_regions.id',
			2 => 'web_regions_translation.name'
		);
		$limit = $request->input('length');
		$start = $request->input('start');
		$order = $columns[$request->input('order.0.column')];
		$dir = $request->input('order.0.dir');

		if (!empty($request->input('search.value'))) {
			$search = $request->input('search.value');

			$template = $template->where(
				function ($query) use ($search) {
					$query->where('web_regions_translation.name', 'LIKE', "%{$search}%");
				}
			);

			$totalFiltered = $template->count();
		}

		$template = $template->offset($start)
		                     ->limit($limit)
		                     ->orderBy('index')
		                     ->select('web_template_region.id', 'web_regions_translation.name', 'web_template_region.index', 'web_template_region.status')
		                     ->get();

		$totalData = $template->count();
		$totalFiltered = $totalData;
		$json_data = array(
			"draw"            => intval($request->input('draw')),
			"recordsTotal"    => intval($totalData),
			"recordsFiltered" => intval($totalFiltered),
			"data"            => $template,
			"parentData"      => $templateData
		);

		return $json_data;
	}

	public function addRegion($request)
	{
		// return true;
		$templateRegion = new TemplateRegion;
		$input = $request->all();
		DB::beginTransaction();
		try {
			$templateRegion->fill($input);
			if ($templateRegion->save()) {
				// $this->webHelper->buildTemplate($TemplateRegion->templates_id);
				DB::commit();
				return true;
			}
		} catch (\Exception $e) {
		    DB::rollback();
		    return false;
		}
		return false;
	}

	public function getRegionById($id)
	{
		$templateRegion = TemplateRegion::where('id', $id)->select('id', 'regions_id', 'templates_id', 'index')->first();

		if ($templateRegion) {
			$result = $templateRegion;
			return $result;
		}

		return false;
	}

	public function updateManagerRegion($request, $id)
	{
		$input = $request->all();
		$templateRegion = TemplateRegion::findOrFail($id);
		$templateRegion->fill($input);
		if ($templateRegion->save()) {
			// $this->webHelper->buildTemplate($templateRegion->templates_id);
			return true;
		}
		return false;
	}

	public function deleteManagerRegion($id)
	{
		$templateRegion = TemplateRegion::find($id);
		if ($templateRegion->delete()) {
			// $this->webHelper->buildTemplate($templateRegion->templates_id);
			return true;
		} else {
			return false;
		}
	}

	public function changeStatus($request, $id)
	{
		$status = $request->get('status');
		$templateRegion = TemplateRegion::findOrFail($id);
		$templateRegion->status = $status;
		if($templateRegion->save()){
			$this->webHelper->buildTemplate($templateRegion->templates_id);
			$listPage = Page::where('templates_id', $templateRegion->templates_id)->pluck('id');
			foreach ($listPage as $value){
				$this->webHelper->buildPage($value);
			}
			return true;
		}
		return false;
	}
}
