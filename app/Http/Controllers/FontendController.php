<?php

namespace App\Http\Controllers;

use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Modules\Helper\Models\PathAlias;
use Modules\Categorys\Models\Categorys;
use Modules\Template\Models\Template;
use Modules\Page\Models\Page;
use Modules\Posts\Models\Posts;
use Modules\Collections\Models\Collections;
use Modules\Collections\Models\CollectionsConditions;
use Modules\Seo\Models\PathAliasSeo;
use Modules\Posts\Models\PostImages;
use Modules\Seo\Models\Seo;
use Modules\Posts\Models\Properties;
use Modules\Posts\Models\PropertiesValue;
use Modules\Posts\Models\ProductsInfotechs;
use Modules\Posts\Models\Products;
use Modules\Options\Models\Options;
use Modules\Options\Models\OptionsTranslation;
use Modules\Options\Models\OptionsValue;
use Modules\Options\Models\OptionsValueTranslation;
use Modules\Helper\Models\Keywords;
use URL;

class FontendController extends BaseController{

	public function controlPage(){
		$path_string = str_replace(env('APP_URL'), '', URL::current());
		$pageData = PathAlias::where(DB::raw('CONCAT(prefix, "", alias)'), $path_string)->first();		
		$themeActive = DB::table('web_themes')->where('status', 1)->first();
		$resource_path = env('APP_URL').'../resources/themes/'.$themeActive->folder.'/';
		$public_path = env('APP_URL');
		$file_path = env('APP_URL').'uploads/project/';
		$metaTagData = PathAliasSeo::join('web_meta', 'web_meta.id', '=', 'web_path_alias_seo.meta_id')->where('path_alias_id', $pageData->id)->select('web_meta.id', 'web_path_alias_seo.content', 'web_meta.attr', 'web_meta.value')->get();
		$metaTagDataAll = Seo::where('type', 0)->select('*', 'default as content')->get();

		$metaTagData = PathAliasSeo::join('web_meta', 'web_meta.id', '=', 'web_path_alias_seo.meta_id')->where('path_alias_id', $pageData->id)->select('web_meta.id', 'web_path_alias_seo.content', 'web_meta.attr', 'web_meta.value')->get();
		$rootDataForPage = ['metaTagData'=>$metaTagData, 'file_path'=>$file_path, 'resource_path'=>$resource_path, 'public_path'=>$public_path];

		switch ($pageData->type) {
			case 1:
				$data = Categorys::join('web_pages', 'web_pages.id', '=', 'web_po_cates.pages_id')->join('web_pages_translation', 'web_pages.id', '=', 'web_pages_translation.pages_id')->where('web_po_cates.id', $pageData->pages_id)->first();
				$categorysData = Categorys::join('web_po_cates_translation', 'web_po_cates_translation.po_cates_id', 'web_po_cates.id')->where('web_po_cates_translation.langcode', 'vi')->where('web_po_cates.id', $pageData->pages_id)->select('*', 'web_po_cates.id as id')->first();
				$categorysData['chidData'] = Posts::join('web_posts_translation', 'web_posts_translation.posts_id', 'web_posts.id')->join('web_path_alias', 'web_path_alias.pages_id', 'web_posts.id')->where('web_posts_translation.langcode', 'vi')->where('web_path_alias.langcode', 'vi')->where('web_posts.po_cates_id', $pageData->pages_id)->select('*', 'web_posts.id as id', 'web_path_alias.alias as link')->get();
				// return ($categorysData);
				$rootDataForPage['page_title'] = $data->name;
				$rootDataForPage['currentCategoryData'] = $categorysData;
				return view($data->machine_name, $rootDataForPage);
				break;
			case 2:
				$data = Collections::join('web_collections_translation', 'web_collections_translation.collections_id', 'web_collections.id')->join('web_pages', 'web_pages.id', '=', 'web_collections.pages_id')->where('web_collections.id', $pageData->pages_id)->select('*', 'web_collections.id as id', 'web_collections.type as type_filter')->first();
				$rootDataForPage['page_title'] = $data->name;
				if($data->type_filter == 'auto'){
					$conditions = CollectionsConditions::where('collections_id', $pageData->pages_id)->get();
					$queryConditions = Posts::join('web_posts_translation', 'web_posts_translation.posts_id', 'web_posts.id')->join('web_path_alias', 'web_path_alias.pages_id', 'web_posts.id')->where('web_posts_translation.langcode', 'vi')->where('web_path_alias.langcode', 'vi');
					$queryName = 'web_posts.price';
					$queryCompare = '=';
					if($data->condition_type == 0){
						foreach ($conditions as $value) {
							$queryName = $value->type == 0 ? 'web_posts.price' : 'web_posts.compare_price';
							switch ($value->condition) {
								case 0:
									$queryCompare = '>';
									break;
								case 1:
									$queryCompare = '<';
									break;
								case 2:
									$queryCompare = '=';
									break;
							}
							$queryName = $value->type == 0 ? 'web_posts.price' : 'web_posts.compare_price';
							$queryConditions = $queryConditions->where($queryName, $queryCompare, $value->value);
						}
					} else {
						$queryConditions = $queryConditions->where(
							function ($query) use ($queryConditions, $conditions) {
								foreach ($conditions as $key => $value) {
									$queryName = $value->type == 0 ? 'web_posts.price' : 'web_posts.compare_price';
									switch ($value->condition) {
										case 0:
											$queryCompare = '>';
											break;
										case 1:
											$queryCompare = '<';
											break;
										case 2:
											$queryCompare = '=';
											break;
									}
									if($key == 0){
										$query->where($queryName, $queryCompare , $value);
									} else {
										$query->orWhere($queryName, $queryCompare , $value);
									}
								}
							}
						);
					}
					$data['chidData'] = $queryConditions->select('*', 'web_posts.id as id', 'web_path_alias.alias as link')->groupBy('web_posts.id')->get();
				} else {
					$data['chidData'] =  Posts::join('web_posts_translation', 'web_posts_translation.posts_id', 'web_posts.id')->join('web_collections_posts', 'web_collections_posts.posts_id', 'web_posts.id')->join('web_path_alias', 'web_path_alias.pages_id', 'web_posts.id')->where('web_posts_translation.langcode', 'vi')->where('web_path_alias.langcode', 'vi')->where('web_collections_posts.collections_id', $pageData->pages_id)->select('*', 'web_posts.id as id', 'web_path_alias.alias as link')->groupBy('web_posts.id')->get();
				}
				$rootDataForPage['currentCollectionData'] = $data;
				return view($data->machine_name, $rootDataForPage);
				break;
			case 3:
				$data = Posts::join('web_posts_translation', 'web_posts_translation.posts_id', 'web_posts.id')->join('web_pages', 'web_pages.id', '=', 'web_posts.pages_id')->where('web_posts.id', $pageData->pages_id)->first();
				$data->image = PostImages::where('posts_id', $pageData->pages_id)->get();
				$data->infotechs = ProductsInfotechs::join('web_options_value', 'web_options_value.indentify', '=', 'web_pro_vinfotechs.options_value_indentify')->join('web_options', 'web_options.indentify', 'web_pro_vinfotechs.options_indentify')->join('web_options_translation', 'web_options_translation.options_id', 'web_options.id')->where('web_pro_vinfotechs.posts_id', $pageData->pages_id)->select('web_options_value.name as value_name', 'web_options_translation.name as options_name')->get();

				$data->properties =  Properties::join('web_options', 'web_options.indentify', 'web_pro_properties.options_indentify')->join('web_options_translation', 'web_options_translation.options_id', 'web_options.id')->where('web_pro_properties.posts_id', $pageData->pages_id)->select('web_options_translation.name as options_name', 'web_pro_properties.options_indentify')->get();
				foreach ($data->properties as $key_properties => $value_properties) {
					$data->properties[$key_properties]->propertiesValue = OptionsValue::where('options_indentify', $value_properties->options_indentify)->where('options_types_indentify', 'properties')->select('name', 'indentify')->get();
				}

				$data->variations = Products::where('posts_id', $pageData->pages_id)->select('*', DB::raw("(CASE WHEN status='show' THEN true ELSE false END) as status"))->orderBy('id')->get();
				foreach ($data->variations as $key => $value) {
					$data->variations[$key]->propertiesValue = PropertiesValue::where('posts_id', $pageData->pages_id)->where('pro_sku', $value->sku)->get();
				}
				$listKeywords = Keywords::join('web_keywords_related', 'web_keywords_related.keywords_id', '=', 'web_keywords.id')->where('web_keywords_related.type', 1)->where('web_keywords_related.pages_id', $pageData->pages_id)->pluck('web_keywords.value');

				$data->related = Posts::join('web_posts_translation', 'web_posts_translation.posts_id', 'web_posts.id')->join('web_path_alias', 'web_path_alias.pages_id', 'web_posts.id')->where('web_posts_translation.langcode', 'vi')->join('web_keywords_related', 'web_keywords_related.pages_id', '=', 'web_posts.id')->join('web_keywords', 'web_keywords_related.keywords_id', '=', 'web_keywords.id')->where('web_keywords_related.type', 1)->whereIn('web_keywords.value', $listKeywords)->where('web_posts.id', '!=', $pageData->pages_id)->where('web_path_alias.langcode', 'vi')->select('*', 'web_posts.id as id', 'web_path_alias.alias as link')->groupBy('web_posts.id')->get();
				// return $data;
				$rootDataForPage['page_title'] = $data->name;
				$rootDataForPage['currentProductData'] = $data;
				return view($data->machine_name, $rootDataForPage);
			case 4:
				$data = Posts::join('web_posts_translation', 'web_posts_translation.posts_id', 'web_posts.id')->join('web_pages', 'web_pages.id', '=', 'web_posts.pages_id')->where('web_posts.id', $pageData->pages_id)->first();
				$data->image = PostImages::where('posts_id', $pageData->pages_id)->get();
				$rootDataForPage['page_title'] = $data->name;
				$rootDataForPage['currentNewsData'] = $data;
				return view($data->machine_name, $rootDataForPage);
				break;
			default:
				$data = Page::join('web_pages_translation', 'web_pages.id', '=', 'web_pages_translation.pages_id')->where('langcode', 'vi')->where('web_pages.id', $pageData->pages_id)->where('type', 0)->select('*', 'web_pages.id as id')->first();
				$rootDataForPage['page_title'] = $data->name;
				return view($data->machine_name, $rootDataForPage);
				break;
		}

		return PathAlias::select(DB::raw('CONCAT(prefix, "", alias) as url'))->get();
		return $path_string;
		return view('home');
	}

