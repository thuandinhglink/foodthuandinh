<?php

namespace Modules\WebMenu\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use Nicolaslopezj\Searchable\SearchableTrait;

class WebSubMenu extends Model
{
    use SearchableTrait;

    const MODULE_NAME = 'WebSubMenu';
    
    protected $table;

    protected $fillable = [
        'id',
        'name',
        'type',
        'parent_id',
        'menu_id',
        'type_show',
        'page_id',
        'index',
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

	    $this->table = 'web_sub_menus';
    }
}
