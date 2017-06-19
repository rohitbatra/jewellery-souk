<?php
class ControllerExtensionPaymentccavenue extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/payment/ccavenue');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->request->post['ccavenue_action']='https://secure.ccavenue.com/transaction/transaction.do?command=initiateTransaction';
			$this->model_setting_setting->editSetting('ccavenue', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_redirect'] = $this->language->get('text_redirect');
		$data['text_iframe'] = $this->language->get('text_iframe');
		$data['text_edit'] = $this->language->get('text_edit');
		

		$data['entry_Merchant_Id'] = $this->language->get('entry_Merchant_Id');
		$data['entry_action'] = $this->language->get('entry_action');
		$data['entry_total'] = $this->language->get('entry_total');
		$data['entry_workingkey'] = $this->language->get('entry_workingkey');
		$data['entry_access_code'] = $this->language->get('entry_access_code');
		$data['entry_completed_status'] = $this->language->get('entry_completed_status');
		$data['entry_failed_status'] = $this->language->get('entry_failed_status');
		$data['entry_pending_status'] = $this->language->get('entry_pending_status');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_checkout_method'] = $this->language->get('entry_checkout_method');
		
		$data['help_checkout_method'] = $this->language->get('help_checkout_method');
		$data['help_workingkey'] = $this->language->get('help_workingkey');
		$data['help_total'] = $this->language->get('help_total');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

 		if (isset($this->error['Merchant_Id'])) {
			$data['error_Merchant_Id'] = $this->error['Merchant_Id'];
		} else {
			$data['error_Merchant_Id'] = '';
		}
		if (isset($this->error['access_code'])) {
			$data['error_access_code'] = $this->error['access_code'];
		} else {
			$data['error_access_code'] = '';
		}
		if (isset($this->error['total'])) {
			$data['error_total'] = $this->error['total'];
		} else {
			$data['error_total'] = '';
		}
		if (isset($this->error['workingkey'])) {
			$data['error_workingkey'] = $this->error['workingkey'];
		} else {
			$data['error_workingkey'] = '';
		}


		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),      		
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_payment'),
			'href'      => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('extension/payment/ccavenue', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$data['action'] = $this->url->link('extension/payment/ccavenue', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['ccavenue_Merchant_Id'])) {
			$data['ccavenue_Merchant_Id'] = $this->request->post['ccavenue_Merchant_Id'];
		} else {
			$data['ccavenue_Merchant_Id'] = $this->config->get('ccavenue_Merchant_Id');
		}

			
		if (isset($this->request->post['ccavenue_total'])) {
			$data['ccavenue_total'] = $this->request->post['ccavenue_total'];
		} else {
			$data['ccavenue_total'] = $this->config->get('ccavenue_total'); 
		} 
	
		if (isset($this->request->post['ccavenue_action'])) {
			$data['ccavenue_action'] = $this->request->post['ccavenue_action'];
		} else {
			$data['ccavenue_action'] = $this->config->get('ccavenue_action'); 
		} 
		if (isset($this->request->post['ccavenue_access_code'])) {
			$data['ccavenue_access_code'] = $this->request->post['ccavenue_access_code'];
		} else {
			$data['ccavenue_access_code'] = $this->config->get('ccavenue_access_code'); 
		} 
		
		if (isset($this->request->post['ccavenue_workingkey'])) {
			$data['ccavenue_workingkey'] = $this->request->post['ccavenue_workingkey'];
		} else {
			$data['ccavenue_workingkey'] = $this->config->get('ccavenue_workingkey'); 
		} 

		
		if (isset($this->request->post['ccavenue_completed_status_id'])) {
			$data['ccavenue_completed_status_id'] = $this->request->post['ccavenue_completed_status_id'];
		} else {
			$data['ccavenue_completed_status_id'] = $this->config->get('ccavenue_completed_status_id');
		}	
		
			
		if (isset($this->request->post['ccavenue_failed_status_id'])) {
			$data['ccavenue_failed_status_id'] = $this->request->post['ccavenue_failed_status_id'];
		} else {
			$data['ccavenue_failed_status_id'] = $this->config->get('ccavenue_failed_status_id');
		}	
								
		if (isset($this->request->post['ccavenue_pending_status_id'])) {
			$data['ccavenue_pending_status_id'] = $this->request->post['ccavenue_pending_status_id'];
		} else {
			$data['ccavenue_pending_status_id'] = $this->config->get('ccavenue_pending_status_id');
		}
									
		

		if (isset($this->request->post['ccavenue_voided_status_id'])) {
			$data['ccavenue_voided_status_id'] = $this->request->post['ccavenue_voided_status_id'];
		} else {
			$data['ccavenue_voided_status_id'] = $this->config->get('ccavenue_voided_status_id');
		}

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['ccavenue_geo_zone_id'])) {
			$data['ccavenue_geo_zone_id'] = $this->request->post['ccavenue_geo_zone_id'];
		} else {
			$data['ccavenue_geo_zone_id'] = $this->config->get('ccavenue_geo_zone_id');
		}

		$this->load->model('localisation/geo_zone');

		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		if (isset($this->request->post['ccavenue_checkout_method'])) {
			$data['ccavenue_checkout_method'] = $this->request->post['ccavenue_checkout_method'];
		} else {
			$data['ccavenue_checkout_method'] = $this->config->get('ccavenue_checkout_method');
		}
		
		if (isset($this->request->post['ccavenue_status'])) {
			$data['ccavenue_status'] = $this->request->post['ccavenue_status'];
		} else {
			$data['ccavenue_status'] = $this->config->get('ccavenue_status');
		}
		
		if (isset($this->request->post['ccavenue_sort_order'])) {
			$data['ccavenue_sort_order'] = $this->request->post['ccavenue_sort_order'];
		} else {
			$data['ccavenue_sort_order'] = $this->config->get('ccavenue_sort_order');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('extension/payment/ccavenue', $data));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/payment/ccavenue')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!isset($this->request->post['ccavenue_Merchant_Id'])) {
			$this->error['Merchant_Id'] = $this->language->get('error_Merchant_Id');
		}
		if (!isset($this->request->post['ccavenue_Merchant_Id'])) {
			$this->error['Merchant_Id'] = $this->language->get('error_Merchant_Id');
		}
		if (!isset($this->request->post['ccavenue_total'])) {
			$this->error['total'] = $this->language->get('error_total');
		}		
		if (!isset($this->request->post['ccavenue_access_code'])) {
			$this->error['access_code'] = $this->language->get('error_access_code');
		}
		if (!isset($this->request->post['ccavenue_workingkey'])) {
			$this->error['workingkey'] = $this->language->get('error_workingkey');
		}

		return !$this->error;
	}
}
?>