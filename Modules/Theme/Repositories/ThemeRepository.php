<?php
namespace Modules\Theme\Repositories;

use Auth;
use DB;
use Modules\Defect\Models\Defect;
use Modules\Helper\Helpers\CommonHelper;
use Modules\Incident\Models\Incident;
use Modules\Projects\Models\Project;
use Modules\Task\Models\Task;
use Modules\Theme\Models\Theme;
use Illuminate\Support\Facades\File;
use Chumper\Zipper\Zipper;
use Modules\Page\Models\Page;
use Modules\Helper\Helpers\WebHelper;
use Modules\Widget\Models\Widget;
use Modules\Region\Models\Region;

/**
 * Class ThemeRepository
 *
 * Theme create, update, delete and view.
 *
 * PHP version 7.1.3
 *
 * @category  PM
 * @package   Modules\Theme
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class ThemeRepository
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
	 * @param Request $request [Request for get themes]
	 *
	 * @return Object
	 */
	public function getAllThemes($request)
	{

		$theme = Theme::where('name', '!=', '');
		$totalData = $theme->count();
		$totalFiltered = $totalData;

		$columns = array(
			0 => 'id',
			1 => 'name',
			2 => 'description',
			3 => 'folder'
		);

		$limit = $request->input('length');
		$start = $request->input('start');
		$order = $columns[$request->input('order.0.column')];
		$dir = $request->input('order.0.dir');

		if (!empty($request->input('search.value'))) {
			$search = $request->input('search.value');

			$theme = $theme->where(
				function ($query) use ($search) {
					$query->where('name', 'LIKE', "%{$search}%")
					      ->orWhere('description', 'LIKE', "%{$search}%");
				}
			);

			$totalFiltered = $theme->count();
		}

		$theme = $theme->offset($start)
		                   ->limit($limit)
		                   ->orderBy($order, $dir)
		                   ->get();
       
		$json_data = array(
			"draw"            => intval($request->input('draw')),
			"recordsTotal"    => intval($totalData),
			"recordsFiltered" => intval($totalFiltered),
			"data"            => $theme
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
		DB::beginTransaction();
		try {
			$Theme = new Theme;
			$input = $request->all();
			$input['folder'] = strtolower(
				preg_replace('/\s+/', '_', $input['folder'])
			);
			if (!file_exists(resource_path('themes/'.$input['folder']))) {
				mkdir(resource_path('themes/'.$input['folder']), 0777, true);
			}
			$url = 'themes/'.$input['folder'].'/page.html';
			File::put(resource_path($url), $input['content_html']);
			$input['content_html'] = $url;
			$Theme->fill($input);
			if ($Theme->save()) {
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
		$theme = Theme::where('id', $id)->select('id', 'name', 'folder', 'description', 'content_html')->first();

		if ($theme) {
			$result = $theme;
			$result['content_html'] = file_get_contents(resource_path($result['content_html']));
			return $result;
		}

		return false;
	}

	public function update($request, $id)
	{
		DB::beginTransaction();
		try {
			$input = $request->all();
			$input['folder'] = strtolower(
				preg_replace('/\s+/', '_', $input['folder'])
			);

			$oldData = Theme::where('id', $id)->first();
			if($input['folder'] != $oldData['folder']){
				rename (resource_path('themes/'.$oldData['folder']), resource_path('themes/'.$input['folder']));
			}
			$url = 'themes/'.$input['folder'].'/page.html';
			File::put(resource_path($url), $input['content_html']);
			$input['content_html'] = $url;

			$theme = Theme::findOrFail($id);
			$theme->fill($input);
			if ($theme->save()) {
				$buildData = Page::pluck('id');
				foreach ($buildData as $value){
					$this->webHelper->buildPage($value);
				}
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
			$theme = Theme::find($id);
	  
	        if ($theme->delete()) {
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

	public function ImportTheme($request){
		$input = $request->all();
		$zipper = new \Chumper\Zipper\Zipper;
//		$logFiles = Zipper::make($input['folder'])->listFiles();

		$zipper->make('C:\Users\thuan\OneDrive\Desktop\www.corridorcapital.com.zip')->extractTo(resource_path('themes'));
		return true;
	}

	public function changeThemeStatus($request, $id)
	{
		$status = $request->get('status');
		$theme = Theme::findOrFail($id);
		$theme->status = $status;
		if($status == 1){
			if ($theme->save()) {
				Theme::where('id', '!=', $id)->update(['status' => 0]);
				$regionData = Region::get();
				if (!file_exists(resource_path('themes/'.$theme['folder'].'/regions'))) {
					mkdir(resource_path('themes/'.$theme['folder'].'/regions'), 0777, true);
				}
				foreach ($regionData as $key => $value) {
					$url = '/regions/'.$value['machine_name'].'.html';
					if (!file_exists(resource_path('themes/'.$theme['folder'].$url))) {
						File::put(resource_path('themes/'.$theme['folder'].$url), '');
					}
				}
				$widgetData = Widget::get();
				if (!file_exists(resource_path('themes/'.$theme['folder'].'/widgets'))) {
					mkdir(resource_path('themes/'.$theme['folder'].'/widgets'), 0777, true);
				}
				foreach ($regionData as $key => $value) {
					$url = '/widgets/'.$value['machine_name'].'.html';
					if (!file_exists(resource_path('themes/'.$theme['folder'].$url))) {
						File::put(resource_path('themes/'.$theme['folder'].$url), '');
					}
				}
				$buildData = Page::pluck('id');
				foreach ($buildData as $value){
					$this->webHelper->buildPage($value);
				}
				return true;
			}
		}
		return false;
	}
}
