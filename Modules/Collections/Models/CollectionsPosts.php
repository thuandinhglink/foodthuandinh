<?php

namespace Modules\Collections\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Collection
Posts *
 * The Model is Defined for Collection.Posts
 *
 * PHP version 7.1.3
 *
 * @collection  PM
 * @package   Modules\CollectionsPosts
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class CollectionsPosts extends Model
{

    const MODULE_NAME = 'CollectionsPosts';

    protected $fillable = [
        'id',
        'collections_id',
        'posts_id'
    ];


    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
        
        $this->table = 'web_collections_posts';
    }

}
