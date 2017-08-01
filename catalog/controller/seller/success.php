<?php
class ControllerSellerSuccess extends Controller {

    public function index()
    {
      $this->load->language('seller/succes');

      $this->document->setTitle($this->language->get('heading_title'));

      $this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
      $this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
      $this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

      $data['column_left'] = $this->load->controller('common/column_left');
      $data['column_right'] = $this->load->controller('common/column_right');
      $data['content_top'] = $this->load->controller('common/content_top');
      $data['content_bottom'] = $this->load->controller('common/content_bottom');
      $data['footer'] = $this->load->controller('common/footer');
      $data['header'] = $this->load->controller('common/header');

      $this->response->setOutput($this->load->view('seller/seller_login',$data));
    }
}
