<?php
namespace Modules\WidgetType\Repositories;

use Auth;
use DB;
use Modules\Defect\Models\Defect;
use Modules\Helper\Helpers\CommonHelper;
use Modules\Incident\Models\Incident;
use Modules\Projects\Models\Project;
use Modules\Task\Models\Task;
use Modules\WidgetType\Models\WidgetType;
use Illuminate\Support\Facades\File;
use Modules\Template\Models\TemplateRegion;
use Modules\WidgetType\Models\WidgetTypeField;
use Modules\Helper\Helpers\WebHelper;


/**
 * Class WidgetTypeRepository
 *
 * WidgetType create, update, delete and view.
 *
 * PHP version 7.1.3
 *
 * @category  PM
 * @package   Modules\WidgetType
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class WidgetTypeRepository
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
		return WidgetType::get();
	}

	public function getAllWidgetTypes($request)
	{
		$widgetType = WidgetType::where('id', '>', 0);
		$totalData = $widgetType->count();
		$totalFiltered = $totalData;

		$columns = array(
			0 => 'id',
			1 => 'name',
			2 => 'description'
		);

		$limit = $request->input('length');
		$start = $request->input('start');
		$order = $columns[$request->input('order.0.column')];
		$dir = $request->input('order.0.dir');

		if (!empty($request->input('search.value'))) {
			$search = $request->input('search.value');

			$widgetType = WidgetType::where(
				function ($query) use ($search) {
					$query->where('name', 'LIKE', "%{$search}%")
					      ->orWhere('description', 'LIKE', "%{$search}%");
				}
			);

			$totalFiltered = $widgetType->count();
		}

		$widgetType = $widgetType->offset($start)
		                   ->limit($limit)
		                   ->orderBy($order, $dir)
		                   ->get();
       
		$json_data = array(
			"draw"            => intval($request->input('draw')),
			"recordsTotal"    => intval($totalData),
			"recordsFiltered" => intval($totalFiltered),
			"data"            => $widgetType
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
			$WidgetType = new WidgetType;
			$input = $request->all();
			$input['machine_name'] = $this->webHelper->stripVN($input['name']);
			$WidgetType->fill($input);
			if ($WidgetType->save()) {
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
		$widgetType = WidgetType::where('id', $id)->first();

		if ($widgetType) {
			return $widgetType;
		}

		return false;
	}

	public function update($request, $id)
	{
		DB::beginTransaction();
		try {
			$input = $request->all();
			$input['machine_name'] = $this->webHelper->stripVN($input['name']);
			$widgetType = WidgetType::findOrFail($id);
			$widgetType->fill($input);
			if ($widgetType->save()) {
	//			$this->webHelper->buildWidgetType($widgetType->id);
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
			$widgetType = WidgetType::find($id);
	  
	        if ($widgetType->delete()) {
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


	public function getAllManagerWidgets($request)
	{
		$widgetType = WidgetType::where('id', $request->input('widget_type_id'))->first();
		$widgetTypeFeild = WidgetType::join('web_custom_widget_type_fields', 'web_custom_widget_type_fields.widget_type_id', '=', 'web_custom_widget_types.id')
		                        ->join('web_fields', 'web_fields.id', '=', 'web_custom_widget_type_fields.field_id')
		                        ->where('web_custom_widget_types.id', $request->input('widget_type_id'));
		$totalData = $widgetTypeFeild->count();
		$totalFiltered = $totalData;

		$columns = array(
			0 => 'web_custom_widget_type_fields.index',
			1 => 'web_fields.name',
			2 => 'web_custom_widget_type_fields.label',
			3 => 'web_custom_widget_type_fields.is_required',
			4 => 'web_custom_widget_type_fields.render_type',
			5 => 'web_custom_widget_type_fields.index'
		);

		$limit = $request->input('length');
		$start = $request->input('start');
		$order = $columns[$request->input('order.0.column')];
		$dir = $request->input('order.0.dir');

		if (!empty($request->input('search.value'))) {
			$search = $request->input('search.value');

			$widgetTypeFeild = WidgetType::where(
				function ($query) use ($search) {
					$query->where('web_fields.name', 'LIKE', "%{$search}%")
					      ->orWhere('web_custom_widget_type_fields.label', 'LIKE', "%{$search}%")
						->orWhere('web_custom_widget_type_fields.index', 'LIKE', "%{$search}%");
				}
			);

			$totalFiltered = $widgetTypeFeild->count();
		}

		$widgetTypeFeild = $widgetTypeFeild->select('web_fields.name as field_name', 'web_custom_widget_type_fields.*')->offset($start)
		                         ->limit($limit)
		                         ->orderBy($order, $dir)
		                         ->get();

		$json_data = array(
			"draw"            => intval($request->input('draw')),
			"recordsTotal"    => intval($totalData),
			"recordsFiltered" => intval($totalFiltered),
			"data"            => $widgetTypeFeild,
			"parentData"  => $widgetType,
		);

		return $json_data;
	}

	public function addField($request)
	{
		$includeField = new WidgetTypeField;
		$input = $request->all();
		$input['machine_name'] = $this->webHelper->stripVN($input['label']);
		$input['select_options'] = json_encode($input['select_options']);

		$includeField->fill($input);
		if ($includeField->save()) {
//			$this->webHelper->buildWidgetType($includeField->widgetTypes_id);
			return true;
		}
		return false;
	}

	public function getFieldById($id)
	{
		$widgetTypeField = WidgetTypeField::where('id', $id)->first();
		$widgetTypeField['select_options'] = json_decode($widgetTypeField['select_options']);
		if ($widgetTypeField) {
			return $widgetTypeField;
		}

		return false;
	}

	public function updateFieldInWidget($request, $id)
	{
		$input = $request->all();
		$input['machine_name'] = $this->webHelper->stripVN($input['label']);
		$input['select_options'] = json_encode($input['select_options']);
		$widgetTypeField = WidgetTypeField::findOrFail($id);
		$widgetTypeField->fill($input);
		if ($widgetTypeField->save()) {
//			$this->webHelper->buildWidgetType($widgetTypeField->widgetTypes_id);
			return true;
		}
		return false;
	}

	public function deleteManagerWidget($id)
	{
		$includeWidget = WidgetTypeField::find($id);

		if ($includeWidget->delete()) {
			return true;
		} else {
			return false;
		}
	}
}
