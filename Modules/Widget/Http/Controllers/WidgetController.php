<?php

namespace Modules\Widget\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;

use Modules\Helper\Helpers\AdminHelper;
use Modules\Widget\Http\Requests\UpdateWidgetRequest;
use Modules\Widget\Http\Requests\CreateWidgetRequest;
use Modules\Widget\Repositories\WidgetRepository;

class WidgetController extends Controller
{
    protected $widgetRepo;

    public function __construct(WidgetRepository $widget)
    {
        $this->widgetRepo = $widget;
    }

    public function index()
    {
        return $this->widgetRepo->findAll();
    }
	public function getAllWidgets(Request $request)
	{
		return $this->widgetRepo->getAllWidgets($request);
	}

	public function store(CreateWidgetRequest $request)
	{
		$widget = $this->widgetRepo->create($request);

		if (!empty($widget)) {
			if(isset($widget['status']) && isset($widget['msg']) && !$widget['status']){
				return response()->json(['error' => $widget['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(
				['error' => 'Widget has not been created.'],
				400
			);
		}
	}

	public function getById($id)
	{
		$widget = $this->widgetRepo->getById($id);
		if ($widget) {
			return response()->json($widget);
		}
		return response()->json('error', 401);
	}

	public function update(UpdateWidgetRequest $request, $id)
	{
		$widget = $this->widgetRepo->update($request, $id);
		if ($widget) {
			if(isset($widget['status']) && isset($widget['msg']) && !$widget['status']){
				return response()->json(['error' => $widget['msg']], 400);
			} else {
				return response()->json('success');
			}
			return response()->json('success');
		} else {
			return response()->json(['error' => 'Widget has not been found.'], 400);
		}
	}
	public function delete($id)
	{
		$widget = $this->widgetRepo->delete($id);

		if ($widget) {
			if(isset($widget['status']) && isset($widget['msg']) && !$widget['status']){
				return response()->json(['error' => $widget['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(['error' => 'Widget has not been found.'], 400);
		}
	}
	public function getUseData()
	{
		$data = $this->widgetRepo->getUseData();
		if ($data) {
			return response()->json($data);
		}
		return response()->json('error', 402);
	}

}
