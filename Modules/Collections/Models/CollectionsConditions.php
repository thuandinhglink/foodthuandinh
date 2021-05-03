<?php

namespace Modules\Collections\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Collection
 *
 * The Model is Defined for Collection.
 *
 * PHP version 7.1.3
 *
 * @collection  PM
 * @package   Modules\CollectionsConditions
 * @author    Vipul Patel <vipul@chetsapp.com>
 * @copyright 2019 Chetsapp Group
 * @license   Chetsapp Private Limited
 * @version   Release: @1.0@
 * @link      http://chetsapp.com
 * @since     Class available since Release 1.0
 */
class CollectionsConditions extends Model
{

    const MODULE_NAME = 'CollectionsConditions';

    protected $fillable = [
        'id',
        'collections_id',
        'value',
        'name',
        'condition',
        'type'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
        
        $this->table = 'web_collections_conditions';
    }

}
