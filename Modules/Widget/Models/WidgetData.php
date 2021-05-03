<?php

namespace Modules\Widget\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use Nicolaslopezj\Searchable\SearchableTrait;

class WidgetData extends Model
{
    use SearchableTrait;

    const MODULE_NAME = 'WidgetData';
    
    protected $table;

    protected $fillable = [
        'id',
        'data_id',
        'data_type',
        'widgets_id'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

	    $this->table = 'web_widgets_data';
    }
}
