<?php
namespace Modules\Widget\Repositories;

use Auth;
use DB;
use Modules\Defect\Models\Defect;
use Modules\Helper\Helpers\CommonHelper;
use Modules\Incident\Models\Incident;
use Modules\Collections\Models\Collections;
use Modules\Categorys\Models\Categorys;
use Modules\Widget\Models\Widget;
use Modules\Posts\Models\Posts;
use Modules\WebMenu\Models\WebMenu;
use Modules\Widget\Models\WidgetData;
use Modules\Widget\Models\WidgetsDataRelate;
use Modules\Widget\Models\WidgetTranslation;
use Illuminate\Support\Facades\File;
use Modules\WidgetType\Models\WidgetTypeField;
use Modules\Page\Models\IncludeWidget;
use Modules\Helper\Helpers\WebHelper;
use Storage;

/**
 * Class WidgetRepository
 *
 * Widget create, update, delete and view.
 *
 * PHP version 7.1.3
 *
 * @category  PM
 * @package   Modules\Widget
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class WidgetRepository
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
		return Widget::join('web_widgets_translation', 'web_widgets.id', '=', 'web_widgets_translation.widgets_id')->where('web_widgets_translation.langcode', 'vi')->select('*', 'web_widgets.id as id')->get();
	}

	public function getUseData()
	{
		$categorys1 = Categorys::join('web_po_cates_translation', 'web_po_cates_translation.po_cates_id', 'web_po_cates.id')->where('langcode', 'vi')->where('po_types_indentify', 'news')->select('*', 'web_po_cates.id as id')->get();
		$categorys2 = Categorys::join('web_po_cates_translation', 'web_po_cates_translation.po_cates_id', 'web_po_cates.id')->where('langcode', 'vi')->where('po_types_indentify', 'products')->select('*', 'web_po_cates.id as id')->get();
		$collections1 = Collections::join('web_collections_translation', 'web_collections_translation.collections_id', 'web_collections.id')->where('langcode', 'vi')->where('po_types_indentify', 'news')->select('*', 'web_collections.id as id')->get();
		$collections2 = Collections::join('web_collections_translation', 'web_collections_translation.collections_id', 'web_collections.id')->where('langcode', 'vi')->where('po_types_indentify', 'products')->select('*', 'web_collections.id as id')->get();
		$product1 = Posts::join('web_posts_translation', 'web_posts_translation.posts_id', 'web_posts.id')->where('web_posts_translation.langcode', 'vi')->where('po_types_indentify', 'news')->select('*', 'web_posts.id as id')->get();
		$product2 = Posts::join('web_posts_translation', 'web_posts_translation.posts_id', 'web_posts.id')->where('web_posts_translation.langcode', 'vi')->where('po_types_indentify', 'products')->select('*', 'web_posts.id as id')->get();
		$menus = WebMenu::get();
		return [[
				'data'=>$categorys1,
				'name'=>'Category (News)',
				'id'=>1,
				'data_hint'=> $this->webHelper->getDataHint(1)
			],[
				'data'=>$categorys2,
				'name'=>'Category (Product)',
				'id'=>2,
				'data_hint'=>$this->webHelper->getDataHint(2)
			],[
				'data'=>[],
				'name'=>'Category Details',
				'id'=>3,
				'data_hint'=>$this->webHelper->getDataHint(3)
			],[
				'data'=>$collections1,
				'name'=>'Collection (News)',
				'id'=>4,
				'data_hint'=>$this->webHelper->getDataHint(4)
			],[
				'data'=>$collections2,
				'name'=>'Collection (Product)',
				'id'=>5,
				'data_hint'=>$this->webHelper->getDataHint(5)
			],[
				'data'=>[],
				'name'=>'Collection Details',
				'id'=>6,
				'data_hint'=>$this->webHelper->getDataHint(6)
			],[
				'data'=>$product2,
				'name'=>'Products',
				'id'=>7,
				'data_hint'=>$this->webHelper->getDataHint(7)
			],[
				'data'=>[],
				'name'=>'Products Details',
				'id'=>8,
				'data_hint'=>$this->webHelper->getDataHint(8)
			],[
				'data'=>$product1,
				'name'=>'News',
				'id'=>9,
				'data_hint'=>$this->webHelper->getDataHint(9)
			],[
				'data'=>[],
				'name'=>'News Details',
				'id'=>10,
				'data_hint'=>$this->webHelper->getDataHint(10)
			],[
				'data'=>$menus,
				'name'=>'Menus',
				'id'=>11,
				'data_hint'=>$this->webHelper->getDataHint(11)
			]];
	}

	public function getAllWidgets($request)
	{

		$widget = Widget::join('web_custom_widget_types', 'web_custom_widget_types.id', '=', 'web_widgets.widget_type_id')->join('web_widgets_translation', 'web_widgets.id', '=', 'web_widgets_translation.widgets_id')->where('web_widgets_translation.langcode', 'vi');
		$totalData = $widget->count();
		$totalFiltered = $totalData;

		$columns = array(
			0 => 'web_widgets.id',
			1 => 'web_widgets_translation.name',
			2 => 'web_widgets_translation.description',
			3 => 'web_custom_widget_types.name'
		);

		$limit = $request->input('length');
		$start = $request->input('start');
		$order = $columns[$request->input('order.0.column')];
		$dir = $request->input('order.0.dir');

		if (!empty($request->input('search.value'))) {
			$search = $request->input('search.value');

			$widget = $widget->where(
				function ($query) use ($search) {
					$query->where('web_widgets_translation.name', 'LIKE', "%{$search}%")
					      ->orWhere('web_widgets_translation.description', 'LIKE', "%{$search}%")
						->orWhere('web_custom_widget_types.name', 'LIKE', "%{$search}%");
				}
			);

			$totalFiltered = $widget->count();
		}

		$widget = $widget->offset($start)
		                   ->limit($limit)
		                   ->orderBy($order, $dir)
		                   ->select('web_widgets.*', 'web_widgets_translation.name', 'web_widgets_translation.description', 'web_custom_widget_types.name as widget_type_name')
		                   ->get();
       
		$json_data = array(
			"draw"            => intval($request->input('draw')),
			"recordsTotal"    => intval($totalData),
			"recordsFiltered" => intval($totalFiltered),
			"data"            => $widget
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
		$widget = new Widget;
		$input = $request->all();
		$input['machine_name'] = $this->webHelper->stripVN($input['name']);

		$themeActive = $this->webHelper->getThemeActive();
		if (!file_exists(resource_path('themes/'.$themeActive['folder'].'/widgets'))) {
			mkdir(resource_path('themes/'.$themeActive['folder'].'/widgets'), 0777, true);
		}
		DB::beginTransaction();
			try {
			$url = '/widgets/'.$input['machine_name'].'.html';
			File::put(resource_path('themes/'.$themeActive['folder'].$url), $input['content_html']);
			$input['content_html'] = $url;
			$widget->fill($input);
			if ($widget->save()) {
				WidgetTranslation::insert([
					'name'=>$input['name'],
			        'description'=>$input['description'],
			        'langcode'=>'vi',
			        'widgets_id'=>$widget->id,
				    'custom_field'=>isset($input['custom_field']) ? $input['custom_field'] : null,
				    'custom_field_multiple'=>isset($input['custom_field_multiple']) ? $input['custom_field_multiple'] : null
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
		$widget = Widget::join('web_widgets_translation', 'web_widgets.id', '=', 'web_widgets_translation.widgets_id')->leftJoin('web_widgets_data', 'web_widgets.id', '=', 'web_widgets_data.widgets_id')->where('web_widgets_translation.langcode', 'vi')->where('web_widgets.id', $id)->select('*', 'web_widgets.id as id')->first();
		$widget->data_id = json_decode($widget->data_id);
		if ($widget) {
			$customFields = [];

			$customFields['single'] = WidgetTypeField::join('web_fields', 'web_fields.id', '=', 'web_custom_widget_type_fields.field_id')
			                                         ->where('web_custom_widget_type_fields.widget_type_id', $widget->widget_type_id)->where('web_custom_widget_type_fields.render_type', 0)->select('web_custom_widget_type_fields.label as field_label',
				'web_custom_widget_type_fields.machine_name as field_column', 'web_custom_widget_type_fields.select_options', 'web_fields.machine_name as field_type', 'web_custom_widget_type_fields.id', 'web_custom_widget_type_fields.is_required', 'web_custom_widget_type_fields.index')->orderBy('index')->get();
			$customFields['multiple'] = WidgetTypeField::join('web_fields', 'web_fields.id', '=', 'web_custom_widget_type_fields.field_id')
			                                           ->where('web_custom_widget_type_fields.widget_type_id', $widget->widget_type_id)->where('web_custom_widget_type_fields.render_type', 1)->select('web_custom_widget_type_fields.label as field_label',
				'web_custom_widget_type_fields.machine_name as field_column', 'web_custom_widget_type_fields.select_options', 'web_fields.machine_name as field_type', 'web_custom_widget_type_fields.id', 'web_custom_widget_type_fields.is_required', 'web_custom_widget_type_fields.index')->orderBy('index')->get();

			$widget->custom_field = json_decode($widget->custom_field);
			$widget->custom_field_multiple = json_decode($widget->custom_field_multiple);
			$result = $widget;
			$themeActive = $this->webHelper->getThemeActive();
			if(file_exists(resource_path('themes/'.$themeActive['folder'].$result['content_html']))){
				$result['content_html'] = file_get_contents(resource_path('themes/' . $themeActive['folder'] . $result['content_html']));
			} else {
				$result['content_html'] = '';
			}
			return ['data'=>$result, 'customFields'=>$customFields];
		}

		return false;
	}
	function is_base64($str){
		if ( base64_encode(base64_decode($str, true)) === $str){
			return true;
		} else {
			return false;
		}
	}
	public function update($request, $id)
	{
		$input = $request->all();
		$input['machine_name'] = $this->webHelper->stripVN($input['name']);
		$themeActive = $this->webHelper->getThemeActive();
		if (!file_exists(resource_path('themes/'.$themeActive['folder'].'/widgets'))) {
			mkdir(resource_path('themes/'.$themeActive['folder'].'/widgets'), 0777, true);
		}
		$url = '/widgets/'.$input['machine_name'].'.html';
		DB::beginTransaction();
			try {
			File::put(resource_path('themes/'.$themeActive['folder'].$url), $input['content_html']);
			$input['content_html'] = $url;
			if(isset($input['custom_field_multiple'])){
				foreach ($input['custom_field_multiple'] as $key => $value){
					foreach ($value as $key2 => $value2){
						if(strpos($value2, ';base64,')){
							$input['custom_field_multiple'][$key][$key2] = $this->webHelper->_uploadImage($value2, 'project_uploads');
						}
					}
				}
				$input['custom_field_multiple'] = json_encode($input['custom_field_multiple']);
			}
			if(isset($input['custom_field'])){
				foreach ($input['custom_field'] as $key => $value){
					foreach ($value as $key2 => $value2){
						if(strpos($value2, ';base64,')){
							$input['custom_field'][$key][$key2] = $this->webHelper->_uploadImage($value2, 'project_uploads');
						}
					}
				}
				$input['custom_field'] = json_encode($input['custom_field']);
			}

			$widget = Widget::findOrFail($id);
			$widget->fill($input);
			if ($widget->save()) {
				WidgetTranslation::where('langcode', 'vi')->where(
			        'widgets_id', $widget->id)->update([
					'name'=>$input['name'],
			        'description'=>$input['description'],
				    'custom_field'=>isset($input['custom_field']) ? $input['custom_field'] : null,
				    'custom_field_multiple'=>isset($input['custom_field_multiple']) ? $input['custom_field_multiple'] : null
				]);
		        WidgetData::where('widgets_id', $id)->delete();
				if(isset($input['data_id']) && $input['data_id'] && isset($input['data_type']) && $input['data_type']){
					WidgetData::create([
						'data_id'=>json_encode($input['data_id']),
				        'data_type'=>$input['data_type'],
				        'widgets_id'=>$id
					]);
				}

				$buildData = IncludeWidget::where('widgets_id', $id)->groupBy('pages_id')->pluck('pages_id');
				foreach ($buildData as $value){
					$this->webHelper->buildPage($value);
				}
			        
				DB::commit();
				return true;
			}
        } catch (\Exception $e) {
		    DB::rollback();
		    dd($e);
		    return $this->webHelper->ParseException($e);
		}
		return false;
	}
	public function delete($id)
	{
		DB::beginTransaction();
		try {
			WidgetTranslation::where('widgets_id', $id)->delete();
			Widget::where('id', $id)->delete();
			DB::commit();
			return true;
        } catch (\Exception $e) {
		    DB::rollback();
		    return $this->webHelper->ParseException($e);
		}
	}
}
