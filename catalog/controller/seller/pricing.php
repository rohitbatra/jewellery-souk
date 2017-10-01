<?php
class ControllerSellerPricing extends Controller {

    public function index()
    {
        $this->load->language('seller/pricing');

        $this->document->setTitle($this->language->get('heading_title'));

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
          'text' => $this->language->get('text_home'),
          'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
          'text' => $this->language->get('text_account'),
          'href' => $this->url->link('seller/landing', '', true)
        );

        $data['breadcrumbs'][] = array(
          'text' => $this->language->get('text_pricing'),
          'href' => $this->url->link('seller/pricing', '', true)
        );

        $data['register_link'] = $this->url->link('seller/register', '', true);
        
        $this->load->model('seller/seller');

        $data['pricing'] = $this->model_seller_seller->getAllSellerPricingForUI();

        $data['heading_title'] = $this->language->get('heading_title');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('seller/pricing', $data));
    }


}
