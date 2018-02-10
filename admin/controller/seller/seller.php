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

	public function edit() {
		$this->load->language('seller/seller');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('seller/seller');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm())
		{

			$this->model_seller_seller->editSeller($this->request->get['user_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

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

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('seller/seller', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['user_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_company_details'] = $this->language->get('text_company_details');
		$data['text_personal_details'] = $this->language->get('text_personal_details');

		$data['entry_user_group'] = $this->language->get('entry_seller_type');
		$data['entry_username'] = $this->language->get('entry_username');
		$data['entry_firstname'] = $this->language->get('entry_firstname');
		$data['entry_lastname'] = $this->language->get('entry_lastname');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_password'] = $this->language->get('entry_password');
		$data['entry_confirm'] = $this->language->get('entry_confirm');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_approved'] = $this->language->get('entry_approved');

		$data['entry_address_1'] = $this->language->get('entry_address_1');
		$data['entry_address_2'] = $this->language->get('entry_address_2');
		$data['entry_postcode'] = $this->language->get('entry_postcode');
		$data['entry_city'] = $this->language->get('entry_city');
		$data['entry_country'] = $this->language->get('entry_country');

		$data['entry_company_name'] = $this->language->get('entry_company_name');
		$data['entry_company_pan'] = $this->language->get('entry_company_pan');
		$data['entry_company_tin'] = $this->language->get('entry_company_tin');
		$data['entry_company_p_firstname'] = $this->language->get('entry_company_p_firstname');
		$data['entry_company_p_lastname'] = $this->language->get('entry_company_p_lastname');
		$data['entry_your_pan'] = $this->language->get('entry_your_pan');


		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_transaction'] = $this->language->get('tab_transaction');

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->get['user_id'])) {
			$data['user_id'] = $this->request->get['user_id'];
		} else {
			$data['user_id'] = 0;
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		if (isset($this->error['username'])) {
			$data['error_username'] = $this->error['username'];
		} else {
			$data['error_username'] = '';
		}

		if (isset($this->error['password'])) {
			$data['error_password'] = $this->error['password'];
		} else {
			$data['error_password'] = '';
		}

		if (isset($this->error['confirm'])) {
			$data['error_confirm'] = $this->error['confirm'];
		} else {
			$data['error_confirm'] = '';
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

		if (!isset($this->request->get['user_id'])) {
			$data['action'] = $this->url->link('seller/seller/add', 'token=' . $this->session->data['token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('seller/seller/edit', 'token=' . $this->session->data['token'] . '&user_id=' . $this->request->get['user_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('seller/seller', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['user_id'])) {
			$seller_info = $this->model_seller_seller->getSeller($this->request->get['user_id']);
		}

		if (isset($this->request->post['username'])) {
			$data['username'] = $this->request->post['username'];
		} elseif (!empty($seller_info)) {
			$data['username'] = $seller_info['username'];
		} else {
			$data['username'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} elseif (!empty($seller_info)) {
			$data['email'] = $seller_info['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($seller_info)) {
			$data['status'] = $seller_info['status'];
		} else {
			$data['status'] = true;
		}

		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}

		if (isset($this->request->post['confirm'])) {
			$data['confirm'] = $this->request->post['confirm'];
		} else {
			$data['confirm'] = '';
		}

		// Selected Seller Type
		$data['seller_type_id'] = $seller_info['user_group_id'];
		// Seller Types
		$data['seller_types'] = $this->model_seller_seller->getSellerTypes();

		// Seller Details
		$data['seller_details'] = $seller_details =  $this->model_seller_seller->getSellerDetails($data['user_id']);

		// Arrange the UI Variables as per seller_details type
		if($seller_details['seller_type'] == "company")
		{
			if (isset($this->request->post['company_name'])) {
				$data['company_name'] = $this->request->post['company_name'];
			} elseif (!empty($seller_details)) {
				$data['company_name'] = $seller_details['company_name'];
			} else {
				$data['company_name'] = '';
			}

			if (isset($this->request->post['company_pan'])) {
				$data['company_pan'] = $this->request->post['company_pan'];
			} elseif (!empty($seller_details)) {
				$data['company_pan'] = $seller_details['company_pan'];
			} else {
				$data['company_pan'] = '';
			}

			if (isset($this->request->post['company_tin'])) {
				$data['company_tin'] = $this->request->post['company_tin'];
			} elseif (!empty($seller_details)) {
				$data['company_tin'] = $seller_details['company_tin'];
			} else {
				$data['company_tin'] = '';
			}

			if (isset($this->request->post['company_p_firstname'])) {
				$data['firstname'] = $this->request->post['company_p_firstname'];
			} elseif (!empty($seller_details)) {
				$data['firstname'] = $seller_details['company_p_firstname'];
			} else {
				$data['firstname'] = '';
			}

			if (isset($this->request->post['company_p_lastname'])) {
				$data['lastname'] = $this->request->post['company_p_lastname'];
			} elseif (!empty($seller_details)) {
				$data['lastname'] = $seller_details['company_p_lastname'];
			} else {
				$data['lastname'] = '';
			}

		} else if($seller_details['seller_type'] == "individual") {

			if (isset($this->request->post['pan_number'])) {
				$data['pan_number'] = $this->request->post['pan_number'];
			} elseif (!empty($seller_details)) {
				$data['pan_number'] = $seller_details['pan_number'];
			} else {
				$data['pan_number'] = '';
			}

			if (isset($this->request->post['firstname'])) {
				$data['firstname'] = $this->request->post['firstname'];
			} else if(!empty($seller_info) && array_key_exists('firstname', $seller_info)) {
				$data['firstname'] = $seller_info['firstname'];
			}else {
				$data['firstname'] = '';
			}

			if (isset($this->request->post['lastname'])) {
				$data['lastname'] = $this->request->post['lastname'];
			} else if(!empty($seller_info) && array_key_exists('lastname', $seller_info)) {
				$data['lastname'] = $seller_info['lastname'];
			}else {
				$data['lastname'] = '';
			}

		}

		// Address UI Variables
		if (isset($this->request->post['address_1'])) {
			$data['address_1'] = $this->request->post['address_1'];
		} elseif (!empty($seller_details)) {
			$data['address_1'] = $seller_details['address_1'];
		} else {
			$data['address_1'] = '';
		}

		if (isset($this->request->post['address_2'])) {
			$data['address_2'] = $this->request->post['address_2'];
		} elseif (!empty($seller_details)) {
			$data['address_2'] = $seller_details['address_2'];
		} else {
			$data['address_2'] = '';
		}

		if (isset($this->request->post['postcode'])) {
			$data['postcode'] = $this->request->post['postcode'];
		} elseif (!empty($seller_details)) {
			$data['postcode'] = $seller_details['postcode'];
		} else {
			$data['postcode'] = '';
		}

		if (isset($this->request->post['city'])) {
			$data['city'] = $this->request->post['city'];
		} elseif (!empty($seller_details)) {
			$data['city'] = $seller_details['city'];
		} else {
			$data['city'] = '';
		}

		if (isset($this->request->post['country_id'])) {
			$data['country_id'] = $this->request->post['country_id'];
		} elseif (!empty($seller_details) && array_key_exists('country_id',$seller_details)) {
			$data['country_id'] = $seller_details['country_id'];
		} else {
			$data['country_id'] = '99';
		}

		if (isset($this->request->post['telephone'])) {
			$data['telephone'] = $this->request->post['telephone'];
		} elseif (!empty($seller_details)) {
			$data['telephone'] = $seller_details['telephone'];
		} else {
			$data['telephone'] = '';
		}

		// Get All Countries
		$this->load->model('localisation/country');

		$data['countries'] = $this->model_localisation_country->getCountries();

		// Payment Transactions from CCAvenue
		$data['transactions'] = $this->model_seller_seller->getSellerPaymentTransactions($data['user_id']);

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('seller/seller_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'seller/seller')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['email']) > 96) || !filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if ((utf8_strlen($this->request->post['username']) > 96) || !filter_var($this->request->post['username'], FILTER_VALIDATE_EMAIL)) {
			$this->error['username'] = $this->language->get('error_email');
		}


		if ($this->request->post['password'] || (!isset($this->request->get['user_id']))) {
			if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
				$this->error['password'] = $this->language->get('error_password');
			}

			if ($this->request->post['password'] != $this->request->post['confirm']) {
				$this->error['confirm'] = $this->language->get('error_confirm');
			}
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}


}
