<?php

namespace Modules\Region\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class UpdateRegionRequest extends FormRequest
{
    
    public function rules()
    {
        return [
            'name' => 'required',
            'number_content' => 'required',
            'content_html' => 'required',
        ];
    }

    public function authorize()
    {
        return true;
    }
}
