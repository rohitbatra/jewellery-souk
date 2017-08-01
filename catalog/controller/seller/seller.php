<?php
class ControllerSellerSeller extends Controller {
    private $error = array();

    public function index()
    {
        $this->load->model('seller/seller');

        $this->load->language('seller/seller');

        $this->document->setTitle($this->language->get('splash_heading_title'));

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_account'),
            'href' => $this->url->link('seller/seller', '', true)
        );

        $data['heading_title'] = $this->language->get('splash_heading_title');

        $data['text_new_customer'] = $this->language->get('text_new_customer');
        $data['text_register'] = $this->language->get('text_register');
        $data['text_register_account'] = $this->language->get('text_register_account');
        $data['text_returning_customer'] = $this->language->get('text_returning_customer');
        $data['text_i_am_returning_customer'] = $this->language->get('text_i_am_returning_customer');
        $data['text_returning_account'] = $this->language->get('text_returning_account');
        $data['text_forgotten'] = $this->language->get('text_forgotten');

        $data['button_continue'] = $this->language->get('button_register');
        $data['button_login'] = $this->language->get('button_login');

        if (isset($this->session->data['error'])) {
            $data['error_warning'] = $this->session->data['error'];

            unset($this->session->data['error']);
        } elseif (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['login'] = $this->url->link('seller/seller/login', '', true);
        $data['register'] = $this->url->link('seller/seller/register', '', true);

        // Added strpos check to pass McAfee PCI compliance test (http://forum.opencart.com/viewtopic.php?f=10&t=12043&p=151494#p151295)
        if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['redirect'], $this->config->get('config_ssl')) !== false)) {
            $data['redirect'] = $this->request->post['redirect'];
        } elseif (isset($this->session->data['redirect'])) {
            $data['redirect'] = $this->session->data['redirect'];

            unset($this->session->data['redirect']);
        } else {
            $data['redirect'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('seller/seller', $data));
    }

    public function success()
    {

        $postData = $this->request->post;
        $postData['user_id'] = str_replace('SEZCAD','',$postData['orderNo']);

        // Now call the Model & Store all the Data with Status
        $this->load->model('seller/seller');
        $this->load->language('account/seller_success');

        $this->model_seller_seller->addPaymentInfo($postData);

        // Redirect to Page w.r.t $postData['order_status']
        $this->load->language('account/seller_success');
        $data['heading_title'] = $this->language->get('heading_title');
        $data['heading_title_error'] = $this->language->get('heading_title_error');
        $data['text_message'] = $this->language->get('text_message');
        $data['text_error_message'] = $this->language->get('text_error_message');
        $data['text_approval'] = $this->language->get('text_approval');
        $data['text_account'] = $this->language->get('text_account');
        $data['button_continue'] = $this->language->get('button_continue');

        if($postData['order_status'] == "Success")
        {
            $this->model_seller_seller->approveSeller(array('user_id' => $postData['user_id']));
            $this->model_seller_seller->sendEmail($postData);

            // To Seller Success TPL
            $this->document->setTitle($data['heading_title']);

            $this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
            $this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
            $this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

            $data['continue'] = $this->url->link('seller/seller/login');
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('account/seller_success',$data));

        }else{

            $this->model_seller_seller->sendEmail($postData);

            // To Seller Error TPL
            $this->load->language('account/seller_success');

            $this->document->setTitle($data['heading_title_error']);

            $this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
            $this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
            $this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

            $data['continue'] = $this->url->link('information/contact');

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('account/seller_error',$data));
        }
    }


}
