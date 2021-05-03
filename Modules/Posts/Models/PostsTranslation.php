<?php

namespace Modules\Posts\Models;

use Illuminate\Database\Eloquent\Model;
/**
 * Class PostTranslation
 *
 * The Model is Defined for PostTranslation.
 *
 * PHP version 7.1.3
 *
 * @Post  PM
 * @package   Modules\PostTranslation
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class PostsTranslation extends Model
{

    const MODULE_NAME = 'PostsTranslation';

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
        'langcode',
        'posts_id',
        'name',
        'content',
        // 'intro',
        'description',
        // 'des_seo',
        // 'content',
        'keywords',
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
        
        $this->table = 'web_posts_translation';
    }

}
