<?php

namespace Modules\Categorys\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class CategoryInfotechs
 *
 * The Model is Defined for CategoryInfotechs.
 *
 * PHP version 7.1.3
 *
 * @CategoryInfotechs  PM
 * @package   Modules\CategoryInfotechs
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class CategoryInfotechs extends Model
{
    const MODULE_NAME = 'CategoryInfotechs';
    protected $table ;

    protected $fillable = [
        'id',
        'po_cates_id',
        'options_indentify'
    ];
    protected $dates = ['deleted_at'];
    
    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
        
        $this->table = 'web_pro_ginfotechs';
    }

}
