<?php

namespace Modules\Region\Models;

use Illuminate\Database\Eloquent\Model;
/**
 * Class RegionsTranslation
 *
 * The Model is Defined for RegionsTranslation.
 *
 * PHP version 7.1.3
 *
 * @category  PM
 * @package   Modules\RegionsTranslation
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */

class RegionsTranslation extends Model
{
    const MODULE_NAME = 'RegionsTranslation';
    
    protected $table;

    protected $fillable = [
        'id',
        'langcode',
        'regions_id',
        'name',
        'description'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

	    $this->table = 'web_regions_translation';
    }
}
