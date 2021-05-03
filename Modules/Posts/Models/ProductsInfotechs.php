<?php

namespace Modules\Posts\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class ProductsInfotechs
 *
 * The Model is Defined for ProductsInfotechs.
 *
 * PHP version 7.1.3
 *
 * @ProductsInfotechs  PM
 * @package   Modules\ProductsInfotechs
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class ProductsInfotechs extends Model
{
    const MODULE_NAME = 'ProductsInfotechs';
    protected $table ;

    protected $fillable = [
        'id',
       	'posts_id',
       	'po_cates_id',
       	'options_indentify',
       	'options_value_indentify'
    ];
    protected $dates = ['deleted_at'];
    
    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
        
        $this->table = 'web_pro_vinfotechs';
    }

}
