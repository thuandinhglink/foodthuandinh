<?php

namespace Modules\Widget\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use Nicolaslopezj\Searchable\SearchableTrait;

class Widget extends Model
{
    use SearchableTrait;

    const MODULE_NAME = 'Widget';
    
    protected $table;

    protected $fillable = [
        'id',
	    'machine_name',
        'type',
	    'widget_type_id',
        'content_html'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

	    $this->table = 'web_widgets';
    }
}
