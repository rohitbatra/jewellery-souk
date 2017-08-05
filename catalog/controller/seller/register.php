<?php
class ControllerSellerRegister extends Controller {
    private $error = array();

    public function index()
    {
        $this->load->language('seller/register');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
        $this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
        $this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

        $this->load->model('seller/seller');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate())
        {
            $seller_id = $this->model_seller_seller->addSeller($this->request->post);

            if(is_numeric($seller_id))
            {
                // Redirect to Payment Processing Page -- DUMMY PAGE
                $this->response->redirect($this->url->link('seller/payment_process', '&uID='. $seller_id, true));
            }else {
                $this->session->data['error'] = "There's a problem with your Registration, please email us at <a href='mailto:seller.support@sezplus.com'>seller.support@sezplus.com</a>'";
            }
       }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_account'),
            'href' => $this->url->link('seller/seller', '', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_register'),
            'href' => $this->url->link('seller/register', '', true)
        );

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_account_already'] = sprintf($this->language->get('text_account_already'), $this->url->link('seller/login', '', true));
        $data['text_your_details'] = $this->language->get('text_your_details');
        $data['text_company_details'] = $this->language->get('text_company_details');
        $data['text_account_details'] = $this->language->get('text_account_details');
        $data['text_your_address'] = $this->language->get('text_your_address');
        $data['text_company_address'] = $this->language->get('text_company_address');
        $data['text_your_password'] = $this->language->get('text_your_password');
        $data['text_your_payment'] = $this->language->get('text_your_payment');
        $data['text_subscription_fees'] = $this->language->get('text_subscription_fees');

        $data['entry_username'] = $this->language->get('entry_username');
        $data['entry_firstname'] = $this->language->get('entry_firstname');
        $data['entry_lastname'] = $this->language->get('entry_lastname');
        $data['entry_email'] = $this->language->get('entry_email');
        $data['entry_username'] = $this->language->get('entry_username');
        $data['entry_telephone'] = $this->language->get('entry_telephone');
        $data['entry_company'] = $this->language->get('entry_company');
        $data['entry_individual'] = $this->language->get('entry_individual');
        $data['entry_address_1'] = $this->language->get('entry_address_1');
        $data['entry_address_2'] = $this->language->get('entry_address_2');
        $data['entry_postcode'] = $this->language->get('entry_postcode');
        $data['entry_city'] = $this->language->get('entry_city');
        $data['entry_country'] = $this->language->get('entry_country');
        $data['entry_zone'] = $this->language->get('entry_zone');
        $data['entry_password'] = $this->language->get('entry_password');
        $data['entry_confirm'] = $this->language->get('entry_confirm');
        $data['entry_subscription_amount'] = $this->language->get('entry_subscription_amount');
        $data['entry_seller_type'] = $this->language->get('entry_seller_type');
        $data['entry_category'] = $this->language->get('entry_category');

        $data['entry_company_name'] = $this->language->get('entry_company_name');
        $data['entry_company_pan'] = $this->language->get('entry_company_pan');
        $data['entry_company_tin'] = $this->language->get('entry_company_tin');
        $data['entry_company_p_firstname'] = $this->language->get('entry_company_p_firstname');
        $data['entry_company_p_lastname'] = $this->language->get('entry_company_p_lastname');
        $data['entry_your_pan'] = $this->language->get('entry_your_pan');


        // Payment Entries
        $data['entry_bank_name'] = $this->language->get('entry_bank_name');
        $data['entry_bank_branch'] = $this->language->get('entry_bank_branch');
        $data['entry_bank_account_number'] = $this->language->get('entry_account_number');
        $data['entry_bank_ifsc_code'] = $this->language->get('entry_ifsc_code');
        $data['entry_bank_payee_name'] = $this->language->get('entry_payee_name');
        $data['entry_selling_fees'] = $this->language->get('entry_selling_fees');

