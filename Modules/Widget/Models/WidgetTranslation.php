<?php

namespace Modules\Widget\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use Nicolaslopezj\Searchable\SearchableTrait;

class WidgetTranslation extends Model
{
    use SearchableTrait;

    const MODULE_NAME = 'WidgetTranslation';
    
    protected $table;

    protected $fillable = [
        'id',
        'name',
        'description',
	    'custom_field',
        'langcode',
        'widgets_id',
	    'custom_field_multiple'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

	    $this->table = 'web_widgets_translation';
    }
}
