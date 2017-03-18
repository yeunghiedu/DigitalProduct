<?php namespace Kienbt\Digitalproduct;

use Event;
use System\Classes\PluginBase;
use Kienbt\Digitalproduct\Models\Category;

class Plugin extends PluginBase
{
    public function registerComponents()
    {
        return [
            'Kienbt\Digitalproduct\Components\Products' => 'dpProducts',
        ];
    }

    public function registerSettings()
    {
    }

    public function boot()
    {
        $this->registerStaticPagesEvents();
    }

    protected function registerStaticPagesEvents()
    {
        Event::listen('pages.menuitem.listTypes', function () {
            return [
                'all-product-categories' => trans('kienbt.digitalproduct::lang.plugin.menu_items.all_categories'),
            ];
        });

        Event::listen('pages.menuitem.getTypeInfo', function ($type) {
            if ($type == 'all-product-categories') {
                return Category::getMenuTypeInfo($type);
            }
        });

        Event::listen('pages.menuitem.resolveItem', function ($type, $item, $url, $theme) {
            if ($type == 'all-product-categories') {
                return Category::resolveMenuItem($item, $url, $theme);
            }
        });
    }
}
