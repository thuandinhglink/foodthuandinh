<?php

namespace Modules\Region\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class CreateRegionRequest extends FormRequest
{
    
    public function rules(Request $request)
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
