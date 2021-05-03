<?php
namespace Modules\Helper\Helpers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Modules\Theme\Models\Theme;
use Modules\WebMenu\Models\WebMenu;
use Modules\WebMenu\Models\WebSubMenu;
use Modules\Page\Models\Page;
use Modules\Categorys\Models\Categorys;
use Modules\Collections\Models\Collections;
use Modules\Posts\Models\Posts;
use Modules\Page\Models\IncludeWidget;
use Modules\Widget\Models\WidgetData;
use Modules\Seo\Models\PathAliasSeo;
use Modules\Helper\Models\Keywords;
use Modules\Helper\Models\KeywordsRelated;
use Storage;

/**
 * Class AdminHelper
 *
 * The Helper is Defined for global helper functions.
 *
 * PHP version 7.1.3
 *
 * @category  Helper
 * @package   Modules\Helper
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class WebHelper
{
	public function getThemeActive(){
		return Theme::where('status', 1)->first();
	}

	public function buildTemplate($template_id){
		$templateData = DB::table('web_templates')->where('id', $template_id)->first();
		$data = DB::table('web_templates')
		          ->join('web_template_region', 'web_template_region.templates_id', '=',
			          'web_templates.id')
		          ->join('web_regions', 'web_regions.id', '=', 'web_template_region.regions_id')
		          ->join('web_regions_translation', 'web_regions.id', '=', 'web_regions_translation.regions_id')
		          ->orderBy('web_template_region.index')
				  ->where('web_regions_translation.langcode', 'vi')
		          ->where('web_templates.id', $template_id)
				  ->where('web_template_region.status', 1)
		          ->select('web_regions.content_html', 'web_regions_translation.name', 'web_regions.number_content as number_content')
		          ->get();

		$regionHtml = '';
		$themeActive = $this->getThemeActive();
		foreach ($data as $value){
			$html = file_get_contents(resource_path('themes/'.$themeActive['folder'].$value->content_html));
			for ($x = 0; $x < $value->number_content; $x++) {
				if($value->number_content > 1){
					$html = str_replace('[content'.$x.']', '<div style="background: yellow;">'.$value->name.$x.'</div>', $html);
				} else {
					$html = str_replace('[content'.$x.']', '<div style="background: yellow;">'.$value->name.'</div>', $html);
				}
			}
			$regionHtml .= $html;
		}
		$pageDisplay = file_get_contents(resource_path('themes/'.$themeActive['folder'].'/page.html'));
		$resource = str_replace('[content]', $regionHtml, $pageDisplay);
		File::put(resource_path('views/template-'.$templateData->machine_name.'.blade.php'), $resource);
		return;
	}

	public function relevantPageRebuild($id, $type){

		$listWidget = WidgetData::where(
			function ($query) use ($id) {
				$query->where('data_id', 'LIKE', "%[{$id},%")
					->orWhere('data_id', 'LIKE', "%[{$id}]%")
					->orWhere('data_id', 'LIKE', "%,{$id}]%")
					->orWhere('data_id', 'LIKE', "%,{$id},%");
			}
		)->whereIn('data_type', $type)->pluck('widgets_id');
		$buildData = IncludeWidget::whereIn('widgets_id', $listWidget)->groupBy('pages_id')->pluck('pages_id');

		foreach ($buildData as $value){
			$this->buildPage($value);
		}
	}
				
	public function buildPage($page_id){
		$pageData = DB::table('web_pages')->join('web_pages_translation', 'web_pages.id', '=', 'web_pages_translation.pages_id')->where('web_pages.id', $page_id)->where('web_pages_translation.langcode', 'vi')->select('*', 'web_pages.id as id')->first();
		if(!$pageData){
			return;
		}
		$template = DB::table('web_template_region')->join('web_regions', 'web_regions.id', '=', 'web_template_region.regions_id')->join('web_regions_translation', 'web_regions.id', '=', 'web_regions_translation.regions_id')
					  ->where('web_regions_translation.langcode', 'vi')
		              ->where('web_template_region.templates_id', $pageData->templates_id)
		              ->where('web_template_region.status', 1)
		              ->select('web_template_region.*', 'web_regions.content_html','web_regions_translation.name as region_name', 'web_regions.number_content')
		              ->orderBy('index')->get();
		$regionsData = '';
		$themeActive = $this->getThemeActive();
		foreach ($template as $value){
			if(file_exists(resource_path('themes/'.$themeActive['folder'].$value->content_html))){
				$regionHtml = file_get_contents(resource_path('themes/'.$themeActive['folder'].$value->content_html));
				for ($x = 0; $x < $value->number_content; $x++) {
					$widgetData = DB::table('web_include_widget')->join('web_widgets', 'web_widgets.id', '=', 'web_include_widget.widgets_id')->join('web_widgets_translation', 'web_widgets.id', '=', 'web_widgets_translation.widgets_id')->leftJoin('web_widgets_data', 'web_widgets.id', '=', 'web_widgets_data.widgets_id')
									->where('web_widgets_translation.langcode', 'vi')
					                ->where('web_include_widget.pages_id', $pageData->id)
					                ->where('web_include_widget.regions_id', $value->regions_id)
									->where('web_include_widget.regions_number', $x)
									->where('web_include_widget.status', 1)
					                ->orderBy('web_include_widget.index')
					                ->select('web_widgets.content_html', 'web_widgets_translation.custom_field', 'web_widgets_translation.custom_field_multiple', 'web_widgets.machine_name', 'web_widgets_data.data_type', 'web_widgets_data.data_id', 'web_widgets.id as id')
					                ->get();
					$widgetHtml = '';

					foreach ($widgetData as $item){
						if(file_exists((resource_path('themes/'.$themeActive['folder'].$item->content_html)))){
							$multipleData = [];
							$custom_field_multiple = json_decode($item->custom_field_multiple, true);
							$custom_fieldData = [];
							$custom_field = json_decode($item->custom_field, true);
							if($custom_field && count($custom_field) > 0){
								foreach ($custom_field as $key=>$valueCustomField){
									foreach ($valueCustomField as $key2=>$value2){
										$custom_fieldData[ $key2] = $value2;
									}
								}
							}
							
							if($custom_field_multiple && count($custom_field_multiple) > 0 ){
								foreach ($custom_field_multiple as $keyMulti => $itemMulti){
									foreach ($itemMulti as $keyMulti1 => $itemMulti1){
										$multipleData[$keyMulti][ $keyMulti1] = $itemMulti1;
									}
								}
							}


							$widgetHtml .= "<?php $" .$item->machine_name."= json_decode('".json_encode($custom_fieldData)."', true); $" .$item->machine_name. "['multipleData'] = json_decode('".json_encode($multipleData)."', true); ?>";
							$check_data_valid = true;
							if($item->data_type && $item->data_id){

								switch ($item->data_type) {
									case 3:
										if($pageData->type != 1){
											$check_data_valid = false;
										}
										break;
									case 6:
										if($pageData->type != 2){
											$check_data_valid = false;
										}
										break;
									case 8:
										if($pageData->type != 3){
											$check_data_valid = false;
										}
										break;
									case 10:
										if($pageData->type != 4){
											$check_data_valid = false;
										}
										break;
									default:
										$check_data_valid = true;
										break;
								}
								if($check_data_valid){
									$widgetUseDataRender = $this->getWidgetUseData($item);
									$widgetHtml .= "<?php $"."widgetUseData = json_decode('".json_encode($widgetUseDataRender)."', true); ?>";
								}
							}
							if($check_data_valid){
								$widgetHtml .= file_get_contents(resource_path('themes/'.$themeActive['folder'].$item->content_html));
							} else {
								$widgetHtml .= "<h2>Không tìm thấy dữ liệu</>";
							}
						}
					}
					$regionHtml = str_replace('[content'.$x.']', $widgetHtml, $regionHtml);
				}	
			}
			$regionsData .= $regionHtml;
		}

		$pageDisplay = file_get_contents(resource_path('themes/'.$themeActive['folder'].'/page.html'));
		$resource = str_replace('[content]', $regionsData, $pageDisplay);
		File::put(resource_path('views/'.$pageData->machine_name.'.blade.php'), $resource);
		return 'write page success';

	}

	public function getWidgetUseData($widget){
		switch ($widget->data_type) {
			case 1: // categpry news
			case 2: // category products
				$widgetUseData = DB::table('web_po_cates')->join('web_po_cates_translation', 'web_po_cates_translation.po_cates_id', 'web_po_cates.id')->where('langcode', 'vi')->whereIn('web_po_cates.id', json_decode($widget->data_id))->select('*', 'web_po_cates.id as id')->get();
				break;
			case 4: // collections news
			case 5:  // collections products
				$widgetUseData = DB::table('web_collections')->join('web_collections_translation', 'web_collections_translation.collections_id', 'web_collections.id')->where('langcode', 'vi')->whereIn('web_collections.id', json_decode($widget->data_id))->select('*', 'web_collections.id as id')->get();
				break;
			case 11: // menu
				$widgetUseData = WebMenu::whereIn('id', json_decode($widget->data_id))->get();
				foreach ($widgetUseData as $item) {
					$item->chidData = WebSubMenu::whereNull('parent_id')->where('menu_id', $item->id)->orderBy('index')->get();
					foreach ($item->chidData as $value) {
						$value['name'] = $this->getSubMenuName($value);
						$value['link'] = $this->getSubMenuLink($value);
						$resultData = $this->getChidSubMenu($value, 1);
					 	$value['chidData'] = $resultData['data'];
					}
				}
				break;
			case 7:
			case 9:
				$widgetUseData = Posts::join('web_posts_translation', 'web_posts_translation.posts_id', 'web_posts.id')->join('web_path_alias', 'web_path_alias.pages_id', 'web_posts.id')->where('web_posts_translation.langcode', 'vi')->where('web_path_alias.langcode', 'vi')->whereIn('web_posts.id', json_decode($widget->data_id))->select('*', 'web_posts.id as id', 'web_path_alias.alias as link')->get();
				break;
			default:
				$widgetUseData = [];
				break;
		}
		return $widgetUseData;
	}

	public function getAllFields(){
		return DB::table('web_fields')->get();
	}

	function stripVN($str) {
		$str = preg_replace("/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/", 'a', $str);
		$str = preg_replace("/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/", 'e', $str);
		$str = preg_replace("/(ì|í|ị|ỉ|ĩ)/", 'i', $str);
		$str = preg_replace("/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/", 'o', $str);
		$str = preg_replace("/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/", 'u', $str);
		$str = preg_replace("/(ỳ|ý|ỵ|ỷ|ỹ)/", 'y', $str);
		$str = preg_replace("/(đ)/", 'd', $str);

		$str = preg_replace("/(À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ)/", 'A', $str);
		$str = preg_replace("/(È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ)/", 'E', $str);
		$str = preg_replace("/(Ì|Í|Ị|Ỉ|Ĩ)/", 'I', $str);
		$str = preg_replace("/(Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ)/", 'O', $str);
		$str = preg_replace("/(Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ)/", 'U', $str);
		$str = preg_replace("/(Ỳ|Ý|Ỵ|Ỷ|Ỹ)/", 'Y', $str);
		$str = preg_replace("/(Đ)/", 'D', $str);

		$str = strtolower(preg_replace('/\s+/', '_', $str));

		return $str;
	}

	public function setCookieLang(){

	}

	public function getCookieLang(){
		Cookie::queue(Cookie::make('name', 'value', $minutes));
	}

	public function _uploadImage($imageData, $path)
	{
		$image_parts = explode(";base64,", $imageData);
		if (count($image_parts) >= 2) {
			$image_type_aux = explode("image/", $image_parts[0]);
			$image_base64 = base64_decode($image_parts[1]);
			$filename = uniqid() . '.'. $image_type_aux[1];
			if (!Storage::disk($path)->put($filename, $image_base64)) {
				return null;
			} else {
				return $filename;
			}
		} else {
			return $imageData;
		}
	}

	public function ParseException($e,$is_active = false)
    {
        $DEV = false;
        $msg = '';
        $info = '';
        $status = false;
        if(isset($e->errorInfo) && is_array($e->errorInfo)){
            $errorInfo = $e->errorInfo[0];
        }else{
            return ['status' => $status, 'msg' => $e->getMessage()];
        }
        switch ($errorInfo ) {
            case '42S22':
            if ($DEV) {
                $msg  = implode(" | ",$e->errorInfo) . "| " . $e->getMessage();
                $info  = implode(" | ",$e->errorInfo) . "| " . $e->getMessage();

            } else {
                $msg = "Column not found";
                $info  = implode(" | ",$e->errorInfo) . "| " . $e->getMessage();
            }
            break;
            case '45000':
            if ($DEV) {
                $msg  = implode(" | ",$e->errorInfo) . "| " . $e->getMessage();
                $info  = implode(" | ",$e->errorInfo) . "| " . $e->getMessage();

            } else {
                $msg = $e->errorInfo[2];
                $info  = implode(" | ",$e->errorInfo) . "| " . $e->getMessage();
            }
            break;
            case '23000':
            if ($DEV) {
                $msg  = implode(" | ",$e->errorInfo) . "| " . $e->getMessage();
                $info  = implode(" | ",$e->errorInfo) . "| " . $e->getMessage();
            } else {
                isset($e->errorInfo[2]) ? $err_msg = $e->errorInfo[2] : $err_msg = '';
                isset($e->errorInfo[1]) ? $sub_code = $e->errorInfo[1] : $sub_code = 0;
                switch ($sub_code) {
                    case 1451:
                    $arr_data_messege = explode("`",$err_msg);
                    $table_relate = $arr_data_messege[3];
                    $table_root = $arr_data_messege[9];
                    $msg = 'There are data of '.$table_relate.' associated to this '.$table_root.' so we cannot delete this '.$table_root.'.';
                    if($is_active){
                        $status = true;
                        $msg .= 'Deactivate '.$table_root.' instead.';
                    }   
                    break;
                    case 1048:
                    case 1062:
                    $msg = $err_msg;
                    break;
                }
                $info  = implode(" | ",$e->errorInfo) . "| " . $e->getMessage();  
            }
            break;
            default:
            break;
        }
        return ['status' => $status, 'msg' => $msg,'info'=>$info,'errorInfo'=> $e->errorInfo];
    }

    public function getSubMenuName($data){
		switch ($data->type) {
			case 2:
				$pageData = Page::join('web_pages_translation', 'web_pages.id', '=', 'web_pages_translation.pages_id')->where('langcode', 'vi')->where('type', 0)->where('web_pages.id', $data->page_id)->first();
				break;
			case 3:
			case 4:
				$pageData = Categorys::join('web_po_cates_translation', 'web_po_cates_translation.po_cates_id', 'web_po_cates.id')->where('langcode', 'vi')->where('web_po_cates.id', $data->page_id)->first();
				break;
			case 5:
			case 6:
				$pageData = Collections::join('web_collections_translation', 'web_collections_translation.collections_id', 'web_collections.id')->where('langcode', 'vi')->where('web_collections.id', $data->page_id)->first();
				break;
			case 7:
			case 8:
				$pageData = Posts::join('web_posts_translation', 'web_posts_translation.posts_id', 'web_posts.id')->where('web_posts_translation.langcode', 'vi')->where('web_posts.id', $data->page_id)->first();
				break;
			default:
				$pageData = false;
				break;
		}
		if($pageData){
			return $pageData['name'];
		} else {
			return $data->name;
		}
	}

	public function getSubMenuLink($data){
		switch ($data->type) {
			case 2:
				$pageData = Page::join('web_pages_translation', 'web_pages.id', '=', 'web_pages_translation.pages_id')->where('langcode', 'vi')->where('type', 0)->where('web_pages.id', $data->page_id)->first();
				if ($pageData) {
					return $pageData->url;
				} else {
					return '#';
				}
				break;
			case 3:
			case 4:
				$pageData = Categorys::join('web_po_cates_translation', 'web_po_cates_translation.po_cates_id', 'web_po_cates.id')->join('web_path_alias', 'web_path_alias.pages_id', 'web_po_cates.id')->where('web_po_cates_translation.langcode', 'vi')->where('web_po_cates.id', $data->page_id)->where('web_path_alias.type', 1)->first();
				if ($pageData) {
					return $pageData->alias;
				} else {
					return '#';
				}
				break;
			case 5:
			case 6:
				$pageData = Collections::join('web_collections_translation', 'web_collections_translation.collections_id', 'web_collections.id')->join('web_path_alias', 'web_path_alias.pages_id', 'web_collections.id')->where('web_collections_translation.langcode', 'vi')->where('web_collections.id', $data->page_id)->where('web_path_alias.type', 2)->first();
				if ($pageData) {
					return $pageData->alias;
				} else {
					return '#';
				}
				break;
			case 7:
			case 8:
				$pageData = Posts::join('web_posts_translation', 'web_posts_translation.posts_id', 'web_posts.id')->join('web_path_alias', 'web_path_alias.pages_id', 'web_posts.id')->where('web_posts_translation.langcode', 'vi')->where('web_posts.id', $data->page_id)->whereIn('web_path_alias.type', [3,4])->first();
				if ($pageData) {
					return $pageData->alias;
				} else {
					return '#';
				}
				break;
			default:
				return '#';
				break;
		}
	}


	public function getChidSubMenu($data, $colspan){
		if($data->type == 1){
			$chidData = WebSubMenu::where('parent_id', $data->id)->get();
			if(count($chidData) > 0){
				$colspan ++;
			}
			foreach ($chidData as $key => $value) {
				$value['name'] = $this->getSubMenuName($value);
				$value['link'] = $this->getSubMenuLink($value);
				$resultData = $this->getChidSubMenu($value, $colspan);
				$value['chidData'] = $resultData['data'];
				$value['colspan'] = $colspan -1;
	 			$colspan = $resultData['colspan'] > $colspan ? $resultData['colspan'] : $colspan;
			}
			return ['data'=>$chidData, 'colspan'=>$colspan];
		} else {
			return ['data'=>[], 'colspan'=>$colspan];
		}
	}

	public function saveMetaSeo($data, $path_alias_id){
		PathAliasSeo::where('path_alias_id', $path_alias_id)->delete();
		foreach ($data as $value) {
			PathAliasSeo::create([
				"path_alias_id"=>$path_alias_id,
		        "meta_id"=>$value['meta_id'],
		        "content"=>$value['content']
			]);
		}
		return true;
	}

    public function getDataHint($action){
    	switch ($action) {
    		case 1: // Category (News)
    		case 2: // Category (Product)
    		return '{{$widgetUseData["id"]}} <br>
						{{$widgetUseData["name"]}} <br>
						{{$widgetUseData["description"]}} <br>
						{{$file_path}}{{$widgetUseData["avatar"]}} <br>
						@foreach($widgetUseData["chidData"] as $value) <br>
							{{$value["id"]}} <br>
							{{$value["name"]}} <br>
							{{$value["description"]}} <br>
							{{$file_path}}{{$value["avatar"]}} <br>
							{{$public_path}}{{$value["link"]}} <br>
							{{$currentProductData["price"]}} <br>
							{{$currentProductData["compare_price"]}} <br>
						@endforeach';
				break;
    		case 4: // Collection (News)
    		case 5: // Collection (Product)
    		return '{{$widgetUseData["id"]}} <br>
					{{$widgetUseData["name"]}} <br>
					{{$widgetUseData["description"]}} <br>
					{{$file_path}}{{$widgetUseData["avatar"]}} <br>
					@foreach($widgetUseData["chidData"] as $value) <br>
						{{$value["id"]}} <br>
						{{$value["name"]}} <br>
						{{$value["description"]}} <br>
						{{$file_path}}{{$value["avatar"]}} <br>
						{{$public_path}}{{$value["link"]}} <br>
						{{$currentProductData["price"]}} <br>
						{{$currentProductData["compare_price"]}} <br>
					@endforeach';
				break;
    		case 7: // Products
    		case 9: // News
    			return '@foreach($widgetUseData as $value) <br>
								{{$value["id"]}} <br>
								{{$value["name"]}} <br>
								{{$value["parent_id"]}} <br>
								{{$value["description"]}} <br>
								{{$value["content"]}} <br>
								{{$value["active"]}} <br>
								{{$file_path}}{{$value["avatar"]}} <br>
								{{$public_path}}{{$value["link"]}} <br>
							@endforeach';
    			break;
    		case 6: // Collection Details
    		return '{{$currentCollectionData["id"]}} <br>
					{{$currentCollectionData["name"]}} <br>
					{{$currentCollectionData["description"]}} <br>
					{{$file_path}}{{$currentCollectionData["avatar"]}} <br>
					@foreach($currentCollectionData["chidData"] as $value) <br>
						{{$value["id"]}} <br>
						{{$value["name"]}} <br>
						{{$value["description"]}} <br>
						{{$file_path}}{{$value["avatar"]}} <br>
						{{$public_path}}{{$value["link"]}} <br>
					@endforeach';
    		break;
    		case 3: // Category Details
    			return '{{$currentCategoryData["id"]}} <br>
						{{$currentCategoryData["name"]}} <br>
						{{$currentCategoryData["description"]}} <br>
						{{$file_path}}{{$currentCategoryData["avatar"]}} <br>
						@foreach($currentCategoryData["chidData"] as $value) <br>
							{{$value["id"]}} <br>
							{{$value["name"]}} <br>
							{{$value["description"]}} <br>
							{{$file_path}}{{$value["avatar"]}} <br>
							{{$public_path}}{{$value["link"]}} <br>
						@endforeach';
    			break;
    		case 8: // Products Details
    		return '{{$currentProductData["id"]}} <br>
					{{$currentProductData["name"]}} <br>
					{{$currentProductData["parent_id"]}} <br>
					{{$currentProductData["description"]}} <br>
					{!!$currentNewsData["content"]!!} <br>
					{{$currentProductData["active"]}} <br>
					{{$currentProductData["price"]}} <br>
					{{$currentProductData["compare_price"]}} <br>
					{{$file_path}}{{$currentProductData["avatar"]}} <br>
					@foreach($currentProductData["image"] as $value) <br>
						{{$file_path}}{{$value["url"]}} <br>
					@endforeach <br>
					@foreach($currentProductData["infotechs"] as $value) <br>
						{{$value["value_name"]}} <br>
						{{$value["option_name"]}} <br>
					@endforeach <br>
					@foreach($currentProductData["properties"] as $value) <br>
						{{$value["options_name"]}} <br>
						{{$value["options_indentify"]}} <br>
						@foreach($currentProductData["propertiesValue"] as $propertiesValue) <br>
							{{$propertiesValue["name"]}} <br>
							{{$propertiesValue["indentify"]}} <br>
						@endforeach <br>
					@endforeach <br>
					@foreach($currentProductData["variations"] as $value) <br>
						{{$value["status"]}} <br>
						{{$value["price"]}} <br>
						{{$value["compare_price"]}} <br>
						@foreach($value["propertiesValue"] as $propertiesValue) <br>
							{{$propertiesValue["options_indentify"]}} <br>
							{{$propertiesValue["option_value_indentify"]}} <br>
						@endforeach <br>
					@endforeach <br>
					@foreach($currentProductData["related"] as $value) <br>
						{{$value["id"]}} <br>
						{{$value["name"]}} <br>
						{{$value["description"]}} <br>
						{{$file_path}}{{$value["avatar"]}} <br>
						{{$public_path}}{{$value["link"]}} <br>
						{{$currentProductData["price"]}} <br>
					{{$currentProductData["compare_price"]}} <br>
					@endforeach <br>';
					
    			break;
    		case 10: // News Details
    			return '{{$currentNewsData["id"]}} <br>
						{{$currentNewsData["name"]}} <br>
						{{$currentNewsData["parent_id"]}} <br>
						{{$currentNewsData["description"]}} <br>
						{!!$currentNewsData["content"]!!} <br>
						{{$currentNewsData["active"]}} <br>
						{{$file_path}}{{$currentNewsData["avatar"]}} <br>
						@foreach($currentNewsData["image"] as $value) <br>
							{{$file_path}}{{$value["url"]}} <br>
						@endforeach <br>';
    			break;
    		case 11: // Menus
    			return '@foreach($widgetUseData[0] as $value) <br>
							{{$value["name"]}} <br>
							{{$value["link"]}} <br>
							@foreach($value["chidData"] as $item) <br>
								{{$item["name"]}} <br>
								{{$item["link"]}} <br>
								.........many levels <br>
							@endforeach <br>
						@endforeach';
    			break;
    	}
    }
    
    public function addKeyword($data, $pages_id, $type){
    	if(is_array($data) && count($data) > 0){
    		KeywordsRelated::where('pages_id', $pages_id)->where('type', $type)->delete();
	    	foreach ($data as $key => $value) {
	    		$keywords = Keywords::where('value', $value)->first();
	    		if(!$keywords){
	    			$keywords = Keywords::create(['value'=>$value]);
	    		}
	    		$keywords = KeywordsRelated::create([
	    			'pages_id'=>$pages_id,
	    			'type'=>$type,
	    			'keywords_id'=>$keywords->id
	    		]);
	    	}
    	}
    	return true;
    }
}
