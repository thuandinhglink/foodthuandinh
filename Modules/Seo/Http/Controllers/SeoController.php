<?php

namespace Modules\Seo\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\Seo\Repositories\SeoRepository;

class SeoController extends Controller
{
    protected $seoRepo;

    public function __construct(SeoRepository $seoRepo)
    {
        $this->seoRepo = $seoRepo;
    }
    public function index()
    {
        return $this->seoRepo->findAll();
    }
    public function getAll()
    {
        return $this->seoRepo->findAll();
    }
    public function getAllSeo(Request $request)
    {
        return $this->seoRepo->getAllSeo($request);
    }
    public function store(Request $request)
    {
        $seo = $this->seoRepo->create($request);

        if (!empty($seo)) {
            if(isset($seo['status']) && isset($seo['msg']) && !$seo['status']){
                return response()->json(['error' => $seo['msg']], 400);
            } else {
                return response()->json('success');
            }
        } else {
            return response()->json(
                ['error' => 'Seo has not been created.'],
                400
            );
        }
    }
    public function update(Request $request, $id)
    {
        $seo = $this->seoRepo->update($request, $id);

        if (!empty($seo)) {
            if(isset($seo['status']) && isset($seo['msg']) && !$seo['status']){
                return response()->json(['error' => $seo['msg']], 400);
            } else {
                return response()->json('success');
            }
        } else {
            return response()->json(
                ['error' => 'Seo has not been update.'],
                400
            );
        }
    }

    public function delete($id)
    {
        $seo = $this->seoRepo->delete($id);

        if (!empty($seo)) {
            if(isset($seo['status']) && isset($seo['msg']) && !$seo['status']){
                return response()->json(['error' => $seo['msg']], 400);
            } else {
                return response()->json('success');
            }
            return response()->json('success');
        } else {
            return response()->json(
                ['error' => 'Seo has not been delete.'],
                400
            );
        }
    }

    public function getAllKeyword(){
        return $this->seoRepo->getAllKeyword();
    }
}
