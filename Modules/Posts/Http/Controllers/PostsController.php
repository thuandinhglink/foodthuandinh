<?php

namespace Modules\Posts\Http\Controllers;

use Auth;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\Helper\Helpers\AdminHelper;
use Modules\Helper\Http\Controllers\PmHelperController;
use Modules\Posts\Http\Requests\CreatePostsRequest;
use Modules\Posts\Http\Requests\UpdatePostsRequest;
use Modules\Posts\Repositories\PostsRepository;
use Modules\Page\Models\Page;

/**
 * Class PostsController
 *
 * Post create, update, delete and view.
 *
 * PHP version 7.1.3
 *
 * @Post  PM
 * @package   Modules\Posts
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class PostsController extends Controller
{
	protected $PostRepo;

	/**
	 * Instantiate a new repository instance.
	 *
	 * @param PostRepository $PostRepo [Object]
	 *
	 * @return void
	 */
	public function __construct(PostsRepository $PostRepo)
	{
		$this->PostRepo = $PostRepo;
	}

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return $this->PostRepo->findAll();
	}

	public function getAllPosts(Request $request)
	{
		return $this->PostRepo->getAllPosts($request);
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @param Request $request [Request for create Post]
	 *
	 * @return Response
	 */
	public function store(CreatePostsRequest $request)
	{
		// --
		// Check role/permission
		// if (!AdminHelper::can_action(43, 'created')) {
		// 	return response()->json("Access denied", 403);
		// }

		$Post = $this->PostRepo->create($request);

		if ($Post) {
			if(isset($Post['status']) && isset($Post['msg']) && !$Post['status']){
				return response()->json(['error' => $Post['msg']], 400);
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
		$Post = $this->PostRepo->findById($id);
		if ($Post) {
			return response()->json($Post);
		}
		return response()->json('error', 402);
	}

	/**
	 * Show the specified resource.
	 *
	 * @param Int $id [Row id]
	 *
	 * @return Response
	 */
	public function getPostById($id)
	{
		// --
		// Check role/permission
		if (!AdminHelper::can_action(43, 'view')) {
			return response()->json("Access denied", 403);
		}

		$Post = $this->PostRepo->getPostById($id);
		if ($Post) {
			return response()->json($Post);
		}
		return response()->json('error', 402);
	}

	public function getTemplate()
	{
		$data = Page::join('web_pages_translation', 'web_pages_translation.pages_id', '=', 'web_pages.id')->where('web_pages_translation.langcode', 'vi')->get();
		$data = $this->PostRepo->getTemplate();
		if ($data) {
			return response()->json($data);
		}
		return response()->json('error', 401);
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param Request $request [Request for update Post]
	 * @param Int     $id      [Row id]
	 *
	 * @return Response
	 */
	public function update(UpdatePostsRequest $request, $id)
	{
		// if (!PmHelperController::canUserAction( $id, 'edit' )) {
		//     return response()->json("Access denied", 403);
		// }

		// --
		// Check Post user permission
		// if (!$this->PostRepo->checkPermission($id, 'edit')) {
		// 	return response()->json("Access denied", 403);
		// }

		$Post = $this->PostRepo->update($request, $id);

		if ($Post) {
			if(isset($Post['status']) && isset($Post['msg']) && !$Post['status']){
				return response()->json(['error' => $Post['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json('error', 402);
		}
	}
	
	public function destroy(Request $request, $id)
	{
		$Post = $this->PostRepo->delete($id);
		if ($Post) {
			if(isset($Post['status']) && isset($Post['msg']) && !$Post['status']){
				return response()->json(['error' => $Post['msg']], 400);
			} else {
				return response()->json('success');
			}
        } else {
            return response()->json('error', 401);
        }
	}
	public function getPostPermission(Request $request, $id)
	{
		$response['view'] = $this->PostRepo->checkPermission($id, 'view');
		$response['edit'] = $this->PostRepo->checkPermission($id, 'edit');
		$response['delete'] = $this->PostRepo->checkPermission($id, 'delete');
		return $response;
	}
}
