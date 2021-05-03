<?php

namespace Modules\Collections\Models;

use Illuminate\Database\Eloquent\Model;
/**
 * Class CollectionTranslation
 *
 * The Model is Defined for CollectionTranslation.
 *
 * PHP version 7.1.3
 *
 * @collection  PM
 * @package   Modules\CollectionTranslation
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class CollectionsTranslation extends Model
{

    const MODULE_NAME = 'CollectionsTranslation';

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
        'collections_id',
        'name',
        'description',
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
        
        $this->table = 'web_collections_translation';
    }

}
