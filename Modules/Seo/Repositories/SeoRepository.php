<?php
namespace Modules\Seo\Repositories;

use Auth;
use DB;
use Modules\Defect\Models\Defect;
use Modules\Helper\Helpers\CommonHelper;
use Modules\Incident\Models\Incident;
use Modules\Seo\Models\Seo;
use Illuminate\Support\Facades\File;
use Modules\Helper\Helpers\WebHelper;
use Modules\Helper\Models\Keywords;
use Storage;

/**
 * Class SeoRepository
 *
 * Seo create, update, delete and view.
 *
 * PHP version 7.1.3
 *
 * @category  PM
 * @package   Modules\Seo
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class SeoRepository
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
		return Seo::where('type', 1)->select('*', DB::raw('CONCAT(attr, \'=\', value) as label'))->get();
	}

	public function getAllSeo($request)
	{
		$totalData = Seo::count();
		$columns = array(
			0 => 'id',
			1 => 'attr',
			2 => 'value'
		);

		$limit = $request->input('length');
		$start = $request->input('start');
		$order = $columns[$request->input('order.0.column')];
		$dir = $request->input('order.0.dir');

		if (!empty($request->input('search.value'))) {
			$search = $request->input('search.value');

			$widget = Seo::where(
				function ($query) use ($search) {
					$query->where('attr', 'LIKE', "%{$search}%")
					      ->orWhere('value', 'LIKE', "%{$search}%");
				}
			);

			$totalFiltered = $widget->count();

			$widget = $widget->offset($start)
		                   ->limit($limit)
		                   ->orderBy($order, $dir)
		                   ->get();
		} else {
			$widget = Seo::offset($start)
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
		$widget = new Seo;
		$input = $request->all();

		DB::beginTransaction();
		try {
			Seo::create($input);
        	DB::commit();
			return true;
        } catch (\Exception $e) {
		    DB::rollback();
		    return $this->webHelper->ParseException($e);
		}
		return false;
	}

	public function update($request, $id)
	{
		$input = $request->all();
		DB::beginTransaction();
		try {
			Seo::where('id', $id)->update($input);
        	DB::commit();
			return true;
        } catch (\Exception $e) {
		    DB::rollback();
		    return $this->webHelper->ParseException($e);
		}
		return false;
	}
	public function delete($id)
	{
		DB::beginTransaction();
		try {
			Seo::where('id', $id)->delete();
			DB::commit();
			return true;
        } catch (\Exception $e) {
		    DB::rollback();
		    return $this->webHelper->ParseException($e);
		}
	}

	public function getAllKeyword(){
		return Keywords::pluck('value');
	}
}
