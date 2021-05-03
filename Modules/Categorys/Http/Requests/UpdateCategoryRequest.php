<?php

namespace Modules\Categorys\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use App\Rules\EstimatedHours;

/**
 * Class UpdateCategoryRequest
 *
 * The Validation Rules is Defined for Category.
 *
 * PHP version 7.1.3
 *
 * @category  PM
 * @package   Modules\Categorys
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class UpdateCategoryRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            // 'keyword' => 'required',
            'name' => 'required',
            // 'page_description' => 'required',
            // 'page_title' => 'required',
            // 'parent_id' => 'required',
            'active' => 'required',
            'pages_id' => 'required',
            // 'template' => 'required',
            'url_and_handle' => 'required'
        ];
    }

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }
}
