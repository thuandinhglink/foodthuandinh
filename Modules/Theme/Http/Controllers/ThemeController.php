<?php

namespace Modules\Theme\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;

use Modules\Helper\Helpers\AdminHelper;
use Modules\Theme\Http\Requests\UpdateThemeRequest;
use Modules\Theme\Http\Requests\CreateThemeRequest;
use Modules\Theme\Repositories\ThemeRepository;

class ThemeController extends Controller
{
    protected $themeRepo;

    public function __construct(ThemeRepository $theme)
    {
        $this->themeRepo = $theme;
    }

    public function index()
    {
        return $this->themeRepo->findAll();
    }
	public function getAllThemes(Request $request)
	{
		return $this->themeRepo->getAllThemes($request);
	}

	public function store(CreateThemeRequest $request)
	{
		$theme = $this->themeRepo->create($request);

		if (!empty($theme)) {
			if(isset($theme['status']) && isset($theme['msg']) && !$theme['status']){
				return response()->json(['error' => $theme['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(
				['error' => 'Theme has not been created.'],
				400
			);
		}
	}

	public function ImportTheme(Request $request)
	{
		$theme = $this->themeRepo->ImportTheme($request);
		if (!empty($theme)) {
			return response()->json('success');
		} else {
			return response()->json(
				['error' => 'Theme has not been created.'],
				400
			);
		}
	}

	public function getById($id)
	{
		$theme = $this->themeRepo->getById($id);
		if ($theme) {
			return response()->json($theme);
		}
		return response()->json('error', 401);
	}

	public function update(UpdateThemeRequest $request, $id)
	{
		$theme = $this->themeRepo->update($request, $id);

		if ($theme) {
			if(isset($theme['status']) && isset($theme['msg']) && !$theme['status']){
				return response()->json(['error' => $theme['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(['error' => 'Theme has not been found.'], 400);
		}
	}
	public function delete($id)
	{
		$theme = $this->themeRepo->delete($id);

		if ($theme) {
			if(isset($theme['status']) && isset($theme['msg']) && !$theme['status']){
				return response()->json(['error' => $theme['msg']], 400);
			} else {
				return response()->json('success');
			}
		} else {
			return response()->json(['error' => 'Theme has not been found.'], 400);
		}
	}

	public function changeThemeStatus(Request $request, $id)
	{
		if ($this->themeRepo->changeThemeStatus($request,$id)) {
			return response()->json('success');
		} else {
			return response()->json('error');
		}
	}
}
