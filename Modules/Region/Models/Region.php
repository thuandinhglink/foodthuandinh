<?php

namespace Modules\Region\Models;

use Illuminate\Database\Eloquent\Model;
/**
 * Class Region
 *
 * The Model is Defined for Region.
 *
 * PHP version 7.1.3
 *
 * @category  PM
 * @package   Modules\Region
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class Region extends Model
{
    const MODULE_NAME = 'Region';
    
    protected $table;

    protected $fillable = [
        'id',
	    'machine_name',
	    'number_content',
        'content_html'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

	    $this->table = 'web_regions';
    }
}
