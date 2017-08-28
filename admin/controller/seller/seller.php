<?php
class ControllerSellerSeller extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('seller/seller');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('seller/seller');

		$this->getList();
	}

	protected function getList() {

		if (isset($this->request->get['filter_email'])) {
			$filter_email = $this->request->get['filter_email'];
		} else {
			$filter_email = null;
		}

		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
		}

		if (isset($this->request->get['filter_seller_type'])) {
			$filter_seller_type = $this->request->get['filter_seller_type'];
		} else {
			$filter_seller_type = null;
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';


		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_seller_type'])) {
			$url .= '&filter_seller_type=' . $this->request->get['filter_seller_type'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
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
			'href' => $this->url->link('seller/seller', 'token=' . $this->session->data['token'] . $url, true)
		);

		$data['add'] = $this->url->link('seller/seller/add', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('seller/seller/delete', 'token=' . $this->session->data['token'] . $url, true);

		$data['sellers'] = array();

		$filter_data = array(
			'filter_email'             => $filter_email,
			'filter_seller_type' => $filter_seller_type,
			'filter_status'            => $filter_status,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$seller_total = $this->model_seller_seller->getTotalSellers($filter_data);

		$seller_types = $this->model_seller_seller->getSellerTypes();

		$results = $this->model_seller_seller->getSellers($filter_data);

		foreach ($results as $result) {
			$data['sellers'][] = array(
				'user_id'    => $result['user_id'],
				'email'   => $result['email'],
				'seller_enabled' => ($result['status'] ? true : false),
				'status'     => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'seller_type'     => $result['seller_type'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'lock' => $this->url->link('seller/seller/lock', 'token=' . $this->session->data['token'] . '&user_id=' . $result['user_id'] . $url, true),
				'unlock' => $this->url->link('seller/seller/unlock', 'token=' . $this->session->data['token'] . '&user_id=' . $result['user_id'] . $url, true),
				'edit'       => $this->url->link('seller/seller/edit', 'token=' . $this->session->data['token'] . '&user_id=' . $result['user_id'] . $url, true)
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_email'] = $this->language->get('column_email');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_seller_type'] = $this->language->get('column_seller_type');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_action'] = $this->language->get('column_action');

		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_seller_type'] = $this->language->get('entry_seller_type');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['button_lock'] = $this->language->get('button_lock');
		$data['button_unlock'] = $this->language->get('button_unlock');
		$data['button_filter'] = $this->language->get('button_filter');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');

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

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_seller_type'])) {
			$url .= '&filter_seller_type=' . $this->request->get['filter_seller_type'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$pagination = new Pagination();
		$pagination->total = $seller_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('seller/seller', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();
		$data['token'] = $this->session->data['token'];
		$data['results'] = sprintf($this->language->get('text_pagination'), ($seller_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($seller_total - $this->config->get('config_limit_admin'))) ? $seller_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $seller_total, ceil($seller_total / $this->config->get('config_limit_admin')));

		// Get Seller Types from DB
		$data['seller_types'] = $seller_types;

		$data['filter_email'] = $filter_email;
		$data['filter_status'] = $filter_status;
		$data['filter_seller_type'] = $filter_seller_type;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('seller/seller_list', $data));
	}

	public function unlock() {
		$this->load->language('seller/seller');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('seller/seller');

		if (isset($this->request->get['user_id']))
		{

			$this->model_seller_seller->enableSeller($this->request->get['user_id']);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_seller_type'])) {
				$url .= '&filter_seller_type=' . $this->request->get['filter_seller_type'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('seller/seller', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	public function lock() {

		$this->load->language('seller/seller');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('seller/seller');

		if (isset($this->request->get['user_id']))
		{

			$this->model_seller_seller->disableSeller($this->request->get['user_id']);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_seller_type'])) {
				$url .= '&filter_seller_type=' . $this->request->get['filter_seller_type'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('seller/seller', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

}
