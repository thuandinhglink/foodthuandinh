<?php

namespace Modules\Options\Models;

use Illuminate\Database\Eloquent\Model;
/**
 * Class OptionTranslation
 *
 * The Model is Defined for OptionTranslation.
 *
 * PHP version 7.1.3
 *
 * @option  PM
 * @package   Modules\OptionTranslation
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class OptionsTranslation extends Model
{

    const MODULE_NAME = 'OptionsTranslation';

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
        'options_id',
        'langcode',
        'name',
        'description',
    ];


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
        
        $this->table = 'web_options_translation';
    }

}
