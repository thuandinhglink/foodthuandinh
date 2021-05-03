<?php

namespace Modules\Collections\Http\Controllers;

use Auth;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\Helper\Helpers\AdminHelper;
use Modules\Helper\Http\Controllers\PmHelperController;
use Modules\Collections\Http\Requests\CreateCollectionRequest;
use Modules\Collections\Http\Requests\UpdateCollectionRequest;
use Modules\Collections\Repositories\CollectionRepository;
use Modules\Page\Models\Page;

/**
 * Class CollectionsController
 *
 * Collection create, update, delete and view.
 *
 * PHP version 7.1.3
 *
 * @collection  PM
 * @package   Modules\Collections
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class CollectionsController extends Controller
{
	protected $collectionRepo;

	/**
	 * Instantiate a new repository instance.
	 *
	 * @param CollectionRepository $collectionRepo [Object]
	 *
	 * @return void
	 */
	public function __construct(CollectionRepository $collectionRepo)
	{
		$this->collectionRepo = $collectionRepo;
	}

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return $this->collectionRepo->findAll();
	}

	public function getAllCollections(Request $request)
	{
		// --
		// Check role/permission
//		if (!AdminHelper::can_action(43, 'view')) {
//			return response()->json("Access denied", 403);
//		}

		return $this->collectionRepo->getAllCollections($request);
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @param Request $request [Request for create collection]
	 *
	 * @return Response
	 */
	public function store(CreateCollectionRequest $request)
	{
		$collection = $this->collectionRepo->create($request);

		if ($collection) {
			if(isset($collection['status']) && isset($collection['msg']) && !$collection['status']){
				return response()->json(['error' => $collection['msg']], 400);
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
		$collection = $this->collectionRepo->findById($id);
		if ($collection) {
			return response()->json($collection);
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
	public function getCollectionById($id)
	{
		// --
		// Check role/permission
		if (!AdminHelper::can_action(43, 'view')) {
			return response()->json("Access denied", 403);
		}

		$collection = $this->collectionRepo->getCollectionById($id);
		if ($collection) {
			return response()->json($collection);
		}
		return response()->json('error', 401);
	}

	public function getTemplate()
	{
		$data = Page::join('web_pages_translation', 'web_pages_translation.pages_id', '=', 'web_pages.id')->where('web_pages_translation.langcode', 'vi')->get();
		$data = $this->collectionRepo->getTemplate();
		if ($data) {
			return response()->json($data);
		}
		return response()->json('error', 401);
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param Request $request [Request for update collection]
	 * @param Int     $id      [Row id]
	 *
	 * @return Response
	 */
	public function update(UpdateCollectionRequest $request, $id)
	{

		$collection = $this->collectionRepo->update($request, $id);

		if ($collection) {
			if(isset($collection['status']) && isset($collection['msg']) && !$collection['status']){
				return response()->json(['error' => $collection['msg']], 400);
			} else {
				return response()->json('success');
			}
			return response()->json('success');
		} else {
			return response()->json('error', 401);
		}
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param Request $request [Request for update collection notes]
	 * @param Int     $id      [Row id]
	 *
	 * @return Response
	 */
	public function collectionNotesUpdate(Request $request, $id)
	{
		$collection = $this->collectionRepo->collectionNotesUpdate($request, $id);

		if ($collection) {
			return response()->json('success');
		}
		return response()->json('error');
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param Request $request [Request for destroy collection]
	 * @param Int     $id      [Row id]
	 *
	 * @return Response
	 */
	public function destroy(Request $request, $id)
	{
		$collection = $this->collectionRepo->delete($request, $id);
		if ($collection) {
            if(isset($collection['status']) && isset($collection['msg']) && !$collection['status']){
				return response()->json(['error' => $collection['msg']], 400);
			} else {
				return response()->json('success');
			}
        } else {
            return response()->json('error', 401);
        }
	}

	/**
	 * Change collection status.
	 *
	 * @param Request $request [Request for change collection status]
	 * @param Int     $id      [Row id]
	 *
	 * @return Response
	 */
	public function changeCollectionstatus(Request $request, $id)
	{
		// --
		// Check collection user permission
		if (!$this->collectionRepo->checkPermission($id, 'edit')) {
			return response()->json("Access denied", 403);
		}
		
		if ($this->collectionRepo->changeCollectionStatus($request, $id)) {
			return response()->json('success');
		} else {
			return response()->json('error', 401);
		}
	}

	/**
	 * Store a newly imported resource in storage.
	 *
	 * @param Request $request [Request for import collection]
	 *
	 * @return Response
	 */
	public function importCollection(Request $request)
	{
		// --
		// Check role/permission
		if (!AdminHelper::can_action(43, 'created')) {
			return response()->json("Access denied", 403);
		}

		$request->validate(['csv_file' => 'required']);
		$error_file = [];
		$input = $request->all();
		
		$csvData  = explode("\n", $input['csv_file']);
		foreach ($csvData as $key => $value) {
			$csvData[$key] = explode(',', $value);
		}

		if (count($csvData) >= 2) {
			$header =  array(
                0 => 'collection name',
                1 => 'collection version',
                2 => 'start date',
                3 => 'end date',
                4 => 'progress',
                5 => 'demo url',
                6 => 'assign group',
                7 => 'assign members',
                8 => 'status',
                9 => 'billing type',
                10 => 'fixed price',
                11 => 'hourly rate',
                12 => 'estimated hours',
                13 => 'description',
                14 => 'client',
                15 => 'created by',
            );
            $data = $csvData[0];
            foreach ($header as $key => $value) {
                if(isset($data[$key])){
                    if (strtolower(trim($data[$key])) !== $value) {
                        $error_file[] = $value.' field is required';
                    }
                }else{
                    $error_file[] = $value.' field is required';
                }
            }
            if (is_array($error_file) && count($error_file) > 0) {
                return response()->json(['error' => $error_file ], 422);
            }

			$res = $this->collectionRepo->createImportCollection($request, $csvData);
			return response()->json(['success' => $res]);
		} else {
			return response()->json(
				['error' => 'There are no any record in CSV.'],
				422
			);
		}
	}

	/**
	 * Get collection planner collection, sprint, tasks.
	 *
	 * @param Request $request [Request for import collection]
	 *
	 * @return Response
	 */
	public function getCollectionSprintTasks(Request $request)
	{
		// --
		// Check role/permission
		if (!AdminHelper::can_action(42, 'view')) {
			return response()->json("Access denied", 403);
		}

		return $this->collectionRepo->getCollectionSprintTasks($request);
	}

	/**
	 *  Display collection all data.
	 *
	 * @param Request $request [Request for get collection]
	 *
	 * @return Response
	 */
	public function getCollectionForReport(Request $request)
	{
		// --
		// Check role/permission
		if (!AdminHelper::can_action(51, 'view')) {
			return response()->json("Access denied", 403);
		}

		if (!$request->has(['order','start','length'])) {
			return response()->json(
				["error" => "Something wrong with URL or parameters"],
				400
			);
		}

		return $this->collectionRepo->getCollectionForReport($request);
	}

}
