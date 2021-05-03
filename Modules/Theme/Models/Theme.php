<?php

namespace Modules\Theme\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use Modules\Theme\Models\Attribute\ThemeAttribute;
use Modules\Theme\Models\Relationship\ThemeRelationship;

use Nicolaslopezj\Searchable\SearchableTrait;

class Theme extends Model
{
    use SearchableTrait;

    const MODULE_NAME = 'Theme';
    
    protected $table;

    protected $fillable = [
        'id',
        'name',
        'description',
	    'folder',
	    'machine_name',
        'content_html'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

	    $this->table = 'web_themes';
    }
}
