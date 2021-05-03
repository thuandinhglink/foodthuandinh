<?php

namespace Modules\Posts\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Post
 *
 * The Model is Defined for Post.
 *
 * PHP version 7.1.3
 *
 * @Post  PM
 * @package   Modules\Posts
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class Posts extends Model
{
    const MODULE_NAME = 'Posts';
    protected $table ;

    protected $fillable = [
        'id',
        'po_cates_id',
        'po_types_indentify',
        'pages_id',
        'compare_price',
        'price',
        'avatar',
        'manufacturers',
        'active'
    ];
    protected $dates = ['deleted_at'];
    
    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
        
        $this->table = 'web_posts';
    }

}
