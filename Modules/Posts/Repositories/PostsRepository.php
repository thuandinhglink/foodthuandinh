<?php
namespace Modules\Posts\Repositories;

use Auth;
use Carbon\Carbon;
use DB;
use Modules\CustomField\Models\CustomField;
use Modules\Helper\Helpers\EmailsHelper;
use Modules\Posts\Models\Posts;
use Modules\Posts\Models\PostsTranslation;
use Modules\Posts\Models\PostImages;
use Modules\Posts\Models\Properties;
use Modules\Posts\Models\PropertiesValue;
use Modules\Posts\Models\ProductsInfotechs;
use Modules\Posts\Models\Products;
use Modules\Page\Models\Page;
use Modules\Page\Models\PagesTranslation;
use Modules\User\Models\User\User;
use Modules\Helper\Repositories\HelperRepository;
use Modules\Helper\Helpers\WebHelper;
use Modules\Helper\Models\PathAlias;
use Modules\Seo\Models\PathAliasSeo;
use Modules\Helper\Models\KeywordsRelated;
use Modules\Categorys\Models\Categorys;
use Modules\Collections\Models\CollectionsPosts;
use Storage;

/**
 * Class PostRepository
 *
 * Posts CRUD functionality
 *
 * Posts create, update, delete and view
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
class PostsRepository
{
	protected $helperRepo;
	protected $emailRepo;
	protected $slackRepo;

	/**
	 * Instantiate a new repository instance.
	 *
	 * @param HelperRepository $helperRepo [Object]
	 * @param EmailsHelper     $emailRepo  [Object]
	 *
	 * @return void
	 */
	public function __construct(
		HelperRepository $helperRepo,
		EmailsHelper $emailRepo,
		WebHelper $webHelper
	) {
		$this->helperRepo = $helperRepo;
		$this->emailRepo = $emailRepo;
		$this->webHelper = $webHelper;
	}

	/**
	 * Display a listing of the resource.
	 *
	 * @return Object
	 */
	public function findAll()
	{
		$user = Auth::user();
		$Posts = Posts::join('web_po_cates_translation', 'web_po_cates_translation.po_cates_id', 'web_po_cates.id')->where('langcode', $user->language)->get();
		$data = [['id'=>null, 'name'=>'Parent']];
		foreach ($Posts as $key => $value) {
			array_push($data, $value);
		}
		return $data;
	}

	public function getTemplate()
	{
		return Page::join('web_pages_translation', 'web_pages_translation.pages_id', '=', 'web_pages.id')->where('web_pages_translation.langcode', 'vi')->whereIn('web_pages.type', [3,4])->select('*', 'web_pages.id as id')->get();
	}

	public function getAllPosts($request)
	{
		$user = Auth::user();
		$columns = array(
				0 => 'web_posts.id',
			);
		$input = $request->input();
		$limit = $request->input('length');
		$start = $request->input('start');
		$order = $columns[$request->input('order.0.column')];
		$dir = $request->input('order.0.dir');
		
		$Posts = Posts::join('web_posts_translation', 'web_posts_translation.posts_id', 'web_posts.id')->join('web_path_alias', 'web_path_alias.pages_id', 'web_posts.id')->where('web_posts.po_types_indentify', $request->input('moduletype'))->where('web_posts_translation.langcode', 'vi')->whereIn('web_path_alias.type', [3,4]);
		if (!empty($request->input('search.value'))) {
			$search = $request->input('search.value');

			$Posts = $Posts->where(
				function ($query) use ($search) {
					$query->where('web_po_cates_translation.name', 'LIKE', "%{$search}%")
						->orWhere('web_po_cates_translation.title', 'LIKE', "%{$search}%")
						->orWhere('web_po_cates_translation.description', 'LIKE', "%{$search}%");
				}
			);
		}

		$totalData = $Posts->count();
		$totalFiltered = $totalData;


		$data = $Posts->offset($start)
			->limit($limit)
			->select('web_posts.*', 'web_posts_translation.*', 'web_path_alias.prefix', 'web_path_alias.alias', 'web_posts.id as id')
			->orderBy($order, $dir)
			->get();
		foreach ($data as $key => $value) {
			$category = Categorys::join('web_po_cates_translation', 'web_po_cates_translation.po_cates_id', 'web_po_cates.id')->where('web_po_cates.id', $value->po_cates_id)->first();
			$value->categoryName = $category->name;
		}
		return array(
			"draw"            => intval($request->input('draw')),
			"recordsTotal"    => intval($totalData),
			"recordsFiltered" => intval($totalFiltered),
			// "statusCount"     => $statusCount,
			"data"            => $data
		);
	}

	/**
	 * Display a Post of the resource.
	 *
	 * @param Int $id [Row id]
	 *
	 * @return Object
	 */
	public function findById($id)
	{
		$data = Posts::join('web_posts_translation', 'web_posts_translation.posts_id', 'web_posts.id')->where('web_posts_translation.langcode', 'vi')->where('web_posts.id', $id)->select('*', 'web_posts.id as id')->first();
		if($data){
			$pathData = PathAlias::whereIn('type', [3,4])->where('pages_id', $data->id)->where('langcode', 'vi')->first();
			$data->page_title = $pathData->title;
			$data->page_description = $pathData->description;
			$data->url_and_handle = $pathData->alias;
			$data->seo = PathAliasSeo::where('path_alias_id', $pathData->id)->pluck('meta_id');
			$data->seoData = PathAliasSeo::join('web_meta', 'web_meta.id', '=', 'web_path_alias_seo.meta_id')->where('path_alias_id', $pathData->id)->select('web_meta.id', 'web_path_alias_seo.content', DB::raw('CONCAT(web_meta.attr, \'=\', web_meta.value) as label'))->get();
			$data->image = PostImages::where('posts_id', $id)->get();
			$data->infotechs = ProductsInfotechs::where('posts_id', $id)->get();
			$data->properties =  Properties::where('posts_id', $id)->pluck('options_indentify');

			$data->product = Products::where('posts_id', $id)->select('*', DB::raw("(CASE WHEN status='show' THEN true ELSE false END) as status"))->orderBy('id')->get();
			foreach ($data->product as $key => $value) {
				$data->product[$key]->propertiesValue = PropertiesValue::where('posts_id', $id)->where('pro_sku', $value->sku)->get();
			}
			$data->keyword = KeywordsRelated::join('web_keywords', 'web_keywords.id', '=', 'web_keywords_related.keywords_id')->where('web_keywords_related.pages_id', $id)->where('type', 1)->pluck('web_keywords.value');
			$data->collections = CollectionsPosts::where('posts_id', $id)->pluck('collections_id');
			return $data;
		}
		return false;
	}

	public function create($request)
	{
		$input = $request->all();
		DB::beginTransaction();
		try {
			if (!empty($input['avatar'])) {
				$input['avatar'] = $this->webHelper->_uploadImage($input['avatar'], 'project_uploads');
			}
			$posts = Posts::create([
				'po_cates_id'=>$input['category'],
				'pages_id'=>$input['pages_id'],
				'avatar'=>$input['avatar'],
				'manufacturers'=>$input['manufacturers'],
				'active'=>$input['active'],
				'price'=>$input['price'],
				'compare_price'=>$input['compare_price'],
				'po_types_indentify'=>$input['po_types_indentify']
			]);
			if ($posts) {
				PostsTranslation::create([
					'posts_id'=>$posts->id,
					'content'=>$input['content'],
					'langcode'=>'vi',
					'name'=>$input['name'],
					'description'=>$input['description']
				]);
				if($input['specifications'] && count($input['specifications']) > 0) {
					foreach ($input['specifications'] as $value) {
						ProductsInfotechs::create([
							'posts_id'=>$posts->id,
					       	'po_cates_id'=>$input['category'],
					       	'options_indentify'=>$value['options_indentify'],
					       	'options_value_indentify'=>$value['value']
						]);
					}
				}
				if($input['variations'] && count($input['variations']) > 0 && $input['properties'] && count($input['properties']) > 0) {
					foreach ($input['properties'] as $value) {
						Properties::create([
							'posts_id'=>$posts->id,
		        			'options_indentify'=>$value
						]);
					}
					foreach ($input['variations'] as $key => $value) {
						$sku = rand(100000, 999999);
						Products::create([
					        'sku'=>$sku,
					        'posts_id'=>$posts->id,
					        'price'=>$value['price'],
					        'status'=>isset($value['check']) && $value['check'] ? 'show' : 'hide',
					        'compare_price'=>$value['compare_price']
						]);
						foreach ($value as $propertieskey => $propertiesValue) {
							if(!in_array($propertieskey, ['price', 'check', 'compare_price']) && !strpos($propertieskey, 'label')){
								PropertiesValue::create([
									'pro_sku'=>$sku,
							        'posts_id'=>$posts->id,
							        'options_indentify'=>$propertieskey,
							        'option_value_indentify'=>$propertiesValue
								]);
							}
						}
					}
				}
				
				$pathAlias = PathAlias::create([
			        'pages_id'=>$posts->id,
			        'langcode'=>'vi',
			        'title'=>$input['page_title'],
			        'description'=>$input['page_description'],
			        'alias'=>$this->webHelper->stripVN($input['url_and_handle']),
			        'type'=>$input['po_types_indentify'] == 'news' ? 4 : 3
				]);
				$this->webHelper->saveMetaSeo($input['seoData'], $pathAlias->id);
				if($input['image'] && count($input['image']) > 0) {
					foreach ($input['image'] as $key => $value) {
						$file = $this->webHelper->_uploadImage($value['file'], 'project_uploads');
						PostImages::create([
							'posts_id'=>$posts->id,
							'url'=>$file
						]);
					}
				}

				if(isset($input['collections']) && $input['collections'] && count($input['collections']) > 0) {
					foreach ($input['collections'] as $key => $value) {
						CollectionsPosts::create([
							'posts_id'=>$posts->id,
							'collections_id'=>$value
						]);
					}
				}
				$this->webHelper->addKeyword($input['keyword'], $posts->id, 1);
				
				DB::commit();
				return true;
			} else {
				return false;
			}
		} catch (\Exception $e) {
		    DB::rollback();
		    return $this->webHelper->ParseException($e);
		}
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param Request $request [Request for update Post]
	 * @param Int     $id      [Row id]
	 *
	 * @return Object
	 */
	public function update($request, $id)
	{
		
		$input = $request->all();
		DB::beginTransaction();
		try {
			$posts = Posts::findOrFail($id);
			if (!empty($input['avatar']) && $posts->avatar != $input['avatar']) {
				$input['avatar'] = $this->webHelper->_uploadImage($input['avatar'], 'project_uploads');
			}
			$posts = Posts::where('id', $id)->update([
				'po_cates_id'=>$input['category'],
				'pages_id'=>$input['pages_id'],
				'avatar'=>$input['avatar'],
				'price'=>$input['price'],
				'compare_price'=>$input['compare_price'],
				'manufacturers'=>$input['manufacturers'],
				'active'=>$input['active']
			]);
			if ($posts) {
				PostsTranslation::where('posts_id', $id)->where(
				'langcode', 'vi')->update([
					'posts_id'=>$id,
					'name'=>$input['name'],
					'content'=>$input['content'],
					'description'=>$input['description']
				]);

				ProductsInfotechs::where('posts_id', $id)->delete();
				if($input['specifications'] && count($input['specifications']) > 0) {
					foreach ($input['specifications'] as $value) {
						// if(isset($value['id'])){
						// 	ProductsInfotechs::where('id',$value['id'])->update([
						//        	'po_cates_id'=>$input['category'],
						//        	'options_indentify'=>$value['options_indentify'],
						//        	'options_value_indentify'=>$value['value']
						// 	]);
						// } else {
							ProductsInfotechs::create([
								'posts_id'=>$id,
						       	'po_cates_id'=>$input['category'],
						       	'options_indentify'=>$value['options_indentify'],
						       	'options_value_indentify'=>$value['value']
							]);
						// }
					}
				}

				if(count($input['variations']) == 0  || (count($input['variations']) > 0 && !isset($input['variations'][0]['id']))){
					PropertiesValue::where('posts_id', $id)->delete();
					Products::where('posts_id', $id)->delete();
					Properties::where('posts_id', $id)->delete();
					foreach ($input['properties'] as $value) {
						Properties::create([
							'posts_id'=>$id,
		        			'options_indentify'=>$value
						]);
					}
				}
				
				if($input['variations'] && count($input['variations']) > 0 && $input['properties'] && count($input['properties']) > 0) {
					foreach ($input['variations'] as $key => $value) {
						if(isset($value['id'])){
							Products::where('posts_id', $id)->where('sku', $value['sku'])->update([
						        'price'=>$value['price'],
						        'status'=>isset($value['check']) && $value['check'] ? 'show' : 'hide',
						        'compare_price'=>$value['compare_price'],
							]);
						} else {
							$sku = rand(100000, 999999);
							Products::create([
						        'sku'=>$sku,
						        'posts_id'=>$id,
						        'price'=>$value['price'],
						        'status'=>isset($value['check']) && $value['check'] ? 'show' : 'hide',
						        'compare_price'=>$value['compare_price'],
							]);
							foreach ($value as $propertieskey => $propertiesValue) {
								if(!in_array($propertieskey, ['price', 'check', 'compare_price']) && !strpos($propertieskey, 'label')){
									PropertiesValue::create([
										'pro_sku'=>$sku,
								        'posts_id'=>$id,
								        'options_indentify'=>$propertieskey,
								        'option_value_indentify'=>$propertiesValue
									]);
								}
							}
						}
					}
				}
				$pathAlias = PathAlias::where('pages_id', $id)->where('langcode', 'vi')->whereIn('type', [3,4])->first();
				PathAlias::where('pages_id', $id)->where('langcode', 'vi')->whereIn('type', [3,4])->update([
			        'title'=>$input['page_title'],
			        'description'=>$input['page_description'],
			        'alias'=>$this->webHelper->stripVN($input['url_and_handle'])
				]);
				$this->webHelper->saveMetaSeo($input['seoData'], $pathAlias->id);
				if($input['image'] && count($input['image']) > 0) {
					foreach ($input['image'] as $key => $value) {
						$file = $this->webHelper->_uploadImage($value['file'], 'project_uploads');
						PostImages::create([
							'posts_id'=>$id,
							'url'=>$file
						]);
					}
				}
				if($input['removed_images'] && count($input['removed_images']) > 0) {
					PostImages::whereIn('id', $input['removed_images'])->delete();
				}
				CollectionsPosts::where('posts_id', $id)->delete();
				if(isset($input['collections']) && $input['collections'] && count($input['collections']) > 0) {
					foreach ($input['collections'] as $key => $value) {
						CollectionsPosts::create([
							'posts_id'=>$id,
							'collections_id'=>$value
						]);
					}
				}
				$this->webHelper->relevantPageRebuild($id, [7,9]);
				$this->webHelper->addKeyword($input['keyword'], $id, 1);
				DB::commit();
				return true;
			} else {
				return false;
			}
		} catch (\Exception $e) {
		    DB::rollback();
		    return $this->webHelper->ParseException($e);
		}
	}
	/**
	 * Remove the specified resource from storage.
	 *
	 * @param Request $request [Request for delete Post]
	 * @param Int     $id      [Row id]
	 *
	 * @return Boolean
	 */
	public function delete($id)
	{
		DB::beginTransaction();
		try {
			PostsTranslation::where('posts_id', $id)->delete();
			PathAlias::where('pages_id', $id)->whereIn('type', [3,4])->delete();
			PostImages::where('posts_id', $id)->delete();
			PropertiesValue::where('posts_id', $id)->delete();
			Properties::where('posts_id', $id)->delete();
			Products::where('posts_id', $id)->delete();
			ProductsInfotechs::where('posts_id', $id)->delete();
			Posts::where('id', $id)->delete();
			DB::commit();
			return true;
		} catch (\Exception $e) {
		    DB::rollback();
		    return $this->webHelper->ParseException($e);
		}
	}

	public function checkPermission($Post_id, $action)
	{
		$user = Auth::user();
		if ($user->hasRole('admin') || $user->is_super_admin) {
			return true;
		}

		$PostUser = PostUser::where('Post_id', $Post_id)
			->where('user_id', Auth::user()->id)
			->where($action, true)
			->first();

		if ($PostUser) {
			return true;
		}
		return false;
	}
}
