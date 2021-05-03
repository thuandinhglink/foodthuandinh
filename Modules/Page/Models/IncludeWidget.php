<?php

namespace Modules\Page\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


use Nicolaslopezj\Searchable\SearchableTrait;

class IncludeWidget extends Model
{
	use SearchableTrait;

	const MODULE_NAME = 'Page';

	protected $table;

	protected $fillable = [
		'id',
		'widgets_id',
		'pages_id',
		'regions_number',
		'regions_id',
		'index'
	];

	public function __construct(array $attributes = [])
	{
		parent::__construct($attributes);

		$this->table = 'web_include_widget';
	}
}
