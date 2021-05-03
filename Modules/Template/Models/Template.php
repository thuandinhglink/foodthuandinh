<?php

namespace Modules\Template\Models;

use Illuminate\Database\Eloquent\Model;

use Nicolaslopezj\Searchable\SearchableTrait;

class Template extends Model
{
    use SearchableTrait;

    const MODULE_NAME = 'Template';
    
    protected $table;

    protected $fillable = [
        'id',
	    'machine_name',
        'content_html'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

	    $this->table = 'web_templates';
    }
}
