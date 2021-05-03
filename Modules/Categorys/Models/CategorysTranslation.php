<?php

namespace Modules\Categorys\Models;

use Illuminate\Database\Eloquent\Model;
/**
 * Class CategoryTranslation
 *
 * The Model is Defined for CategoryTranslation.
 *
 * PHP version 7.1.3
 *
 * @category  PM
 * @package   Modules\CategoryTranslation
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class CategorysTranslation extends Model
{

    const MODULE_NAME = 'CategorysTranslation';

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
        'po_cates_id',
        'name',
        'title',
        'description',
        'content',
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
        
        $this->table = 'web_po_cates_translation';
    }

}
