<?php

namespace Modules\WidgetType\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;

use Modules\Helper\Helpers\AdminHelper;
use Modules\WidgetType\Http\Requests\UpdateWidgetTypeRequest;
use Modules\WidgetType\Http\Requests\CreateWidgetTypeRequest;
use Modules\WidgetType\Repositories\WidgetTypeRepository;
use Modules\Helper\Helpers\WebHelper;

class WidgetTypeController extends Controller
{
    protected $widgetTypeRepo;

    public function __construct(WidgetTypeRepository $widgetType, WebHelper $webHelper)
    {
        $this->widgetTypeRepo = $widgetType;
	    $this->webHelper = $webHelper;
    }

    public function index()
    {
        return $this->widgetTypeRepo->findAll();
    }
	public function getAllWidgetTypes(Request $request)
	{
		return $this->widgetTypeRepo->getAllWidgetTypes($request);
	}

	public function store(CreateWidgetTypeRequest $request)
	{
		$widgetType = $this->widgetTypeRepo->create($request);

		if (!empty($widgetType)) {
			if(isset($widgetType['status']) && isset($widgetType['msg']) && !$widgetType['status']){
				return response()->json(['error' => $widgetType['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(
				['error' => 'WidgetType has not been created.'],
				400
			);
		}
	}

	public function getById($id)
	{
		$widgetType = $this->widgetTypeRepo->getById($id);
		if ($widgetType) {
			return response()->json($widgetType);
		}
		return response()->json('error', 401);
	}

	public function update(UpdateWidgetTypeRequest $request, $id)
	{
		$widgetType = $this->widgetTypeRepo->update($request, $id);

		if ($widgetType) {
			if(isset($widgetType['status']) && isset($widgetType['msg']) && !$widgetType['status']){
				return response()->json(['error' => $widgetType['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(['error' => 'WidgetType has not been found.'], 400);
		}
	}
	public function delete($id)
	{
		$widgetType = $this->widgetTypeRepo->delete($id);

		if ($widgetType) {
			if(isset($widgetType['status']) && isset($widgetType['msg']) && !$widgetType['status']){
				return response()->json(['error' => $widgetType['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(['error' => 'WidgetType has not been found.'], 400);
		}
	}
	public function getAllManagerWidgets(Request $request)
	{
		return $this->widgetTypeRepo->getAllManagerWidgets($request);
	}

	public  function addField(Request $request){
		$addWidget = $this->widgetTypeRepo->addField($request);

		if (!empty($addWidget)) {
			return response()->json('success');
		} else {
			return response()->json(
				['error' => 'Add Widget has not been created.'],
				400
			);
		}
	}

	public function getFieldById($id)
	{
		$includeWidget = $this->widgetTypeRepo->getFieldById($id);
		if ($includeWidget) {
			return response()->json($includeWidget);
		}
		return response()->json('error', 401);
	}

	public function updateFieldInWidget(Request $request, $id){
		$includeWidget = $this->widgetTypeRepo->updateFieldInWidget($request, $id);

		if ($includeWidget) {
			return response()->json('success');
		} else {
			return response()->json(['error' => 'Manager Widget has not been found.'], 400);
		}
	}

	public function deleteManagerWidget($id)
	{
		$includeWidget = $this->widgetTypeRepo->deleteManagerWidget($id);

		if ($includeWidget) {
			return response()->json('success');
		} else {
			return response()->json(['error' => 'Manager Widget has not been found.'], 400);
		}
	}

	public function getAllFields(){
		$fields = $this->webHelper->getAllFields();
		$renderType = [
			['name'=>'Single', 'value'=>0],
			['name'=>'Multiple', 'value'=>1]
		];
		return ['data'=>$fields, 'render_type'=>$renderType];
	}
}
