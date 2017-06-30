<?php
class ControllerExtensionModuleSoProductLabel extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/so_product_label');
		$this->document->setTitle($this->language->get('heading_title'));
		$data['objlang']	= $this->language;
		
		$this->load->model('extension/module');
		$this->load->model('extension/extension');
		$this->load->model('setting/setting');
		$this->load->model('extension/module/so_product_label');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$action = isset($this->request->post["action"]) ? $this->request->post["action"] : "";
			unset($this->request->post['action']);

			$params = $this->request->post['so_product_label'];
			$this->model_setting_setting->editSetting('so_product_label', $params);

			$this->session->data['success'] = $this->language->get('text_success');

			if($action == "save_edit") {
				$this->response->redirect($this->url->link('extension/module/so_product_label', 'token=' . $this->session->data['token'] . '&module_id='.$this->request->get['module_id'], 'SSL'));
			}else{
				$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
			}
		}

		// Save and Stay --------------------------------------------------------------
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/so_product_label', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/so_product_label', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);			
		}

		$data['token']		= $this->session->data['token'];

		// Get Language
		$data['heading_title'] 		= $this->language->get('heading_title');
		$data['heading_title_so'] 	= $this->language->get('heading_title_so');
		
		$data['entry_button_save_and_edit'] 	= $this->language->get('entry_button_save_and_edit');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_show_category'] = $this->language->get('entry_show_category');
		$data['entry_show_product'] = $this->language->get('entry_show_product');
		$data['entry_show_search'] = $this->language->get('entry_show_search');
		$data['entry_show_special'] = $this->language->get('entry_show_special');
		$data['entry_show_manufacturer'] = $this->language->get('entry_show_manufacturer');
		$data['entry_show_compare'] = $this->language->get('entry_show_compare');
		$data['entry_show_featured'] = $this->language->get('entry_show_featured');
		$data['entry_show_bestseller'] = $this->language->get('entry_show_bestseller');
		$data['entry_show_lastest'] = $this->language->get('entry_show_lastest');
		$data['entry_show_special_mod'] = $this->language->get('entry_show_special_mod');
		
		$data['help_status'] = $this->language->get('help_status');
		$data['help_show_category'] = $this->language->get('help_show_category');
		$data['help_show_product'] = $this->language->get('help_show_product');
		$data['help_show_search'] = $this->language->get('help_show_search');
		$data['help_show_special'] = $this->language->get('help_show_special');
		$data['help_show_mannufacturer'] = $this->language->get('help_show_mannufacturer');
		$data['help_show_compare'] = $this->language->get('help_show_compare');
		$data['help_show_featured'] = $this->language->get('help_show_featured');
		$data['help_show_bestseller'] = $this->language->get('help_show_bestseller');
		$data['help_show_lastest'] = $this->language->get('help_show_lastest');
		$data['help_show_special_mod'] = $this->language->get('help_show_special_mod');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/so_product_label', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('extension/module/so_product_label', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}
		
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		
		$setting_product_label		= $this->model_setting_setting->getSetting('so_product_label');
		if (isset($setting_product_label['so_product_label_enabled'])) {
			$data['so_product_label_enabled'] = $setting_product_label['so_product_label_enabled'];
		} else {
			$data['so_product_label_enabled'] = '';
		}

		if (isset($setting_product_label['so_product_label_showing_category'])) {
			$data['so_product_label_showing_category'] = $setting_product_label['so_product_label_showing_category'];
		} else {
			$data['so_product_label_showing_category'] = '';
		}
		
		if (isset($setting_product_label['so_product_label_showing_product'])) {
			$data['so_product_label_showing_product'] = $setting_product_label['so_product_label_showing_product'];
		} else {
			$data['so_product_label_showing_product'] = '';
		}
		
		if (isset($setting_product_label['so_product_label_showing_search'])) {
			$data['so_product_label_showing_search'] = $setting_product_label['so_product_label_showing_search'];
		} else {
			$data['so_product_label_showing_search'] = '';
		}
		
		if (isset($setting_product_label['so_product_label_showing_special'])) {
			$data['so_product_label_showing_special'] = $setting_product_label['so_product_label_showing_special'];
		} else {
			$data['so_product_label_showing_special'] = '';
		}
		
		if (isset($setting_product_label['so_product_label_showing_manufacturer'])) {
			$data['so_product_label_showing_manufacturer'] = $setting_product_label['so_product_label_showing_manufacturer'];
		} else {
			$data['so_product_label_showing_manufacturer'] = '';
		}
		
		if (isset($setting_product_label['so_product_label_showing_compare'])) {
			$data['so_product_label_showing_compare'] = $setting_product_label['so_product_label_showing_compare'];
		} else {
			$data['so_product_label_showing_compare'] = '';
		}
		
		if (isset($setting_product_label['so_product_label_showing_featured'])) {
			$data['so_product_label_showing_featured'] = $setting_product_label['so_product_label_showing_featured'];
		} else {
			$data['so_product_label_showing_featured'] = '';
		}
		
		if (isset($setting_product_label['so_product_label_showing_bestseller'])) {
			$data['so_product_label_showing_bestseller'] = $setting_product_label['so_product_label_showing_bestseller'];
		} else {
			$data['so_product_label_showing_bestseller'] = '';
		}
		
		if (isset($setting_product_label['so_product_label_showing_lastest'])) {
			$data['so_product_label_showing_lastest'] = $setting_product_label['so_product_label_showing_lastest'];
		} else {
			$data['so_product_label_showing_lastest'] = '';
		}
		
		if (isset($setting_product_label['so_product_label_showing_special_mod'])) {
			$data['so_product_label_showing_special_mod'] = $setting_product_label['so_product_label_showing_special_mod'];
		} else {
			$data['so_product_label_showing_special_mod'] = '';
		}

        $data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/so_product_label', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/so_product_label')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	function install() {
		$this->load->model('setting/setting');
		$this->load->model('extension/module');

		$data	= array(
			'so_product_label_enabled'	=> 1
		);
		$this->model_setting_setting->editSetting('so_product_label', $data);
		$this->model_extension_module->addModule('so_product_label', array('name'=>'So Product Label'));
	}

	function uninstall() {
		$this->load->model('setting/setting');
		$this->load->model('extension/module');
		$this->model_setting_setting->deleteSetting('so_product_label');
		$this->model_extension_module->deleteModulesByCode('so_product_label');
	}
}