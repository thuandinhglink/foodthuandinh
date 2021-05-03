<?php

namespace Modules\Options\Http\Controllers;

use Auth;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\Helper\Helpers\AdminHelper;
use Modules\Helper\Http\Controllers\PmHelperController;
use Modules\Options\Http\Requests\CreateOptionRequest;
use Modules\Options\Http\Requests\UpdateOptionRequest;
use Modules\Options\Repositories\OptionsRepository;
use Modules\Page\Models\Page;

/**
 * Class OptionsController
 *
 * Options create, update, delete and view.
 *
 * PHP version 7.1.3
 *
 * @options  PM
 * @package   Modules\Options
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class OptionsController extends Controller
{
	protected $optionsRepo;

	/**
	 * Instantiate a new repository instance.
	 *
	 * @param OptionsRepository $optionsRepo [Object]
	 *
	 * @return void
	 */
	public function __construct(OptionsRepository $optionsRepo)
	{
		$this->optionsRepo = $optionsRepo;
	}

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return $this->optionsRepo->findAll();
	}

	public function getAllOptions(Request $request)
	{
		return $this->optionsRepo->getAllOptions($request);
	}

	public function findAll(Request $request)
	{
		return $this->optionsRepo->findAll($request);
	}
	
	/**
	 * Store a newly created resource in storage.
	 *
	 * @param Request $request [Request for create options]
	 *
	 * @return Response
	 */
	public function store(CreateOptionRequest $request)
	{
		// --
		// Check role/permission
		// if (!AdminHelper::can_action(43, 'created')) {
		// 	return response()->json("Access denied", 403);
		// }
	    $options = $this->optionsRepo->create($request);

		if ($options) {
			if(isset($options['status']) && isset($options['msg']) && !$options['status']){
				return response()->json(['error' => $options['msg']], 400);
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
		$options = $this->optionsRepo->findById($id);
		return $options;
		if ($options) {
			return response()->json($options);
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
	public function getOptionsById($id)
	{
		$options = $this->optionsRepo->getOptionsById($id);
		if ($options) {
			return response()->json($options);
		}
		return response()->json('error', 401);
	}
	/**
	 * Update the specified resource in storage.
	 *
	 * @param Request $request [Request for update options]
	 * @param Int     $id      [Row id]
	 *
	 * @return Response
	 */
	public function update(UpdateOptionRequest $request, $id)
	{
		$options = $this->optionsRepo->update($request, $id);

		if ($options) {
			if(isset($options['status']) && isset($options['msg']) && !$options['status']){
				return response()->json(['error' => $options['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json('error', 402);
		}
	}

	public function destroy(Request $request, $id)
	{
		$options = $this->optionsRepo->delete($id);
		if ($options) {
			if(isset($options['status']) && isset($options['msg']) && !$options['status']){
				return response()->json(['error' => $options['msg']], 400);
			} else {
				return response()->json('success');
			}
            return response()->json('success');
        } else {
            return response()->json('error', 402);
        }
	}

	public function getOptionsPermission(Request $request, $id)
	{
		$response['view'] = $this->optionsRepo->checkPermission($id, 'view');
		$response['edit'] = $this->optionsRepo->checkPermission($id, 'edit');
		$response['delete'] = $this->optionsRepo->checkPermission($id, 'delete');
		return $response;
	}
}
