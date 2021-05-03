<?php

namespace Modules\Page\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use Modules\Page\Models\Attribute\PageAttribute;
use Modules\Page\Models\Relationship\PageRelationship;

use Nicolaslopezj\Searchable\SearchableTrait;

class PageTranslation extends Model
{
    public $timestamps = false;

    protected $fillable = ['name', 'description', 'title', 'url'];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

	    $this->table = 'web_pages_translation';
    }
}
