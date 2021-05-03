<?php

namespace Modules\Seo\Models;

use Illuminate\Database\Eloquent\Model;
/**
 * Class PathAliasSeo
 *
 * The Model is Defined for PathAliasSeo.
 *
 * PHP version 7.1.3
 *
 * @category  PM
 * @package   Modules\PathAliasSeo
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class PathAliasSeo extends Model
{
    const MODULE_NAME = 'PathAliasSeo';
    
    protected $table;

    protected $fillable = [
        "id",
        "path_alias_id",
        "meta_id",
        "content"
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

	    $this->table = 'web_path_alias_seo';
    }
}
