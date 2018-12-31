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

        $this->getForm();
    }

    protected function getForm() {


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
