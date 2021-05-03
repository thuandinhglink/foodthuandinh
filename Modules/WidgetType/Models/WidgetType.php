<?php

namespace Modules\WidgetType\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use Nicolaslopezj\Searchable\SearchableTrait;

class WidgetType extends Model
{
    use SearchableTrait;

    const MODULE_NAME = 'WidgetType';
    
    protected $table;

    protected $fillable = [
        'id',
        'name',
        'description',
	    'machine_name'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

	    $this->table = 'web_custom_widget_types';
    }
}
