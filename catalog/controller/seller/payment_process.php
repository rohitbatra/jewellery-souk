<?php
class ControllerSellerPaymentProcess extends Controller {
	private $error = array();

	public function index() {

    $this->language->load('seller/payment_process');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('seller/seller');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('seller/seller','', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_payment_process'),
			'href' => $this->url->link('seller/payment_process',  'uID=' . (isset($this->request->get['uID']) ? $this->request->get['uID'] : ''), true)
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['button_continue'] = $this->language->get('button_continue');

    if(isset($this->request->get['uID']) && !empty($this->request->get['uID']))
    {

			$uID = base64_decode($this->request->get['uID']);

      $data['uID'] = $uID;
      $data['error_warning'] = "";
      // get Seller Info from Database

      $seller_info = $this->model_seller_seller->getSellerById($data['uID']);

      if($seller_info['seller_type'] == "company")
      {
        $data['seller_name'] = $seller_info['company_name'];
      }else {
        $data['seller_name'] = $seller_info['firstname'] ." " .$seller_info['lastname'];
      }
      $data['text_welcome'] = sprintf($this->language->get('text_welcome'), $data['seller_name']);
      $data['text_message'] = sprintf($this->language->get('text_message'), $this->config->get('subscription_fees'));
      $data['subscription_fees'] = $this->config->get('subscription_fees');
      $data['continue'] = $this->url->link('','',true);

      $data['action'] = "";


    }else if(isset($this->request->get['error']) && !empty($this->request->get['error']))
    {
        // Payment Cancelled by USER from CCAVENUE
				// Redirect to Payment Not Completed Error Page
				$this->response->redirect($this->url->link('seller/payment_error', 'uID=' . base64_encode($data['uID']) , 'SSL'));

    }else if(isset($this->request->get['payment']) && !empty($this->request->get['payment']))
		{

        // Also check for Success in the POST method from CCAVENUE
				if(isset($this->request->post['order_status']) && !empty($this->request->post['order_status']))
				{
					$postData = $this->request->post;
					if(isset($this->request->post['order_id']))
					{
						$tmp = explode('-',$this->request->post['order_id']);
						$data['uID'] = end($tmp);
					}
					$postData['seller_id'] = $data['uID'];
						// Check for Order Status
						if(strtolower($this->request->post['order_status']) == 'success')
						{

								$this->model_seller_seller->addPaymentInfo($postData);
								$this->model_seller_seller->emailPaymentReceipt($postData);
								$this->response->redirect($this->url->link('seller/payment_success', 'uID=' . base64_encode($data['uID']) , 'SSL'));

						} else {
								$this->model_seller_seller->addPaymentInfo($postData);
								$this->model_seller_seller->emailPaymentReceipt($postData);
								$this->response->redirect($this->url->link('seller/payment_error', 'uID=' . base64_encode($data['uID']) , 'SSL'));
						}

				}
    } else {
				// unknown error landing to this page
      // Show error message
      $data['error_warning'] = $this->language->get('error_wrong_page');
      $data['text_message'] = $this->language->get('error_something_wrong');
      $data['contact_url'] = $this->url->link('seller/register','',true);
			$data['button_continue'] = 'Go to Home';
      $data['action'] = "";
    }

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('seller/payment_process', $data));
	}

}
