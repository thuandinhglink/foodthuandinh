<?php
namespace Modules\Region\Repositories;

use Auth;
use DB;
use Modules\Defect\Models\Defect;
use Modules\Helper\Helpers\CommonHelper;
use Modules\Incident\Models\Incident;
use Modules\Projects\Models\Project;
use Modules\Task\Models\Task;
use Modules\Page\Models\IncludeWidget;
use Modules\Region\Models\Region;
use Modules\Region\Models\RegionsTranslation;
use Modules\Helper\Helpers\WebHelper;
use Illuminate\Support\Facades\File;
use Modules\Template\Models\Template;

/**
 * Class RegionRepository
 *
 * Region create, update, delete and view.
 *
 * PHP version 7.1.3
 *
 * @category  PM
 * @package   Modules\Region
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class RegionRepository
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
		return Region::join('web_regions_translation', 'web_regions.id', '=', 'web_regions_translation.regions_id')->where('web_regions_translation.langcode', 'vi')->select('*', 'web_regions.id as id')->get();
		// return Region::get();
	}

	public function getAllRegions($request)
	{
		$page = Region::join('web_regions_translation', 'web_regions.id', '=', 'web_regions_translation.regions_id')->where('web_regions_translation.langcode', 'vi');

		$columns = array(
			0 => 'web_regions_translation.name',
			1 => 'web_regions_translation.description'
		);

		$limit = $request->input('length');
		$start = $request->input('start');
		$order = $columns[$request->input('order.0.column')];
		$dir = $request->input('order.0.dir');

		if (!empty($request->input('search.value'))) {
			$search = $request->input('search.value');

			$page = $page->where(
				function ($query) use ($search) {
					$query->where('web_regions_translation.name', 'LIKE', "%{$search}%")
					      ->orWhere('web_regions_translation.description', 'LIKE', "%{$search}%");
				}
			);

			$totalFiltered = $page->count();
		}

		$totalData = $page->count();
		$totalFiltered = $totalData;
		$page = $page->offset($start)
		                   ->limit($limit)
		                   ->orderBy($order, $dir)
							->select('*', 'web_regions.id as id')
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
		$region = new Region;
		$input = $request->all();
		$input['machine_name'] = $this->webHelper->stripVN($input['name']);
		$themeActive = $this->webHelper->getThemeActive();
		if (!file_exists(resource_path('themes/'.$themeActive['folder'].'/regions'))) {
			mkdir(resource_path('themes/'.$themeActive['folder'].'/regions'), 0777, true);
		}
		$url = '/regions/'.$input['machine_name'].'.html';
		File::put(resource_path('themes/'.$themeActive['folder'].$url), $input['content_html']);
		$input['content_html'] = $url;
		DB::beginTransaction();
		try {
			$region->fill($input);
			if ($region->save()) {
				RegionsTranslation::insert([
			        'langcode' => 'vi',
			        'regions_id' => $region->id,
			        'name' => $input['name'],
			        'description' => $input['description']
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
		$region = Region::join('web_regions_translation', 'web_regions.id', '=', 'web_regions_translation.regions_id')->where('web_regions_translation.langcode', 'vi')->where('web_regions.id', $id)->select('web_regions.id', 'web_regions_translation.name', 'web_regions_translation.description', 'web_regions.machine_name', 'web_regions.content_html', 'web_regions.number_content')->first();

		$themeActive = $this->webHelper->getThemeActive();
		if ($region) {
			$result = $region;
			if(file_exists(resource_path('themes/'.$themeActive['folder'].$result['content_html']))){
				$result['content_html'] = file_get_contents(resource_path('themes/'.$themeActive['folder'].$result['content_html']));
			} else {
				$result['content_html'] = '';
			}

			return $result;
		}

		return false;
	}

	public function update($request, $id)
	{
		$input = $request->all();
		$input['machine_name'] = $this->webHelper->stripVN($input['name']);
		$themeActive = $this->webHelper->getThemeActive();
		if (!file_exists(resource_path('themes/'.$themeActive['folder'].'/regions'))) {
			mkdir(resource_path('themes/'.$themeActive['folder'].'/regions'), 0777, true);
		}
		$oldData = Region::where('id', $id)->first();
		if($input['machine_name'] != $oldData['machine_name']){
			rename (resource_path('themes/'.$themeActive['folder'].'/regions/'.$oldData['machine_name'].'.html'), resource_path('themes/'.$themeActive['folder'].'/regions/'.$input['machine_name'].'.html'));
		}
		$url = '/regions/'.$input['machine_name'].'.html';
		File::put(resource_path('themes/'.$themeActive['folder'].$url), $input['content_html']);
		$input['content_html'] = $url;
		DB::beginTransaction();
		try {
			$region = Region::findOrFail($id);
			$region->fill($input);
			if ($region->save()) {
				// $buildData = Template::join('web_template_region', 'web_template_region.templates_id', '=', 'web_templates.id')
				// 	->join('web_regions', 'web_regions.id', '=', 'web_template_region.regions_id')
				// 	->select('web_templates.id')->pluck('id');
				// foreach ($buildData as $build){
				// 	$this->webHelper->buildTemplate($build);
				// }
				$buildData = IncludeWidget::where('regions_id', $id)->groupBy('pages_id')->pluck('pages_id');
				foreach ($buildData as $value){
					$this->webHelper->buildPage($value);
				}
				RegionsTranslation::where('regions_id', $region->id)->where('langcode', 'vi')->update([
			        'name' => $input['name'],
			        'description' => $input['description']
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
	public function delete($id)
	{
		DB::beginTransaction();
		try {
			$region = Region::where('id', $id)->first();
	        RegionsTranslation::where('regions_id', $id)->delete();
	        Region::where('id', $id)->delete();
	        IncludeWidget::where('regions_id', $id)->delete();
	        // $themeActive = $this->webHelper->getThemeActive();
	        // unlink(resource_path('themes/'.$themeActive['folder'].$region['content_html']));
	        DB::commit();
            return true;
        } catch (\Exception $e) {
		    DB::rollback();
		    return $this->webHelper->ParseException($e);
		}
	}
}
