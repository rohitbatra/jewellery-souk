<?php
class ControllerSellerProfile extends Controller {

    public function index() {

        $this->load->language('seller/profile');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $this->load->model('seller/seller');
        $this->load->model('tool/image');

        if (isset($this->request->get['seller'])) {
            $seller_id = (int) base64_decode($this->request->get['seller']);
            $seller_id_encoded = $this->request->get['seller'];
        } else {
            $seller_id = 0;
            $seller_id_encoded = 0;
        }

        $this->load->model('catalog/product');

        $seller_info = $this->model_seller_seller->getSellerById($seller_id);
        $seller_fd = $this->model_seller_seller->formatData($seller_info);

        if ($seller_fd) {

            $data['seller_img'] = $seller_fd['img'];
            $data['name'] = $seller_fd['name'];
            $data['category'] = $seller_fd['category'];
            $data['seller_type'] = $seller_fd['seller_type'];
            $data['city'] = $seller_fd['city'];
            $data['country'] = $seller_fd['country_info']['name'];
            $data['contact_person'] = $seller_fd['contact_person'];
            $data['telephone'] = $seller_fd['telephone'];
            $data['address'] = $seller_fd['address'];

            $data['shop_link'] = $this->url->link('seller/shop','seller=' . $seller_id_encoded);
            $data['home_link'] = $this->url->link('common/home');

            $data['text_category'] = $this->language->get('text_category');
            $data['text_seller_type'] = $this->language->get('text_seller_type');
            $data['text_city'] = $this->language->get('text_city');
            $data['text_country'] = $this->language->get('text_country');
            $data['text_contact_person'] = $this->language->get('text_contact_person');
            $data['text_telephone'] = $this->language->get('text_telephone');
            $data['text_address'] = $this->language->get('text_address');
            $data['text_products'] = $this->language->get('text_products');
            $data['text_popular'] = $this->language->get('text_popular');
            $data['button_all_products'] = $this->language->get('button_all_products');
            $data['button_continue'] = $this->language->get('button_continue');
            $data['text_enquiry'] = $this->language->get('text_enquiry');
            $data['text_hidden'] = sprintf($this->language->get('text_hidden'),$this->url->link('account/register'),$this->url->link('account/login'));

            $data['customer_logged'] = false;
            if($this->customer->isLogged()){
                $data['customer_logged'] = true;
            }

            $data['breadcrumbs'][] = array(
                'text' => $seller_fd['name'],
                'href' => $this->url->link('seller/profile', 'seller=' . $seller_id_encoded)
            );

            $this->document->setTitle($seller_fd['name']." @ ".$this->config->get('config_name'));
            $this->document->addLink($this->url->link('seller/profile', 'seller=' . $seller_id_encoded), 'canonical');

            $data['heading_title'] = $seller_fd['name'];

            $data['text_loading'] = $this->language->get('text_loading');

            $data['products'] = array();

            $results = $this->model_seller_seller->getMostViewedProductsOfSeller(array('seller_id' => $seller_id, 'limit' => '6'));

            foreach ($results as $result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
                }

                if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $price = false;
                }

                if ((float)$result['special']) {
                    $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $special = false;
                }

                if ($this->config->get('config_tax')) {
                    $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
                } else {
                    $tax = false;
                }

                if ($this->config->get('config_review_status')) {
                    $rating = (int)$result['rating'];
                } else {
                    $rating = false;
                }

                $data['products'][] = array(
                    'product_id'  => $result['product_id'],
                    'thumb'       => $image,
                    'name'        => $result['name'],
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                    'price'       => $price,
                    'special'     => $special,
                    'tax'         => $tax,
                    'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
                    'rating'      => $rating,
                    'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
                );
            }

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('seller/profile', $data));
        } else {
            $url = '';

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_error'),
                'href' => $this->url->link('seller/profile', $url . '&seller=' . $seller_id_encoded)
            );

            $this->document->setTitle($this->language->get('text_error'));

            $data['heading_title'] = $this->language->get('text_error');

            $data['text_error'] = $this->language->get('text_error');

            $data['button_continue'] = $this->language->get('button_continue');

            $data['continue'] = $this->url->link('common/home');

            $this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('error/not_found', $data));
        }
    }
}
