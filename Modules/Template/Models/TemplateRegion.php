<?php

namespace Modules\Template\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use Nicolaslopezj\Searchable\SearchableTrait;

class TemplateRegion extends Model
{
	use SearchableTrait;

	const MODULE_NAME = 'TemplateRegion';

	protected $table;

	protected $fillable = [
		'id',
		'regions_id',
		'templates_id',
		'index'
	];

	public function __construct(array $attributes = [])
	{
		parent::__construct($attributes);

		$this->table = 'web_template_region';
	}
}
