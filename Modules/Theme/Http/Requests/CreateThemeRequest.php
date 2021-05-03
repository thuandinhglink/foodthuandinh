<?php

namespace Modules\Theme\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class CreateThemeRequest extends FormRequest
{
    
    public function rules(Request $request)
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
