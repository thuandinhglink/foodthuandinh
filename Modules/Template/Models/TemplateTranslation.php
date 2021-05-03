<?php

namespace Modules\Template\Models;

use Illuminate\Database\Eloquent\Model;

use Nicolaslopezj\Searchable\SearchableTrait;

class TemplateTranslation extends Model
{
    use SearchableTrait;

    const MODULE_NAME = 'TemplateTranslation';
    
    protected $table;

    protected $fillable = [
        'id',
        'name',
        'langcode',
        'templates_id',
        'description'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

	    $this->table = 'web_templates_translation';
    }
}
