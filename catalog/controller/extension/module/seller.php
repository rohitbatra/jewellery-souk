<?php
class ControllerExtensionModuleSeller extends Controller {
	public function index() {
		$this->load->language('extension/module/seller');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
    $data['text_forgotten'] = $this->language->get('text_forgotten');
    $data['text_faqs'] = $this->language->get('text_faqs');
    $data['text_pricing'] = $this->language->get('text_pricing');
    $data['text_terms'] = $this->language->get('text_terms');
		$data['text_contact_us'] = $this->language->get('text_contact_us');

		$data['register'] = $this->url->link('seller/register', '', true);
		$data['login'] = $this->url->link('seller/login', '', true);
    $data['forgotten'] = $this->url->link('seller/forgotten', '', true);
    $data['faq'] = $this->url->link('seller/faq', '', true);
    $data['pricing'] = $this->url->link('seller/pricing', '', true);
    $data['terms'] = $this->url->link('seller/terms', '', true);
		$data['contact'] = $this->url->link('seller/contact', '', true);

		return $this->load->view('extension/module/seller', $data);
	}
}
