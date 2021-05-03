<?php

namespace Modules\Categorys\Http\Controllers;

use Auth;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\Helper\Helpers\AdminHelper;
use Modules\Helper\Http\Controllers\PmHelperController;
use Modules\Categorys\Http\Requests\CreateCategoryRequest;
use Modules\Categorys\Http\Requests\UpdateCategoryRequest;
use Modules\Categorys\Repositories\CategoryRepository;
use Modules\Page\Models\Page;

/**
 * Class CategorysController
 *
 * Category create, update, delete and view.
 *
 * PHP version 7.1.3
 *
 * @category  PM
 * @package   Modules\Categorys
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class CategorysController extends Controller
{
	protected $categoryRepo;

	/**
	 * Instantiate a new repository instance.
	 *
	 * @param CategoryRepository $categoryRepo [Object]
	 *
	 * @return void
	 */
	public function __construct(CategoryRepository $categoryRepo)
	{
		$this->categoryRepo = $categoryRepo;
	}

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return $this->categoryRepo->findAll();
	}

	public function getAllCategorys(Request $request)
	{
		return $this->categoryRepo->getAllCategorys($request);
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @param Request $request [Request for create category]
	 *
	 * @return Response
	 */
	public function store(CreateCategoryRequest $request)
	{
		// if (!AdminHelper::can_action(43, 'created')) {
		// 	return response()->json("Access denied", 403);
		// }

		$category = $this->categoryRepo->create($request);

		if ($category) {
			if(isset($category['status']) && isset($category['msg']) && !$category['status']){
				return response()->json(['error' => $category['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json('error', 402);
		}
	}

	/**
	 * Show the specified resource.
	 *
	 * @param Int $id [Row id]
	 *
	 * @return Response
	 */
	public function show($id)
	{
		$category = $this->categoryRepo->findById($id);
		if ($category) {
			return response()->json($category);
		}
		return response()->json('error', 401);
	}

	/**
	 * Show the specified resource.
	 *
	 * @param Int $id [Row id]
	 *
	 * @return Response
	 */
	public function getCategoryById($id)
	{
		if (!AdminHelper::can_action(43, 'view')) {
			return response()->json("Access denied", 403);
		}

		$category = $this->categoryRepo->getCategoryById($id);
		if ($category) {
			return response()->json($category);
		}
		return response()->json('error', 401);
	}

	public function getTemplate()
	{
		$data = Page::join('web_pages_translation', 'web_pages_translation.pages_id', '=', 'web_pages.id')->where('web_pages_translation.langcode', 'vi')->get();
		$data = $this->categoryRepo->getTemplate();
		if ($data) {
			return response()->json($data);
		}
		return response()->json('error', 401);
	}

	public function update(UpdateCategoryRequest $request, $id)
	{
		$category = $this->categoryRepo->update($request, $id);

		if ($category) {
			if(isset($category['status']) && isset($category['msg']) && !$category['status']){
				return response()->json(['error' => $category['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json('error', 402);
		}
	}

	public function destroy(Request $request, $id)
	{
		$category = $this->categoryRepo->delete($request, $id);
		if ($category) {
            if(isset($category['status']) && isset($category['msg']) && !$category['status']){
				return response()->json(['error' => $category['msg']], 400);
			} else {
				return response()->json('success');
			}
        } else {
            return response()->json('error', 401);
        }
	}

	/**
	 * Change category status.
	 *
	 * @param Request $request [Request for change category status]
	 * @param Int     $id      [Row id]
	 *
	 * @return Response
	 */
	public function changeCategorystatus(Request $request, $id)
	{
		// --
		// Check category user permission
		if (!$this->categoryRepo->checkPermission($id, 'edit')) {
			return response()->json("Access denied", 403);
		}
		
		if ($this->categoryRepo->changeCategoryStatus($request, $id)) {
			return response()->json('success');
		} else {
			return response()->json('error', 401);
		}
	}
	public function getCategoryPermission(Request $request, $id)
	{
		$response['view'] = $this->categoryRepo->checkPermission($id, 'view');
		$response['edit'] = $this->categoryRepo->checkPermission($id, 'edit');
		$response['delete'] = $this->categoryRepo->checkPermission($id, 'delete');
		return $response;
	}
}
