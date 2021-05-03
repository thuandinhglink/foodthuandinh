<?php

namespace Modules\Seo\Models;

use Illuminate\Database\Eloquent\Model;
/**
 * Class Seo
 *
 * The Model is Defined for Seo.
 *
 * PHP version 7.1.3
 *
 * @category  PM
 * @package   Modules\Seo
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class Seo extends Model
{
    const MODULE_NAME = 'Seo';
    
    protected $table;

    protected $fillable = [
        'id',
        'attr',
        'value',
        'type',
        'default'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

	    $this->table = 'web_meta';
    }
}
