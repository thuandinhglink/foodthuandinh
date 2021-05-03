<?php

namespace Modules\WidgetType\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class CreateWidgetTypeRequest extends FormRequest
{
    
    public function rules(Request $request)
    {
        return [
            'name' => 'required'
        ];
    }

    public function authorize()
    {
        return true;
    }
}
