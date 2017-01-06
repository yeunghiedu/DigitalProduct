<?php namespace Kienbt\Digitalproduct\Controllers;

use Backend\Classes\Controller;
use BackendMenu;

class Categories extends Controller
{
    public $implement = ['Backend\Behaviors\ListController','Backend\Behaviors\FormController'];
    
    public $listConfig = 'config_list.yaml';
    public $formConfig = 'config_form.yaml';

    public $requiredPermissions = [
        'kienbt.digitalproduct.manage_categories' 
    ];

    public function __construct()
    {
        parent::__construct();
        BackendMenu::setContext('Kienbt.Digitalproduct', 'digital-product', 'digitalproduct-categories');
    }
}