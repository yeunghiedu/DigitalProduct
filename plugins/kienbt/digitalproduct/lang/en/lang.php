<?php return [
    'plugin' => [
        'name' => 'Digital Product',
        'description' => 'An ecommerce plugin for digital products',
        'common' => [
            'products' => 'Products',
            'categories' => 'Categories',
            'orders' => 'Orders',
            'discounts' => 'Discounts',
            'meta_title' => 'Meta Title',
            'meta_description' => 'Meta Description',
            'slug' => 'URL',
            'parent' => 'Parent',
            'general' => 'General',
            'description' => 'Description',
            'attachments' => 'Attachments',
            'feature_image' => 'Feature Image',
            'downloads' => 'Downloads',
            'seo' => 'SEO',
            'created_at' => 'CreateTime',
            'hide_published' => 'Hide Published',
            'name' => 'Name',
            'no_parent' => 'No parent',
        ],
        'product' => [
            'name' => 'Product name',
            'code' => 'Product Code',
            'published' => 'Published',
            'not_published' => 'Not Published',
            'published_desc' => 'This product is visible on the website',
            'short_desc' => 'Short Description',
            'price' => 'Price',
            'sub_image' => 'Virus scan image',
            'create' => 'Create Product',
            'create_msg' => 'New product created successful',
            'update' => 'Update Product',
            'update_msg' => 'Updated product successful',
            'delete_msg' => 'Deleted product successful',
            'preview' => 'Product preview',
            'version' => 'Product Version',
            'demo_url' => 'Demo URL',
        ],
        'category' => [
            'name' => 'Category name',
            'create' => 'Create Category',
            'create_msg' => 'New category created successful',
            'update' => 'Update Category',
            'update_msg' => 'Update category successful',
            'preview' => 'Category Preview',
        ],
        'manage' => [
            'products' => 'Can manage products',
            'categories' => 'Can manage Categories',
            'order' => 'Can manage Orders',
            'discounts' => 'Can manage discounts',
        ],
        'version' => [
            'create' => 'Create Product Version',
            'update' => 'Update Product Version',
        ],
        'menu_items' => [
            'all_categories' => 'All product categories',
        ],
    ],
    'components' => [
        'categories' => [
            'details' => [
                'name' => 'Categories',
                'description' => 'Lists available categories',
            ],
            'properties' => [
                'parent' => [
                    'title' => 'Start from category',
                    'description' => 'Only show child categories of this category',
                ],
                'categorySlug' => [
                    'title' => 'Category slug parameter',
                    'description' => 'Use this parameter to load the parent category from the url',
                ],
                'categoryPage' => [
                    'title' => 'Category page',
                    'description' => 'Links will point to this page. If nothing is entered the default settings from the backend settings will be used.',
                ],
            ],
            'no_parent' => 'Show all categories',
            'by_slug' => 'Use category in url as parent',
        ],
        'cartButton' => [
            'details' => [
                'name' => 'Checkout button',
                'description' => 'Button to start checkout',
            ],
            'properties' => [
                'buttonLabel' => [
                    'title' => 'Button label',
                    'description' => 'This text will be placed on the checkout button',
                ],
            ],
        ],
        'cartSummary' => [
            'details' => [
                'name' => 'Cart summary',
                'description' => 'Displays the number of products in and total value of the cart',
            ],
            'properties' => [
                'showItemCount' => [
                    'title' => 'Show product count',
                    'description' => 'Displays the count of items in the cart',
                ],
                'showTotalPrice' => [
                    'title' => 'Show total value',
                    'description' => 'Displays the total value of all items in the cart',
                ],
            ],
        ],
        'customerDashboard' => [
            'details' => [
                'name' => 'Customer dashboard',
                'description' => 'Displays a link for the customer to login and change her account settings',
            ],
            'properties' => [
                'customerDashboardLabel' => [
                    'title' => 'Customer dashboard label',
                    'description' => 'Link text for the customer account page',
                ],
                'logoutLabel' => [
                    'title' => 'Logout label',
                    'description' => 'Link text for the logout link',
                ],
            ],
        ],
        'currencyPicker' => [
            'details' => [
                'name' => 'Currency picker',
                'description' => 'Shows a picker to select the currently active shop currency',
            ],
        ],
        'products' => [
            'details' => [
                'name' => 'Products',
                'description' => 'Displays a list of products',
            ],
            'properties' => [
                'categoryFilter' => [
                    'title' => 'Category filter',
                    'description' => 'Only show products from this category',
                    'no_filter' => 'Show all products',
                    'by_slug' => 'Load category from slug',
                ],
                'categorySlug' => [
                    'title' => 'Category slug parameter',
                    'description' => 'Use this parameter to load the category from the url',
                ],
                'productsPerPage' => [
                    'title' => 'Number of products per page',
                ],
                'noProductsMessage' => [
                    'title' => '«No products» message',
                    'description' => 'This text will be displayed if a category is empty',
                ],
                'sortOrder' => [
                    'title' => 'Sort order',
                    'description' => 'How the products will be sorted',
                ],
                'productPage' => [
                    'title' => 'Product page',
                    'description' => 'Product links will point to this page. If nothing is selected, the defaults from the backend settings will be used.',
                ],
            ],
        ],
        'product' => [
            'details' => [
                'name' => 'Product details',
                'description' => 'Displays details of a product',
            ],
            'properties' => [
                'productSlug' => [
                    'title' => 'Product url parameter',
                    'description' => 'Use this parameter to load the slug from the url',
                ],
            ],
            'added_to_cart' => 'Added product successfully'
        ],
    ],
];