<?php

namespace Modules\Page\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use Modules\Page\Models\Attribute\PageAttribute;
use Modules\Page\Models\Relationship\PageRelationship;

use Nicolaslopezj\Searchable\SearchableTrait;

class Page extends Model
{
    use SearchableTrait;

    const MODULE_NAME = 'Page';
    
    protected $table;

    protected $fillable = [
        'id',
        'type',
        'machine_name',
	    'templates_id'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

	    $this->table = 'web_pages';
    }
}
