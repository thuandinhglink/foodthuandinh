<?php

namespace Modules\WebMenu\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use Nicolaslopezj\Searchable\SearchableTrait;

class WebMenu extends Model
{
    use SearchableTrait;

    const MODULE_NAME = 'WebMenu';
    
    protected $table;

    protected $fillable = [
        'id',
        'name',
        'description',
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

	    $this->table = 'web_menus';
    }
}