        $data['button_continue'] = $this->language->get('button_continue');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['username'])) {
            $data['error_username'] = $this->error['username'];
        } else {
            $data['error_username'] = '';
        }

        if (isset($this->error['firstname'])) {
            $data['error_firstname'] = $this->error['firstname'];
        } else {
            $data['error_firstname'] = '';
        }

        if (isset($this->error['lastname'])) {
            $data['error_lastname'] = $this->error['lastname'];
        } else {
            $data['error_lastname'] = '';
        }

        if (isset($this->error['company_p_firstname'])) {
            $data['error_company_p_firstname'] = $this->error['company_p_firstname'];
        } else {
            $data['error_company_p_firstname'] = '';
        }

        if (isset($this->error['company_p_lastname'])) {
            $data['error_company_p_lastname'] = $this->error['company_p_lastname'];
        } else {
            $data['error_company_p_lastname'] = '';
        }

        if (isset($this->error['email'])) {
            $data['error_email'] = $this->error['email'];
        } else {
            $data['error_email'] = '';
        }

        if (isset($this->error['telephone'])) {
            $data['error_telephone'] = $this->error['telephone'];
        } else {
            $data['error_telephone'] = '';
        }

        if (isset($this->error['address_1'])) {
            $data['error_address_1'] = $this->error['address_1'];
        } else {
            $data['error_address_1'] = '';
        }

        if (isset($this->error['city'])) {
            $data['error_city'] = $this->error['city'];
        } else {
            $data['error_city'] = '';
        }

        if (isset($this->error['postcode'])) {
            $data['error_postcode'] = $this->error['postcode'];
        } else {
            $data['error_postcode'] = '';
        }

        if (isset($this->error['country'])) {
            $data['error_country'] = $this->error['country'];
        } else {
            $data['error_country'] = '';
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

        if (isset($this->error['seller_type'])) {
            $data['error_seller_type'] = $this->error['seller_type'];
        } else {
            $data['error_seller_type'] = '';
        }

        if (isset($this->error['category'])) {
            $data['error_category'] = $this->error['category'];
        } else {
            $data['error_category'] = '';
        }

        if (isset($this->error['company_name'])) {
            $data['error_company_name'] = $this->error['company_name'];
        } else {
            $data['error_company_name'] = '';
        }

        if (isset($this->error['address_1'])) {
    			$data['error_address_1'] = $this->error['address_1'];
    		} else {
    			$data['error_address_1'] = '';
    		}

    		if (isset($this->error['city'])) {
    			$data['error_city'] = $this->error['city'];
    		} else {
    			$data['error_city'] = '';
    		}

    		if (isset($this->error['postcode'])) {
    			$data['error_postcode'] = $this->error['postcode'];
    		} else {
    			$data['error_postcode'] = '';
    		}

        $data['action'] = $this->url->link('seller/register', '', true);

        if (isset($this->request->post['seller_type'])) {
            $data['seller_type'] = $this->request->post['seller_type'];
        } else {
            $data['seller_type'] = '';
        }

        if (isset($this->request->post['category'])) {
            $data['category'] = $this->request->post['category'];
        } else {
            $data['category'] = '';
        }


        if (isset($this->request->post['username'])) {
            $data['username'] = $this->request->post['username'];
        } else {
            $data['username'] = '';
        }

        if (isset($this->request->post['firstname'])) {
            $data['firstname'] = $this->request->post['firstname'];
        } else {
            if(isset($this->request->post['company_p_firstname']) && !empty($this->request->post['company_p_firstname']))
            {
              $data['firstname'] = $this->request->post['company_p_firstname'];
            }else{
              $data['firstname'] = '';
            }
        }

        if (isset($this->request->post['lastname'])) {
            $data['lastname'] = $this->request->post['lastname'];
        } else {
          if(isset($this->request->post['company_p_lastname']) && !empty($this->request->post['company_p_lastname']))
          {
            $data['lastname'] = $this->request->post['company_p_lastname'];
          }else{
            $data['lastname'] = '';
          }
        }

        if (isset($this->request->post['email'])) {
            $data['email'] = $this->request->post['email'];
        } else {
            $data['email'] = '';
        }

        if (isset($this->request->post['telephone'])) {
            $data['telephone'] = $this->request->post['telephone'];
        } else {
            $data['telephone'] = '';
        }

        if (isset($this->request->post['company'])) {
            $data['company'] = $this->request->post['company'];
        } else {
            $data['company'] = '';
        }

        if (isset($this->request->post['address_1'])) {
            $data['address_1'] = $this->request->post['address_1'];
        } else {
            $data['address_1'] = '';
        }

        if (isset($this->request->post['address_2'])) {
            $data['address_2'] = $this->request->post['address_2'];
        } else {
            $data['address_2'] = '';
        }

        if (isset($this->request->post['postcode'])) {
            $data['postcode'] = $this->request->post['postcode'];
        } elseif (isset($this->session->data['shipping_address']['postcode'])) {
            $data['postcode'] = $this->session->data['shipping_address']['postcode'];
        } else {
            $data['postcode'] = '';
        }

        if (isset($this->request->post['city'])) {
            $data['city'] = $this->request->post['city'];
        } else {
            $data['city'] = '';
        }

        if (isset($this->request->post['country_id'])) {
            $data['country_id'] = (int)$this->request->post['country_id'];
        } elseif (isset($this->session->data['shipping_address']['country_id'])) {
            $data['country_id'] = $this->session->data['shipping_address']['country_id'];
        } else {
            $data['country_id'] = $this->config->get('config_country_id');
        }


        // Custom Details
        if (isset($this->request->post['pan_number'])) {
            $data['pan_number'] = $this->request->post['pan_number'];
        } else {
            $data['pan_number'] = '';
        }

        if (isset($this->request->post['company_pan'])) {
            $data['company_pan'] = $this->request->post['company_pan'];
        } else {
            $data['company_pan'] = '';
        }

        if (isset($this->request->post['company_tin'])) {
            $data['company_tin'] = $this->request->post['company_tin'];
        } else {
            $data['company_tin'] = '';
        }

        if (isset($this->request->post['company_name'])) {
            $data['company_name'] = $this->request->post['company_name'];
        } else {
            $data['company_name'] = '';
        }

        $this->load->model('localisation/country');

        $data['countries'] = $this->model_localisation_country->getCountries();

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

        if (isset($this->request->post['subscription_fees'])) {
            $data['subscription_fees'] = $this->request->post['subscription_fees'];
        } else {
            $data['subscription_fees'] = $this->config->get('subscription_fees');
        }


        // Captcha
        if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('register', (array)$this->config->get('config_captcha_page'))) {
            $data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'), $this->error);
        } else {
            $data['captcha'] = '';
        }

        if ($this->config->get('config_account_id')) {
            $this->load->model('catalog/information');

            $information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

            if ($information_info) {
                $data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_account_id'), true), $information_info['title'], $information_info['title']);
            } else {
                $data['text_agree'] = '';
            }
        } else {
            $data['text_agree'] = '';
        }

        if (isset($this->request->post['agree'])) {
            $data['agree'] = $this->request->post['agree'];
        } else {
            $data['agree'] = false;
        }

        // User Group Categories
        $categoryArr = ['jewellery_manufacturer','jewellery_retailer','jewellery_wholeseller','jewellery_institute','cam_processing','freelancer','used_machinery_seller','others'];

        foreach($categoryArr as $cat)
        {
            $data['categories'][] = array('name'=> ucwords(str_replace('_', ' ', $cat )), 'value'=> $cat);
        }

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('seller/register', $data));
    }

    /**
    * Required Fields - Email, Password, Confirm Password, username, address_1, country, city, postcode, telephone
    * Conditional Required Fields - company_name, firstname, lastname
    * email & username should be unique
    */
    private function validate()
    {
        // Check for Exist
        if($this->emailExists($this->request->post['email']))
        {
            $this->error['email'] = $this->language->get('error_exists');
        }

        if ((utf8_strlen($this->request->post['email']) > 96) || !filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
            $this->error['email'] = $this->language->get('error_email');
        }

        if($this->usernameExists($this->request->post['username']))
        {
            $this->error['username'] = $this->language->get('error_username_exists');
        }

        if ((utf8_strlen($this->request->post['username']) < 3) || (utf8_strlen($this->request->post['username']) > 25)) {
            $this->error['username'] = $this->language->get('error_username');
        }

        // Mandatory Conditions
        if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
            $this->error['password'] = $this->language->get('error_password');
        }

        if ($this->request->post['confirm'] != $this->request->post['password']) {
            $this->error['confirm'] = $this->language->get('error_confirm');
        }

        if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
            $this->error['telephone'] = $this->language->get('error_telephone');
        }

        if($this->request->post['seller_type'] == 'individual')
        {
            // Individual Fields Validation
            if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
                $this->error['firstname'] = $this->language->get('error_firstname');
            }

            if ((utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
                $this->error['lastname'] = $this->language->get('error_lastname');
            }
        }

        if($this->request->post['seller_type'] == 'company')
        {
            // Company Fields Validation
            if ((utf8_strlen(trim($this->request->post['company_name'])) < 1) ) {
                $this->error['company_name'] = $this->language->get('error_company_name');
            }

            if ((utf8_strlen(trim($this->request->post['company_p_firstname'])) < 1) || (utf8_strlen(trim($this->request->post['company_p_firstname'])) > 32)) {
                $this->error['company_p_firstname'] = $this->language->get('error_company_p_firstname');
            }

            if ((utf8_strlen(trim($this->request->post['company_p_lastname'])) < 1) || (utf8_strlen(trim($this->request->post['company_p_lastname'])) > 32)) {
                $this->error['company_p_lastname'] = $this->language->get('error_company_p_lastname');
            }
        }

        if ((utf8_strlen(trim($this->request->post['address_1'])) < 3) || (utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
          $this->error['address_1'] = $this->language->get('error_address_1');
        }

        if ((utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
          $this->error['city'] = $this->language->get('error_city');
        }

        $this->load->model('localisation/country');

        $country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

        if ($country_info && $country_info['postcode_required'] && (utf8_strlen(trim($this->request->post['postcode'])) < 2 || utf8_strlen(trim($this->request->post['postcode'])) > 10)) {
          $this->error['postcode'] = $this->language->get('error_postcode');
        }


        // Captcha
        if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('register', (array)$this->config->get('config_captcha_page'))) {
            $captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

            if ($captcha) {
                $this->error['captcha'] = $captcha;
            }
        }

        // Agree to terms
        if ($this->config->get('config_account_id')) {
            $this->load->model('catalog/information');

            $information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

            if ($information_info && !isset($this->request->post['agree'])) {
                $this->error['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
            }
        }

        return !$this->error;
    }

    protected function emailExists($email)
    {
        $emailArr = array();
        $this->load->model('seller/seller');
        $emailArr =  $this->model_seller_seller->checkForEmail($email);

        if(!empty($emailArr))
        {
            return true;
        }else {
            return false;
        }
    }

    protected function usernameExists($username)
    {
        $usernameArr = array();
        $this->load->model('seller/seller');
        $usernameArr =  $this->model_seller_seller->checkForUsername($username);

        if(!empty($usernameArr))
        {
            return true;
        }else {
            return false;
        }
    }


}
