<?php

namespace Modules\Options\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Option
 *
 * The Model is Defined for Option.
 *
 * PHP version 7.1.3
 *
 * @option  PM
 * @package   Modules\Options
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class Options extends Model
{

    const MODULE_NAME = 'Options';

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table ;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    protected $fillable = [
        'id',
        'indentify',
        'options_types_indentify',
        'name',
        'description',
        // 'icon',
    ];


    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['deleted_at'];

    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    // protected $appends = ['is_overdue'];

    /**
     * Instantiate a new model instance.
     *
     * @param Array $attributes [object]
     *
     * @return void
     */
    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
        
        $this->table = 'web_options';
    }

}
