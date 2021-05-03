<?php

namespace Modules\WebMenu\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\WebMenu\Repositories\WebMenuRepository;

class WebMenuController extends Controller
{
    protected $menuRepo;

    public function __construct(WebMenuRepository $menuRepo)
    {
        $this->menuRepo = $menuRepo;
    }

    public function index()
    {
        return $this->menuRepo->findAll();
    }
    public function getAllMenu(Request $request)
    {
        return $this->menuRepo->getAllMenu($request);
    }
    public function store(Request $request)
    {
        $menu = $this->menuRepo->create($request);

        if (!empty($menu)) {
            return response()->json('success');
        } else {
            return response()->json(
                ['error' => 'Menu has not been created.'],
                400
            );
        }
    }
    public function update(Request $request, $id)
    {
        $menu = $this->menuRepo->update($request, $id);

        if (!empty($menu)) {
            return response()->json('success');
        } else {
            return response()->json(
                ['error' => 'Menu has not been delete.'],
                400
            );
        }
    }

    public function delete($id)
    {
        $menu = $this->menuRepo->delete($id);

        if (!empty($menu)) {
            return response()->json('success');
        } else {
            return response()->json(
                ['error' => 'Menu has not been delete.'],
                400
            );
        }
    }


    // sub menu
    public function getDataSubMenu(){
        return $this->menuRepo->getDataSubMenu();
    }
    public function getAllSubMenu(Request $request)
    {
        return $this->menuRepo->getAllSubMenu($request);
    }

    public function addSubMenu(Request $request)
    {
        $menu = $this->menuRepo->createSubMenu($request);

        if (!empty($menu)) {
            return response()->json('success');
        } else {
            return response()->json(
                ['error' => 'SubMenu has not been created.'],
                400
            );
        }
    }
    public function updateSubMenu(Request $request, $id)
    {
        $menu = $this->menuRepo->updateSubMenu($request, $id);

        if (!empty($menu)) {
            return response()->json('success');
        } else {
            return response()->json(
                ['error' => 'SubMenu has not been delete.'],
                400
            );
        }
    }

    public function deleteSubMenu($id)
    {
        $menu = $this->menuRepo->deleteSubMenu($id);

        if (!empty($menu)) {
            return response()->json('success');
        } else {
            return response()->json(
                ['error' => 'SubMenu has not been delete.'],
                400
            );
        }
    }
}
