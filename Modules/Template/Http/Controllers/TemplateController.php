<?php

namespace Modules\Template\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;

use Modules\Helper\Helpers\AdminHelper;
use Modules\Template\Http\Requests\UpdateTemplateRequest;
use Modules\Template\Http\Requests\CreateTemplateRequest;
use Modules\Template\Repositories\TemplateRepository;

class TemplateController extends Controller
{
    protected $templateRepo;

    public function __construct(TemplateRepository $template)
    {
        $this->templateRepo = $template;
    }

    public function index()
    {
        return $this->templateRepo->findAll();
    }
	public function getAllTemplates(Request $request)
	{
		return $this->templateRepo->getAllTemplates($request);
	}

	public function store(CreateTemplateRequest $request)
	{
		$template = $this->templateRepo->create($request);

		if (!empty($template)) {
			if(isset($template['status']) && isset($template['msg']) && !$template['status']){
				return response()->json(['error' => $template['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(
				['error' => 'Template has not been created.'],
				400
			);
		}
	}

	public function getById($id)
	{
		$template = $this->templateRepo->getById($id);
		if ($template) {
			return response()->json($template);
		}
		return response()->json('error', 401);
	}

	public function update(UpdateTemplateRequest $request, $id)
	{
		$template = $this->templateRepo->update($request, $id);

		if ($template) {
			if(isset($template['status']) && isset($template['msg']) && !$template['status']){
				return response()->json(['error' => $template['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(['error' => 'Template has not been found.'], 400);
		}
	}
	public function delete($id)
	{
		$template = $this->templateRepo->delete($id);

		if ($template) {
			if(isset($template['status']) && isset($template['msg']) && !$template['status']){
				return response()->json(['error' => $template['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(['error' => 'Template has not been found.'], 400);
		}
	}

	public function getAllManagerRegions(Request $request)
	{
		return $this->templateRepo->getAllManagerRegions($request);
	}

	public  function addRegion(Request $request){
		$addRegion = $this->templateRepo->addRegion($request);

		if (!empty($addRegion)) {
			return response()->json('success');
		} else {
			return response()->json(
				['error' => 'Add Region has not been created.'],
				400
			);
		}
	}

	public function getRegionById($id)
	{
		$templateRegion = $this->templateRepo->getRegionById($id);
		if ($templateRegion) {
			return response()->json($templateRegion);
		}
		return response()->json('error', 401);
	}

	public function updateManagerRegion(Request $request, $id){
		$template = $this->templateRepo->updateManagerRegion($request, $id);

		if ($template) {
			return response()->json('success');
		} else {
			return response()->json(['error' => 'Manager Region has not been found.'], 400);
		}
	}

	public function deleteManagerRegion($id)
	{
		$template = $this->templateRepo->deleteManagerRegion($id);

		if ($template) {
			return response()->json('success');
		} else {
			return response()->json(['error' => 'Manager Region has not been found.'], 400);
		}
	}

	public function changeStatus(Request $request, $id){
		$changeStatus = $this->templateRepo->changeStatus($request,$id);

		if ($changeStatus) {
			return response()->json('success');
		} else {
			return response()->json(['error' => 'Manager Region has not been found.'], 400);
		}
	}
}
