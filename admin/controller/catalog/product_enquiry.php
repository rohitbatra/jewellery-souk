<?php
class ControllerCatalogProductEnquiry extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('catalog/product_enquiry');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/product_enquiry');

        $this->getList();
    }

    public function view() {
        $this->load->language('catalog/product_enquiry');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/product_enquiry');

        // If Seller, then Mark Status of Enquiry as Read
        if($this->user->isSeller()) {
            $this->model_catalog_product_enquiry->markEnquiryAsRead($this->request->get['enquiry_id']);
        }

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_catalog_product_enquiry->saveReplyToDb(array('reply_content' => $this->request->post['reply_content'], 'enquiry_id' => $this->request->get['enquiry_id']));
            $this->model_catalog_product_enquiry->sendReplyToEnquirer(array('reply_content' => $this->request->post['reply_content'], 'enquiry_id' => $this->request->get['enquiry_id']));

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('catalog/product_enquiry', 'token=' . $this->session->data['token'], true));
        }

        $this->getForm();
    }

    protected function getForm() {
        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_product_enquiry'] = $this->language->get('text_product_enquiry');
        $data['text_reply_product_enquiry'] = $this->language->get('text_reply_product_enquiry');

        $data['entry_product'] = $this->language->get('entry_product');
        $data['entry_sender'] = $this->language->get('entry_sender');
        $data['entry_enquiry'] = $this->language->get('entry_enquiry');
        $data['entry_reply'] = $this->language->get('entry_reply');
        $data['entry_date_added'] = $this->language->get('entry_date_added');

        $data['button_send_reply'] = $this->language->get('button_send_reply');
        $data['button_cancel'] = $this->language->get('button_cancel');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/product_enquiry', 'token=' . $this->session->data['token'], true)
        );

        $data['action'] = $this->url->link('catalog/product_enquiry/view', 'token=' . $this->session->data['token'] ."&enquiry_id=".$this->request->get['enquiry_id'], true);

        $data['cancel'] = $this->url->link('catalog/product_enquiry', 'token=' . $this->session->data['token'], true);

        // Get Enquiry
        $this->load->model('catalog/product_enquiry');
        if (isset($this->request->get['enquiry_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $enquiry_info = $this->model_catalog_product_enquiry->getEnquiry($this->request->get['enquiry_id']);
        }

        $data['is_seller'] = false;
        if($this->user->isSeller()) {
            $data['is_seller'] = true;
        }

        $data['token'] = $this->session->data['token'];

        $this->load->model('seller/seller');
        $seller_data = $this->model_seller_seller->getSellerDetails($enquiry_info['seller_id']);
        $data['seller'] = $this->model_seller_seller->formatData($seller_data);
        $data['seller_href'] = 'javascript:void(1);';
        if($this->user->isSeller() == false) {
            $data['seller_href'] = $this->url->link('seller/seller/edit','&token='.$this->session->data['token'].'&user_id='.$enquiry_info['seller_id'],true);
        }
        $data['seller_name'] = ucwords($data['seller']['name']);

        $data['product_name'] = $enquiry_info['product_name'];
        $data['product_id'] = $enquiry_info['product_id'];
        $data['product_href'] = HTTPS_CATALOG.'index.php?route=product/product&product_id='.$data['product_id'];

        $data['sender_name'] = $enquiry_info['sender_name'];
        $data['sender_email'] = $enquiry_info['sender_email'];
        $data['sender_telephone'] = $enquiry_info['sender_telephone'];

        $data['enquiry'] = $enquiry_info['content'];
        $data['enquiry_added'] = $enquiry_info['enquiry_dataTime'];

        $data['reply_content'] = $enquiry_info['reply_content'];
        $data['reply_added'] = $enquiry_info['reply_dataTime'];
        $data['enquiry_replied'] = false;
        if(!empty($data['reply_added']) && !empty($data['reply_content'])) {
            $data['enquiry_replied'] = true;
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/product_enquiry_form', $data));

    }

    protected function validateForm() {
        if (!$this->user->hasPermission('modify', 'catalog/product_enquiry')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if ((utf8_strlen($this->request->post['reply_content']) < 3)) {
            $this->error['reply_content'] = $this->language->get('error_reply_content');
        }

        return !$this->error;
    }

    protected function getList() {

        if (isset($this->request->get['filter_product'])) {
            $filter_product = $this->request->get['filter_product'];
        } else {
            $filter_product = null;
        }

        if (isset($this->request->get['filter_seller'])) {
            $filter_seller = $this->request->get['filter_seller'];
        } else {
            if($this->user->isSeller()) {
                $filter_seller = $this->user->getId();
            } else {
                $filter_seller = null;
            }
        }

        if (isset($this->request->get['filter_enquiry_status'])) {
            $filter_enquiry_status = $this->request->get['filter_enquiry_status'];
        } else {
            $filter_enquiry_status = null;
        }


        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['filter_product'])) {
            $url .= '&filter_product=' . urlencode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_enquiry_status'])) {
            $url .= '&filter_enquiry_status=' . urlencode(html_entity_decode($this->request->get['filter_enquiry_status'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_seller'])) {
            $url .= '&filter_seller=' . urlencode(html_entity_decode($this->request->get['filter_seller'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/product_enquiry', 'token=' . $this->session->data['token'] . $url, true)
        );

        $data['delete'] = $this->url->link('catalog/product_enquiry/delete', 'token=' . $this->session->data['token'] . $url, true);

        $data['products'] = array();

        $filter_data = array(
            'filter_product'            => $filter_product,
            'filter_enquiry_status'	    => $filter_enquiry_status,
            'filter_seller'	            => $filter_seller,
            'start'                     => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'                     => $this->config->get('config_limit_admin')
        );

        $results_total = $this->model_catalog_product_enquiry->getTotalEnquiries($filter_data);

        $results = $this->model_catalog_product_enquiry->getEnquiriesList($filter_data);

        foreach ($results as $result) {

            $data['product_enquiries'][] = array(
                'enquiry_id'            => $result['enquiry_id'],
                'product_id'            => $result['product_id'],
                'product_name'          => $result['product_name'],
                'product_link'          => HTTPS_CATALOG.'index.php?route=product/product&product_id='.$result['product_id'],
                'enquirer_name'         => $result['sender_name'],
                'read_by_seller'        => ($result['read_by_seller'] == '0' ? 'No' : 'Yes'),
                'enquiry_date'          => date('d-m-Y',strtotime($result['enquiry_date'])),
                'view'                  => $this->url->link('catalog/product_enquiry/view', 'token=' . $this->session->data['token'] . '&enquiry_id=' . $result['enquiry_id'] . $url, true)
            );
        }

        $this->load->model('user/user');
        $data['sellers'] = $this->model_user_user->getSellers();

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_read'] = $this->language->get('text_read');
        $data['text_unread'] = $this->language->get('text_unread');

        $data['column_product'] = $this->language->get('column_product');
        $data['column_name'] = $this->language->get('column_name');
        $data['column_read_status'] = $this->language->get('column_read_status');
        $data['column_date'] = $this->language->get('column_date');
        $data['column_action'] = $this->language->get('column_action');

        $data['entry_product'] = $this->language->get('entry_product');
        $data['entry_seller'] = $this->language->get('entry_seller');
        $data['entry_status'] = $this->language->get('entry_status');

        $data['button_view'] = $this->language->get('button_view');
        $data['button_delete'] = $this->language->get('button_delete');
        $data['button_filter'] = $this->language->get('button_filter');

        $data['token'] = $this->session->data['token'];

        $data['is_seller'] = false;
        if($this->user->isSeller()){
            $data['is_seller'] = true;
        }

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array)$this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $url = '';

        if (isset($this->request->get['filter_product'])) {
            $url .= '&filter_product=' . urlencode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_enquiry_status'])) {
            $url .= '&filter_enquiry_status=' . urlencode(html_entity_decode($this->request->get['filter_enquiry_status'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_seller'])) {
            $url .= '&filter_seller=' . urlencode(html_entity_decode($this->request->get['filter_seller'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }


        $pagination = new Pagination();
        $pagination->total = $results_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('catalog/product_enquiry', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($results_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($results_total - $this->config->get('config_limit_admin'))) ? $results_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $results_total, ceil($results_total / $this->config->get('config_limit_admin')));

        $data['filter_product'] = $filter_product;
        $data['filter_enquiry_status'] = $filter_enquiry_status;
        $data['filter_seller'] = $filter_seller;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/product_enquiry_list', $data));
    }
}
