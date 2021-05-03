<?php

namespace Modules\Posts\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class PostImages
 *
 * The Model is Defined for PostImages.
 *
 * PHP version 7.1.3
 *
 * @PostImages  PM
 * @package   Modules\PostImages
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class PostImages extends Model
{
    const MODULE_NAME = 'PostImages';
    protected $table;

    protected $fillable = [
    	'id',
    	'posts_id',
    	'url'
    ];
    
    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
        
        $this->table = 'web_po_images';
    }

}
