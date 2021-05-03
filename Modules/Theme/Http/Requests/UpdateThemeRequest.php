<?php

namespace Modules\Theme\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class UpdateThemeRequest extends FormRequest
{
    
    public function rules()
    {
        return [
	        'name' => 'required',
	        'folder' => 'required',
	        'content_html' => 'required',
        ];
    }

    public function authorize()
    {
        return true;
    }
}
