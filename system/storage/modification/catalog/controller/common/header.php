<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

				// Add Source CSS & JS For Header
				$this->document->addStyle('catalog/view/javascript/so_searchpro/css/so_searchpro.css'); 
				
				$this->document->addStyle('catalog/view/javascript/so_megamenu/so_megamenu.css');
				$this->document->addStyle('catalog/view/javascript/so_megamenu/wide-grid.css');
				$this->document->addScript('catalog/view/javascript/so_megamenu/so_megamenu.js'); 
			

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}


			// Add New Position For Header
			$data['content_search'] 	= $this->load->controller('extension/soconfig/content_search');
			$data['content_menu'] 	= $this->load->controller('extension/soconfig/content_menu');
			$data['content_menu1'] 	= $this->load->controller('extension/soconfig/content_menu1');
			$data['content_topbar'] 	= $this->load->controller('extension/soconfig/content_topbar');
			$data['content_head'] 	= $this->load->controller('extension/soconfig/content_head');
			$data['text_items'] 	      = $this->language->get('text_items');
			$data['text_shop'] 	          = $this->language->get('text_shop');
			$data['text_shop_cart'] 	  = $this->language->get('text_shop_cart');
			$data['compare'] = $this->url->link('product/compare', '', 'SSL');
			$data['text_compare']  = sprintf($this->language->get('text_compare'),(isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		

			// Add New Position For Header
			$this->load->language('extension/soconfig/soconfig');
			$data['objlang'] = $this->language;
			$data['text_contact'] = $this->language->get('text_contact');
			$data['text_more'] 	  = $this->language->get('text_more');
			$data['text_menu'] 	  = $this->language->get('text_menu');
			$data['text_hotline'] 	  = $this->language->get('text_hotline');
			$data['text_compare'] 	  = $this->language->get('text_compare');
		
		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

				/***blog changes***/
				$data['blog_link_status'] = 1;
				$data['blog_link_url'] = 'index.php?route=simple_blog/article';
				if(isset($this->request->get['route'])) {
					$route = $this->request->get['route'];
				} else {
					$route = 'common/home';
				}

				$route = explode("/", $route);

				if($this->config->get('simple_blog_status')) {
    				$this->load->model('simple_blog/article');

    				$count_blog_categories = $this->model_simple_blog_article->getTotalCategories(0);
                }

				if (isset($count_blog_categories) && $this->config->get('simple_blog_display_category') && $this->config->get('simple_blog_status')) {

					$categories = $this->model_simple_blog_article->getCategories(0);

					foreach ($categories as $category) {
						if ($category['top']) {

			/***theme's changes***/
			$data['theme'] = $this->config->get('theme_default_directory');
			$data['store_id'] = $this->config->get('config_store_id');
			$data['lang'] = $this->config->get('config_language_id');

			$store_id = $this->config->get('config_store_id');
			$lang = $this->config->get('config_language_id');
			$data['registry'] = $this->registry;
					
			/* Array Config  */
			$text_config = array(
				'preloader',
				'preloader_animation',
				'mutiColorTheme' ,
				'themecolor' ,
				'layouts',
				'typelayout',
				'type_banner',
				'scroll_animation',
				'toppanel_status' 	,
				'toppanel_type' 	,
				'phone_status' 		,
				'welcome_message_status' ,
				'wishlist_status' 	,
				'checkout_status' 	,
				'lang_status' 		,
				'socials_status' 	,
				'contact_number' 	,
				'welcome_message' 	,
				
				'typeheader' 		,
				'layoutstyle' 		,
				'general_bgcolor' 	,
				'pattern' 			,
				'contentbg',
				'content_bg_mode' 	,
				'content_attachment',
				
				'body_status' 		,
				'normal_body' 		,
				'url_body' 			,
				'family_body' 		,
				'selector_body' 	,
				'menu_status' 		,
				'normal_menu' 		,
				'url_menu' 			,
				'family_menu' 		,
				'selector_menu'		,
				'heading_status' 	,
				'normal_heading' 	,
				'url_heading' 		,
				'family_heading'  	,
				'selector_heading'	,
				
				'cssinput_status'	,
				'jsinput_status'	,
				'custom_css' 		,
				'custom_js' 		,
				'cssfile_status'	,
				'jsfile_status' 	,
				'cssfile' 	,
				'jsfile' 	,
			);
			
			foreach ($text_config as $text ) {
				$data[$text] = $this->soconfig->get_settings($text);
			}
			
			/***end theme's changes***/
		
							// Level 2
							$children_data = array();

							$children = $this->model_simple_blog_article->getCategories($category['simple_blog_category_id']);

							foreach ($children as $child) {

								$article_total = $this->model_simple_blog_article->getTotalArticles($child['simple_blog_category_id']);
                                if ($child['image']) {
                                    $this->load->model('tool/image');

                                    $image = $this->model_tool_image->resize($child['image'], 205, 130);
                                } else {
                                    $image = false;
                                }

								$children_data[] = array(
                                    'image'  => $image,
								    'external_link' => $child['external_link'],
									'name'  => $child['name'],
									'href'  => $this->url->link('simple_blog/category', 'simple_blog_category_id=' . $category['simple_blog_category_id'] . '_' . $child['simple_blog_category_id'])
								);
							}

							$menu_class = 'simple_blog';

							// Level 1
							$data['categories'][] = array(
								'name'     => $category['name'],
								'external_link' => $category['external_link'],
								'children' => $children_data,
								'menu_class' => $menu_class,
								'column'   => $category['blog_category_column'] ? $category['blog_category_column'] : 1,
								'href'     => $this->url->link('simple_blog/category', 'simple_blog_category_id=' . $category['simple_blog_category_id'])
							);
						}
					}

				}
				$categories = $this->model_catalog_category->getCategories(0);
				/***end blog changes***/
			

		foreach ($categories as $category) {
			if ($category['top']) {

			/***theme's changes***/
			$data['theme'] = $this->config->get('theme_default_directory');
			$data['store_id'] = $this->config->get('config_store_id');
			$data['lang'] = $this->config->get('config_language_id');

			$store_id = $this->config->get('config_store_id');
			$lang = $this->config->get('config_language_id');
			$data['registry'] = $this->registry;
					
			/* Array Config  */
			$text_config = array(
				'preloader',
				'preloader_animation',
				'mutiColorTheme' ,
				'themecolor' ,
				'layouts',
				'typelayout',
				'type_banner',
				'scroll_animation',
				'toppanel_status' 	,
				'toppanel_type' 	,
				'phone_status' 		,
				'welcome_message_status' ,
				'wishlist_status' 	,
				'checkout_status' 	,
				'lang_status' 		,
				'socials_status' 	,
				'contact_number' 	,
				'welcome_message' 	,
				
				'typeheader' 		,
				'layoutstyle' 		,
				'general_bgcolor' 	,
				'pattern' 			,
				'contentbg',
				'content_bg_mode' 	,
				'content_attachment',
				
				'body_status' 		,
				'normal_body' 		,
				'url_body' 			,
				'family_body' 		,
				'selector_body' 	,
				'menu_status' 		,
				'normal_menu' 		,
				'url_menu' 			,
				'family_menu' 		,
				'selector_menu'		,
				'heading_status' 	,
				'normal_heading' 	,
				'url_heading' 		,
				'family_heading'  	,
				'selector_heading'	,
				
				'cssinput_status'	,
				'jsinput_status'	,
				'custom_css' 		,
				'custom_js' 		,
				'cssfile_status'	,
				'jsfile_status' 	,
				'cssfile' 	,
				'jsfile' 	,
			);
			
			foreach ($text_config as $text ) {
				$data[$text] = $this->soconfig->get_settings($text);
			}
			
			/***end theme's changes***/
		
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		return $this->load->view('common/header', $data);
	}
}
