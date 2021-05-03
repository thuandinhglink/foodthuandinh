<?php

namespace Modules\Region\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;

use Modules\Helper\Helpers\AdminHelper;
use Modules\Region\Http\Requests\UpdateRegionRequest;
use Modules\Region\Http\Requests\CreateRegionRequest;
use Modules\Region\Repositories\RegionRepository;

class RegionController extends Controller
{
    protected $regionRepo;

    public function __construct(RegionRepository $region)
    {
        $this->regionRepo = $region;
    }

    public function index()
    {
        return $this->regionRepo->findAll();
    }
	public function getAllRegions(Request $request)
	{
		return $this->regionRepo->getAllRegions($request);
	}

	public function store(CreateRegionRequest $request)
	{
		$region = $this->regionRepo->create($request);

		if (!empty($region)) {
			if(isset($region['status']) && isset($region['msg']) && !$region['status']){
				return response()->json(['error' => $region['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(
				['error' => 'Region has not been created.'],
				400
			);
		}
	}

	public function getById($id)
	{
		$region = $this->regionRepo->getById($id);
		if ($region) {
			return response()->json($region);
		}
		return response()->json('error', 401);
	}

	public function update(UpdateRegionRequest $request, $id)
	{
		$region = $this->regionRepo->update($request, $id);

		if ($region) {
			if(isset($region['status']) && isset($region['msg']) && !$region['status']){
				return response()->json(['error' => $region['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(['error' => 'Region has not been found.'], 400);
		}
	}
	public function delete($id)
	{
		$region = $this->regionRepo->delete($id);

		if ($region) {
			if(isset($region['status']) && isset($region['msg']) && !$region['status']){
				return response()->json(['error' => $region['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(['error' => 'Region has not been found.'], 400);
		}
	}
}
