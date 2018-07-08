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
			'href' => $this->url->link('seller/landing','', true)
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

			if(empty($seller_info))
			{
					// Redirect to Error page -- there was some error that got him to this page.
					goto toError;
			}

      if($seller_info['seller_type'] == "company")
      {
        $data['seller_name'] = $seller_info['company_name'];
      }else {
        $data['seller_name'] = $seller_info['firstname'] ." " .$seller_info['lastname'];
      }
      $data['text_welcome'] = sprintf($this->language->get('text_welcome'), $data['seller_name']);
      $data['subscription_fees'] = $this->model_seller_seller->getSubscriptionFeesByUserGroup($seller_info['user_group_id']);
			$data['text_message'] = sprintf($this->language->get('text_message'), $data['subscription_fees']);

      $data['continue'] = $this->url->link('','',true);

      $data['action'] = "";


    } else if(isset($this->request->get['error']) && !empty($this->request->get['error'])) {
        // Payment Cancelled by USER from CCAVENUE
				// Redirect to Payment Not Completed Error Page
				$this->response->redirect($this->url->link('seller/payment_error', 'uID=' . base64_encode($data['uID']) , 'SSL'));

    } else if(isset($this->request->get['payment']) && !empty($this->request->get['payment'])) {

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
								$this->model_seller_seller->approveSeller($postData['seller_id']);
								$this->model_seller_seller->emailPaymentReceipt($postData);
								$this->response->redirect($this->url->link('seller/payment_success', 'uID=' . base64_encode($data['uID']) , 'SSL'));

						} else {
								$this->model_seller_seller->addPaymentInfo($postData);
								$this->model_seller_seller->emailPaymentReceipt($postData);
								$this->response->redirect($this->url->link('seller/payment_error', 'uID=' . base64_encode($data['uID']) , 'SSL'));
						}

				}
    }else if(isset($this->request->get['nopay']) && !empty($this->request->get['nopay'])) {

			// Condition to Handle the Seller(s) Registration with '0' Subscript Fees
			$this->model_seller_seller->approveSeller($this->request->get['uId']);
			$this->model_seller_seller->sendNoPayWelcomeEmail($this->request->get['uId']);
			$this->response->redirect($this->url->link('seller/payment_success', 'uID=' . base64_encode($this->request->get['uId']) .'&nopay=1' , 'SSL'));

		} else {
			toError:
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
