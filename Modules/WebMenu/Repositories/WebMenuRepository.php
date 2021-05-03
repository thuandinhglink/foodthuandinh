<?php
namespace Modules\WebMenu\Repositories;

use Auth;
use DB;
use Modules\Defect\Models\Defect;
use Modules\Helper\Helpers\CommonHelper;
use Modules\Incident\Models\Incident;
use Modules\WebMenu\Models\WebMenu;
use Modules\WebMenu\Models\WebSubMenu;
use Modules\Page\Models\Page;
use Modules\Categorys\Models\Categorys;
use Modules\Collections\Models\Collections;
use Modules\Posts\Models\Posts;
use Illuminate\Support\Facades\File;
use Modules\Helper\Helpers\WebHelper;
use Storage;

/**
 * Class WebMenuRepository
 *
 * WebMenu create, update, delete and view.
 *
 * PHP version 7.1.3
 *
 * @category  PM
 * @package   Modules\WebMenu
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class WebMenuRepository
{
    protected $commonHelper;

    /**
     * Instantiate a new repository instance.
     *
     * @param CommonHelper $commonHelper [Object]
     *
     * @return void
     */
    public function __construct(CommonHelper $commonHelper, WebHelper $webHelper)
    {
        $this->commonHelper = $commonHelper;
	    $this->webHelper = $webHelper;
    }

	public function findAll()
	{
		return WebMenu::join('web_widgets_translation', 'web_widgets.id', '=', 'web_widgets_translation.widgets_id')->where('web_widgets_translation.langcode', 'vi')->select('*', 'web_widgets.id as id')->get();
	}

	public function getAllMenu($request)
	{
		$totalData = WebMenu::count();
		$columns = array(
			0 => 'id',
			1 => 'name',
			2 => 'description'
		);

		$limit = $request->input('length');
		$start = $request->input('start');
		$order = $columns[$request->input('order.0.column')];
		$dir = $request->input('order.0.dir');

		if (!empty($request->input('search.value'))) {
			$search = $request->input('search.value');

			$widget = WebMenu::where(
				function ($query) use ($search) {
					$query->where('name', 'LIKE', "%{$search}%")
					      ->orWhere('description', 'LIKE', "%{$search}%");
				}
			);

			$totalFiltered = $widget->count();

			$widget = $widget->offset($start)
		                   ->limit($limit)
		                   ->orderBy($order, $dir)
		                   ->get();
		} else {
			$widget = WebMenu::offset($start)
		                   ->limit($limit)
		                   ->orderBy($order, $dir)
		                   ->get();
			$totalFiltered = $totalData;
		}
       
		$json_data = array(
			"draw"            => intval($request->input('draw')),
			"recordsTotal"    => intval($totalData),
			"recordsFiltered" => intval($totalFiltered),
			"data"            => $widget
		);

		return $json_data;
	}

	public function create($request)
	{
		$widget = new WebMenu;
		$input = $request->all();

		DB::beginTransaction();
			try {
			WebMenu::create($input);
        	DB::commit();
			return true;
        } catch (\Exception $e) {
		    DB::rollback();
		    return false;
		}
		return false;
	}

	public function getById($id)
	{

		return false;
	}
	function is_base64($str){
		if ( base64_encode(base64_decode($str, true)) === $str){
			return true;
		} else {
			return false;
		}
	}
	public function update($request, $id)
	{
		$input = $request->all();
		DB::beginTransaction();
			try {
			WebMenu::where('id', $id)->update($input);
        	DB::commit();
			return true;
        } catch (\Exception $e) {
		    DB::rollback();
		    return false;
		}
		return false;
	}
	public function delete($id)
	{
		DB::beginTransaction();
		try {
			WebMenu::where('id', $id)->delete();
			DB::commit();
			return true;
        } catch (\Exception $e) {
		    DB::rollback();
		    return false;
		}
	}



	// Sub menu
	public function getDataSubMenu(){
		$categorys1 = Categorys::join('web_po_cates_translation', 'web_po_cates_translation.po_cates_id', 'web_po_cates.id')->where('langcode', 'vi')->where('po_types_indentify', 'news')->select('*', 'web_po_cates.id as id')->get();
		$categorys2 = Categorys::join('web_po_cates_translation', 'web_po_cates_translation.po_cates_id', 'web_po_cates.id')->where('langcode', 'vi')->where('po_types_indentify', 'products')->select('*', 'web_po_cates.id as id')->get();
		$collections1 = Collections::join('web_collections_translation', 'web_collections_translation.collections_id', 'web_collections.id')->where('langcode', 'vi')->where('po_types_indentify', 'news')->select('*', 'web_collections.id as id')->get();
		$collections2 = Collections::join('web_collections_translation', 'web_collections_translation.collections_id', 'web_collections.id')->where('langcode', 'vi')->where('po_types_indentify', 'products')->select('*', 'web_collections.id as id')->get();
		$pages = Page::join('web_pages_translation', 'web_pages.id', '=', 'web_pages_translation.pages_id')->where('langcode', 'vi')->where('type', 0)->select('*', 'web_pages.id as id')->get();
		$product1 = Posts::join('web_posts_translation', 'web_posts_translation.posts_id', 'web_posts.id')->where('web_posts_translation.langcode', 'vi')->where('po_types_indentify', 'news')->select('*', 'web_posts.id as id')->get();
		$product2 = Posts::join('web_posts_translation', 'web_posts_translation.posts_id', 'web_posts.id')->where('web_posts_translation.langcode', 'vi')->where('po_types_indentify', 'products')->select('*', 'web_posts.id as id')->get();
		return [
			[
				'data'=>[],
				'name'=>"Container",
				'id'=>1
			],
			[
				'data'=>$pages,
				'name'=>"Single Page",
				'id'=>2
			],
			[
				'data'=>$categorys1,
				'name'=>'Category (News)',
				'id'=>3,
			],
			[
				'data'=>$categorys2,
				'name'=>'Category (Products)',
				'id'=>4,
			],
			[
				'data'=>$collections1,
				'name'=>'Collections (News)',
				'id'=>5,
			],
			[
				'data'=>$collections2,
				'name'=>'Collections (Products)',
				'id'=>6,
			],
			[
				'data'=>$product1,
				'name'=>'News',
				'id'=>7,
			],
			[
				'data'=>$product2,
				'name'=>'Product',
				'id'=>8,
			]
		];
	}
	public function getAllSubMenu($request)
	{
		$totalData = WebSubMenu::count();
		$columns = array(
			0 => 'id',
			1 => 'name'
		);
		$colspan = 1;
		$limit = $request->input('length');
		$start = $request->input('start');
		$order = $columns[$request->input('order.0.column')];
		$dir = $request->input('order.0.dir');

		if (!empty($request->input('search.value'))) {
			$search = $request->input('search.value');

			$menu = WebSubMenu::whereNull('parent_id')->where('menu_id', $request->input('menu_id'))->where(
				function ($query) use ($search) {
					$query->where('name', 'LIKE', "%{$search}%");
				}
			);

			$totalFiltered = $menu->count();

			$menu = $menu->orderBy('index')->get();
		} else {
			$menu = WebSubMenu::whereNull('parent_id')->where('menu_id', $request->input('menu_id'))->orderBy('index')->get();
			$totalFiltered = $totalData;
		}

		foreach ($menu as $key => $value) {
			$value['name'] = $this->webHelper->getSubMenuName($value);
			$resultData = $this->webHelper->getChidSubMenu($value, $colspan);
		 	$value['chidData'] = $resultData['data'];
		 	$colspan = $resultData['colspan'] > $colspan ? $resultData['colspan'] : $colspan;
			$value['colspan'] = 0;
		}
       
		$json_data = array(
			"draw"            => intval($request->input('draw')),
			"recordsTotal"    => intval($totalData),
			"recordsFiltered" => intval($totalFiltered),
			"data"            => $menu,
			"colspan"		  => $colspan
		);

		return $json_data;
	}

	


	public function createSubMenu($request)
	{
		$input = $request->all();
		DB::beginTransaction();
			try {
			$subMenu = WebSubMenu::create($input);
			$this->webHelper->relevantPageRebuild($subMenu->menu_id, [11]);
        	DB::commit();
			return true;
        } catch (\Exception $e) {
		    DB::rollback();
		    dd($e);
		    return false;
		}
		return false;
	}

	public function updateSubMenu($request, $id)
	{
		$input = $request->all();
		DB::beginTransaction();
			try {
			$subMenu = WebSubMenu::find($id);
			if ($subMenu->fill($input)->save()) {
				$this->webHelper->relevantPageRebuild($subMenu->menu_id, [11]);
			}
        	DB::commit();
			return true;
        } catch (\Exception $e) {
		    DB::rollback();
		    return false;
		}
		return false;
	}
	public function deleteSubMenu($id)
	{
		DB::beginTransaction();
		try {
			$subMenu = WebSubMenu::findOrFail($id);
			$this->deleteChidSubmenu([$id]);
			$this->webHelper->relevantPageRebuild($subMenu->menu_id, [11]);
			DB::commit();
			return true;
        } catch (\Exception $e) {
		    DB::rollback();
		    dd($e);
		    return false;
		}
	}
	public function deleteChidSubmenu($listId){
		$listChid = WebSubMenu::whereIn('parent_id', $listId)->pluck('id');
		if(count($listChid) > 0){
			$this->deleteChidSubmenu($listChid);
		}
		WebSubMenu::whereIn('id', $listId)->delete();
		return true;
	}
}