	public function controlPageTemplate ($page){
		$themeActive = DB::table('web_themes')->where('status', 1)->first();
		$public_path = 'http://localhost/codecanyon/Separate_installation/VipsPM_laravel/resources/themes/'.$themeActive->folder.'/';
		$file_path = 'http://localhost/codecanyon/Separate_installation/VipsPM_laravel/public/uploads/project/';
		return view($page, ['public_path'=>$public_path, 'file_path'=>$file_path]);
	}

	public function homePage (){
		$themeActive = DB::table('web_themes')->where('status', 1)->first();
		$public_path = 'http://localhost/codecanyon/Separate_installation/VipsPM_laravel/resources/themes/'.$themeActive->folder.'/';
		return view('home', ['public_path'=>$public_path]);
	}

	public function basicTemplate (){
		$themeActive = DB::table('web_themes')->where('status', 1)->first();
		$public_path = 'http://localhost/codecanyon/Separate_installation/VipsPM_laravel/resources/themes/'.$themeActive->folder.'/';
//		return $public_path;
		return view('template-basic', ['public_path'=>$public_path]);
	}

	public function basicTemplateInk (){
		$themeActive = DB::table('web_themes')->where('status', 1)->first();
		$public_path = 'http://localhost/codecanyon/Separate_installation/VipsPM_laravel/resources/themes/'.$themeActive->folder.'/';
		//		return $public_path;
		return view('template-ink_basic', ['public_path'=>$public_path]);
	}

