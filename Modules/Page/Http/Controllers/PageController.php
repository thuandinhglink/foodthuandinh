<?php

namespace Modules\Page\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;

use Modules\Helper\Helpers\AdminHelper;
use Modules\Page\Http\Requests\UpdatePageRequest;
use Modules\Page\Http\Requests\CreatePageRequest;
use Modules\Page\Repositories\PageRepository;

class PageController extends Controller
{
    protected $pageRepo;

    public function __construct(PageRepository $page)
    {
        $this->pageRepo = $page;
    }

    public function index()
    {
        return $this->pageRepo->findAll();
    }
	public function getAllPages(Request $request)
	{
		return $this->pageRepo->getAllPages($request);
	}

	public function store(CreatePageRequest $request)
	{
		$page = $this->pageRepo->create($request);

		if (!empty($page)) {
			if(isset($page['status']) && isset($page['msg']) && !$page['status']){
				return response()->json(['error' => $page['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(
				['error' => 'Page has not been created.'],
				400
			);
		}
	}

	public function getById($id)
	{
		$page = $this->pageRepo->getById($id);
		if ($page) {
			return response()->json($page);
		}
		return response()->json('error', 401);
	}

	public function update(UpdatePageRequest $request, $id)
	{
		$page = $this->pageRepo->update($request, $id);

		if ($page) {
			if(isset($page['status']) && isset($page['msg']) && !$page['status']){
				return response()->json(['error' => $page['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(['error' => 'Page has not been found.'], 400);
		}
	}
	public function delete($id)
	{
		$page = $this->pageRepo->delete($id);

		if ($page) {
			if(isset($page['status']) && isset($page['msg']) && !$page['status']){
				return response()->json(['error' => $page['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(['error' => 'Page has not been found.'], 400);
		}
	}
	public function getAllManagerWidgets(Request $request)
	{
		return $this->pageRepo->getAllManagerWidgets($request);
	}

	public  function addWidget(Request $request){
		$addWidget = $this->pageRepo->addWidget($request);

		if (!empty($addWidget)) {
			if(isset($addWidget['status']) && isset($addWidget['msg']) && !$addWidget['status']){
				return response()->json(['error' => $addWidget['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(
				['error' => 'Add Widget has not been created.'],
				400
			);
		}
	}

	public function getWidgetById($id)
	{
		$includeWidget = $this->pageRepo->getWidgetById($id);
		if ($includeWidget) {
			return response()->json($includeWidget);
		}
		return response()->json('error', 401);
	}

	public function updateManagerWidget(Request $request, $id){
		$includeWidget = $this->pageRepo->updateManagerWidget($request, $id);

		if ($includeWidget) {
			if(isset($includeWidget['status']) && isset($includeWidget['msg']) && !$includeWidget['status']){
				return response()->json(['error' => $includeWidget['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(['error' => 'Manager Widget has not been found.'], 400);
		}
	}

	public function deleteManagerWidget($id)
	{
		$includeWidget = $this->pageRepo->deleteManagerWidget($id);

		if ($includeWidget) {
			if(isset($includeWidget['status']) && isset($includeWidget['msg']) && !$includeWidget['status']){
				return response()->json(['error' => $includeWidget['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(['error' => 'Manager Widget has not been found.'], 400);
		}
	}

	public function clonePage($id)
	{
		$clonePage = $this->pageRepo->clonePage($id);

		if ($clonePage) {
			if(isset($clonePage['status']) && isset($clonePage['msg']) && !$clonePage['status']){
				return response()->json(['error' => $clonePage['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(['error' => 'Manager Widget has not been found.'], 400);
		}
	}

	public function changeStatus(Request $request, $id){
		$changeStatus = $this->pageRepo->changeStatus($request,$id);

		if ($changeStatus) {
			if(isset($changeStatus['status']) && isset($changeStatus['msg']) && !$changeStatus['status']){
				return response()->json(['error' => $changeStatus['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(['error' => 'Manager Widget has not been found.'], 400);
		}
	}
}
