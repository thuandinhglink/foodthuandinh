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
 * @package   Modules\OptionsValue
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class OptionsValue extends Model
{

    const MODULE_NAME = 'OptionsValue';

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
        'name',
        'options_indentify',
        'options_types_indentify',
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
        
        $this->table = 'web_options_value';
    }

}
