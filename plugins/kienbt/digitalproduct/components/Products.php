<?php namespace Kienbt\Digitalproduct\Components;

use Cms\Classes\ComponentBase;
use Cms\Classes\Page;
use Kienbt\Digitalproduct\Models\Category;
use Kienbt\Digitalproduct\Models\Product;
use Redirect;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class Products extends ComponentBase
{
    use SetsVars;

    /**
     * A collection of products to display
     * @var Collection
     */
    public $products;

    /**
     * If the product list should be filtered by a category, the model to use.
     * @var Model
     */
    public $category;

    /**
     * If the category is filtered via slug use this parameter.
     * @var string
     */
    public $categoryParam;

    /**
     * Message to display when there are no products.
     * @var string
     */
    public $noProductsMessage;

    /**
     * Reference to the page name for linking to products.
     * @var string
     */
    public $productPage;

    /**
     * If the product list should be ordered by another attribute.
     * @var string
     */
    public $sortOrder;

    public function componentDetails()
    {
        return [
            'name'        => 'kienbt.digitalproduct::lang.components.products.details.name',
            'description' => 'kienbt.digitalproduct::lang.components.products.details.description',
        ];
    }

    public function defineProperties()
    {
        $langPrefix = 'kienbt.digitalproduct::lang.components.products.properties.';

        return [
            'categoryFilter'    => [
                'title'       => $langPrefix . 'categoryFilter.title',
                'description' => $langPrefix . 'categoryFilter.description',
                'type'        => 'dropdown',
                'default'     => 'slug',
            ],
            'categorySlug'      => [
                'title'       => $langPrefix . 'categorySlug.title',
                'description' => $langPrefix . 'categorySlug.description',
                'type'        => 'string',
                'default'     => '{{ :slug }}',
            ],
            'productsPerPage'   => [
                'title'             => $langPrefix . 'productsPerPage.title',
                'type'              => 'string',
                'validationPattern' => '^[0-9]+$',
                'validationMessage' => $langPrefix . '',
                'default'           => '9',
            ],
            'noProductsMessage' => [
                'title'             => $langPrefix . 'noProductsMessage.title',
                'description'       => $langPrefix . 'noProductsMessage.description',
                'type'              => 'string',
                'default'           => 'No Products found.',
                'showExternalParam' => false,
            ],
            'sortOrder'         => [
                'title'       => $langPrefix . 'sortOrder.title',
                'description' => $langPrefix . 'sortOrder.description',
                'type'        => 'dropdown',
                'default'     => 'published_at desc',
            ],
            'productPage'       => [
                'title'       => $langPrefix . 'productPage.title',
                'description' => $langPrefix . 'productPage.description',
                'type'        => 'dropdown',
                'default'     => '',
            ],
        ];
    }

    public function onRun()
    {
        $this->mapProperties();

        try {
            $this->setVar('category', $this->loadCategory());
            $this->setVar('products', $this->loadProducts());
            $this->validatePageNumber();

        } catch (NotFoundHttpException $e) {
            return Redirect::to('/404');
        }
        if ($this->category) {
            $this->setMetaData();
        }
    }

    protected function loadProducts()
    {
        if ($this->category) {
            $products = Product::whereIn('category_id',$this->category->getAllChildrenAndSelf()->lists('id'))->published();
        } else {
            $products = Product::published();
        }
        return $products->paginate($this->property('productsPerPage', 9));
    }

    protected function loadCategory()
    {
        if ( ! $categoryId = $this->property('categoryFilter')) {
            return null;
        }

        $category = new Category();

        // Use the category slug from the URL
        if ($categoryId === 'slug') {
            // Only use the last part of the slug to find the category
            // This should be a future improvement: Search for the full
            // slug. This way two subcategories can have the same slug.
            // i. e. "parent-a/child" and "parent-b/child"
            $slugs = explode('/', $this->property('categorySlug'));
            $slug  = end($slugs);

            $category = $category->isClassExtendedWith('RainLab.Translate.Behaviors.TranslatableModel')
                ? $category->transWhere('slug', $slug)
                : $category->where('slug', $slug);
        } elseif ($categoryId == 'all') {
            return null;
        } else {
            $category = $category->whereId($categoryId);
        }

        $category = $category->with([
            'product',
            'product.images',
        ])->first();

        if ( ! $category) {
            throw new NotFoundHttpException();
        }

        return $category;
    }

    protected function mapProperties()
    {
        $this->setVar('pageParam', $this->paramName('pageNumber'));
        $this->setVar('categoryParam', $this->paramName('categorySlug'));
        $this->setVar('noProductsMessage', $this->property('noProductsMessage'));
        $this->setVar('productPage', $this->getProductPage());
    }

    public function getCategoryFilterOptions()
    {
        $categories = Category::listsNested('name', 'id', '-- ');

        return [
                'all'     => trans('kienbt.digitalproduct::lang.components.products.properties.categoryFilter.no_filter'),
                'slug' => trans('kienbt.digitalproduct::lang.components.products.properties.categoryFilter.by_slug'),
            ] + $categories;
    }

    public function getSortOrderOptions()
    {
        return Category::allowedSortingOptions();
    }

    public function getProductPageOptions()
    {
        return [null => '(' . trans('kienbt.digitalproduct::lang.plugin.common.use_backend_defaults') . ')']
            + Page::sortBy('baseFileName')->lists('title', 'baseFileName');
    }

    protected function validatePageNumber()
    {
        if ($pageNumberParam = input('page')) {
            $currentPage = input('page');

            if ($currentPage > ($lastPage = $this->products->lastPage()) && $currentPage > 1) {
                throw new NotFoundHttpException();
            }
        }
    }

    private function getProductPage()
    {
        if ($this->property('productPage')) {
            return $this->property('productPage');
        }

        return GeneralSettings::get('product_page');
    }

    protected function setMetaData()
    {
        $this->page->title = $this->category->meta_title
            ? $this->category->meta_title
            : $this->category->name;

        if ($this->category->meta_description) {
            $this->page->meta_description = $this->category->meta_description;
        }
    }
}
