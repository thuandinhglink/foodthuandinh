<?php

namespace Modules\Page\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use Nicolaslopezj\Searchable\SearchableTrait;

class PagesTranslation extends Model
{
    use SearchableTrait;

    const MODULE_NAME = 'PagesTranslation';
    
    protected $table;

    protected $fillable = [
        'id',
        'pages_id',
        'langcode',
        'title',
	    'url',
        'description',
	    'name'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

	    $this->table = 'web_pages_translation';
    }
}