	public function renderPage(){
		$query   = DB::table('pages')
		             ->join('templates', 'templates.id', '=', 'pages.templates_id')
		             ->join('templates_regions', 'templates_regions.templates_id', '=',
			             'templates.id')
		             ->join('regions', 'regions.id', '=', 'templates_regions.regions_id')
		             ->orderBy('templates_regions.index')
		             ->where('pages.id', 1);
		$data = $query->get();
		$regionsData = '';
		foreach ($data as $value){
			$regionHtml = file_get_contents($value->template);
			$widgetData = DB::table('include_widget')
				->join('widgets', 'widgets.id', '=', 'include_widget.widgets_id')
				->where('include_widget.regions_id', $value->regions_id)
				->orderBy('include_widget.index')->pluck('template');
			$widgetHtml = '';
			foreach ($widgetData as $item){
				$widgetHtml .= file_get_contents($item);
			}
			if($widgetHtml != ''){
				$regionHtml = str_replace('[content]', $widgetHtml, $regionHtml);
				$regionsData .= $regionHtml;
			}
		}
		$pageDisplay = file_get_contents('http://localhost/codecanyon/Separate_installation/VipsPM_laravel/resources/page.html');
		$resource = str_replace('[content]', $regionsData, $pageDisplay);
		File::put(resource_path('views/home.blade.php'), $resource);
		return 'write page success';
	}

	public function renderTemplate(){
		$data = DB::table('templates')
		                     ->join('templates_regions', 'templates_regions.templates_id', '=',
			                     'templates.id')
		                     ->join('regions', 'regions.id', '=', 'templates_regions.regions_id')
		                     ->orderBy('templates_regions.index')
		                     ->where('templates.id', 1)->get();

		$regionHtml = '';
		foreach ($data as $value){
			$html = file_get_contents($value->template);
			$regionHtml .= str_replace('[content]', '<div style="background: yellow;">'.$value->name.'</div>', $html);
		}
		$pageDisplay = file_get_contents('http://localhost/codecanyon/Separate_installation/VipsPM_laravel/resources/page.html');
		$resource = str_replace('[content]', $regionHtml, $pageDisplay);
		File::put(resource_path('views/basic-template.blade.php'), $resource);
		return 'write template success';
	}


	public function electronicInvoice(){
		
	}
}
