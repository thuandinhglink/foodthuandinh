<?php

namespace Modules\WidgetType\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


use Nicolaslopezj\Searchable\SearchableTrait;

class WidgetTypeField extends Model
{
	use SearchableTrait;

	const MODULE_NAME = 'WidgetTypeField';

	protected $table;

	protected $fillable = [
		'id',
		'field_id',
		'widget_type_id',
		'label',
		'render_type',
		'machine_name',
		'select_options',
		'is_required',
		'index'
	];

	public function __construct(array $attributes = [])
	{
		parent::__construct($attributes);

		$this->table = 'web_custom_widget_type_fields';
	}
}
