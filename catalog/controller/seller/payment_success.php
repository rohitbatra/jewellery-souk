<?php
class ControllerSellerPaymentSuccess extends Controller {

    public function index()
    {
      $heading_title = 'Thank you for your Payment!';

      $this->document->setTitle($heading_title);

      $data['heading_title'] = $heading_title;
      $data['column_left'] = $this->load->controller('common/column_left');
      $data['column_right'] = $this->load->controller('common/column_right');
      $data['content_top'] = $this->load->controller('common/content_top');
      $data['content_bottom'] = $this->load->controller('common/content_bottom');
      $data['footer'] = $this->load->controller('common/footer');
      $data['header'] = $this->load->controller('common/header');

      $data['breadcrumbs'] = array();

      $data['breadcrumbs'][] = array(
        'text' => $this->language->get('text_home'),
        'href' => $this->url->link('common/home')
      );

      $data['breadcrumbs'][] = array(
        'text' => 'Seller',
        'href' => $this->url->link('seller/seller', '', true)
      );

      $data['breadcrumbs'][] = array(
        'text' => 'Success',
        'href' => $this->url->link('seller/payment_success', 'uID=' . ($this->request->get['uID']), true)
      );

      $data['continue'] = $this->url->link('seller/login', '', true);
      $data['button_continue'] = 'Login';

      if(isset($this->request->get['uID']) && !empty($this->request->get['uID']))
      {
  			$uID = base64_decode($this->request->get['uID']);
        $this->load->model('seller/seller');
        $data['seller_info'] = $this->model_seller_seller->getSellerById($uID);

        if(array_key_exists('company_name', $data['seller_info']) && !empty($data['seller_info']['company_name']))
        {
          $data['name'] = $data['seller_info']['company_name'];
        }else {
          $data['name'] = $data['seller_info']['firstname'];
        }

      }else{
        $this->response->redirect($this->url->link('error/not_found','',true));
      }

      $this->response->setOutput($this->load->view('seller/payment_success',$data));
    }
}
