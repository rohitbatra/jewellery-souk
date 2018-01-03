<?php
class ControllerCheckoutOneClickCheckout extends Controller {
	public function index() {
    $json = $data = array();
    // Assemble the Data
        // 1 - Check for Login
            // If Not Logged In - Redirect to Login Page with alert message.

      if(!$this->customer->isLogged())
      {
        $json['redirect_url'] = ($this->url->link('account/login'));
        $json['alert_msg'] = "Please login to checkout!";
        echo json_encode($json);
        exit;
      }

  // 2 - Checkout Process

      // Get Payment Address
      if (isset($this->session->data['payment_address']['address_id'])) {
  			$data['address_id'] = $this->session->data['payment_address']['address_id'];
  		} else {
  			$data['address_id'] = $this->customer->getAddressId();
  		}

      $this->load->model('account/address');

      // Set Payment Address
      $this->session->data['payment_address'] = $this->model_account_address->getAddress($data['address_id']);
      unset($this->session->data['payment_method']);
      unset($this->session->data['payment_methods']);

      // Get Shipping address
      if (isset($this->session->data['shipping_address']['address_id'])) {
  			$data['address_id'] = $this->session->data['shipping_address']['address_id'];
  		} else {
  			$data['address_id'] = $this->customer->getAddressId();
  		}
      $this->session->data['shipping_address'] = $this->model_account_address->getAddress($data['address_id']);
      unset($this->session->data['shipping_method']);
      unset($this->session->data['shipping_methods']);

      // Get Shipping Methods
      $this->load->model('extension/extension');

			$results = $this->model_extension_extension->getExtensions('shipping');

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('extension/shipping/' . $result['code']);

					$quote = $this->{'model_extension_shipping_' . $result['code']}->getQuote($this->session->data['shipping_address']);

					if ($quote) {
						$method_data[$result['code']] = array(
							'title'      => $quote['title'],
							'quote'      => $quote['quote'],
							'sort_order' => $quote['sort_order'],
							'error'      => $quote['error']
						);
					}
				}
			}

			$sort_order = array();

			foreach ($method_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $method_data);

			$this->session->data['shipping_methods'] = $method_data;

      $shipping = "free.free";
      $shipping = explode(".",$shipping);
      // Save Shipping Methods
      $this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];

      // Get Payment Methods
      // Totals
			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 10;

			// Because __call can not keep var references so we put them into an array.
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);

      $sort_order = array();

			$results = $this->model_extension_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('extension/total/' . $result['code']);

					// We have to put the totals in an array so that they pass by reference.
					$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
				}
			}

			// Payment Methods
			$method_data = array();

			$results = $this->model_extension_extension->getExtensions('payment');

			$recurring = $this->cart->hasRecurringProducts();

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('extension/payment/' . $result['code']);
					$method = $this->{'model_extension_payment_' . $result['code']}->getMethod($this->session->data['payment_address'], 1);

					if ($method) {
						if ($recurring) {
							if (property_exists($this->{'model_extension_payment_' . $result['code']}, 'recurringPayments') && $this->{'model_extension_payment_' . $result['code']}->recurringPayments()) {
								$method_data[$result['code']] = $method;
							}
						} else {
							$method_data[$result['code']] = $method;
						}
					}
				}
			}

			$sort_order = array();

			foreach ($method_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $method_data);

			$this->session->data['payment_methods'] = $method_data;
      // Save Payment Methods
      $this->session->data['payment_method'] = $this->session->data['payment_methods']['cod'];


      // Confirm all Params
      $redirect = false;
      if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
  			$redirect = $this->url->link('checkout/cart');
  		}

      // Validate minimum quantity requirements.
  		$products = $this->cart->getProducts();

  		foreach ($products as $product) {
  			$product_total = 0;

  			foreach ($products as $product_2) {
  				if ($product_2['product_id'] == $product['product_id']) {
  					$product_total += $product_2['quantity'];
  				}
  			}

  			if ($product['minimum'] > $product_total) {
  				$redirect = $this->url->link('checkout/cart');

  				break;
  			}
  		}


      if (!$redirect) {
        $order_data = array();

        $totals = array();
        $taxes = $this->cart->getTaxes();
        $total = 0;

        // Because __call can not keep var references so we put them into an array.
        $total_data = array(
          'totals' => &$totals,
          'taxes'  => &$taxes,
          'total'  => &$total
        );

        $this->load->model('extension/extension');

        $sort_order = array();

        $results = $this->model_extension_extension->getExtensions('total');

        foreach ($results as $key => $value) {
          $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
        }

        array_multisort($sort_order, SORT_ASC, $results);

        foreach ($results as $result) {
          if ($this->config->get($result['code'] . '_status')) {
            $this->load->model('extension/total/' . $result['code']);

            // We have to put the totals in an array so that they pass by reference.
            $this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
          }
        }

        $sort_order = array();

        foreach ($totals as $key => $value) {
          $sort_order[$key] = $value['sort_order'];
        }

        array_multisort($sort_order, SORT_ASC, $totals);

        $order_data['totals'] = $totals;

        $this->load->language('checkout/checkout');

        $order_data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
        $order_data['store_id'] = $this->config->get('config_store_id');
        $order_data['store_name'] = $this->config->get('config_name');

        if ($order_data['store_id']) {
          $order_data['store_url'] = $this->config->get('config_url');
        } else {
          if ($this->request->server['HTTPS']) {
            $order_data['store_url'] = HTTPS_SERVER;
          } else {
            $order_data['store_url'] = HTTP_SERVER;
          }
        }

        if ($this->customer->isLogged()) {
          $this->load->model('account/customer');

          $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());

          $order_data['customer_id'] = $this->customer->getId();
          $order_data['customer_group_id'] = $customer_info['customer_group_id'];
          $order_data['firstname'] = $customer_info['firstname'];
          $order_data['lastname'] = $customer_info['lastname'];
          $order_data['email'] = $customer_info['email'];
          $order_data['telephone'] = $customer_info['telephone'];
          $order_data['fax'] = $customer_info['fax'];
          $order_data['custom_field'] = json_decode($customer_info['custom_field'], true);
        } elseif (isset($this->session->data['guest'])) {
          $order_data['customer_id'] = 0;
          $order_data['customer_group_id'] = $this->session->data['guest']['customer_group_id'];
          $order_data['firstname'] = $this->session->data['guest']['firstname'];
          $order_data['lastname'] = $this->session->data['guest']['lastname'];
          $order_data['email'] = $this->session->data['guest']['email'];
          $order_data['telephone'] = $this->session->data['guest']['telephone'];
          $order_data['fax'] = $this->session->data['guest']['fax'];
          $order_data['custom_field'] = $this->session->data['guest']['custom_field'];
        }

        $order_data['payment_firstname'] = $this->session->data['payment_address']['firstname'];
        $order_data['payment_lastname'] = $this->session->data['payment_address']['lastname'];
        $order_data['payment_company'] = $this->session->data['payment_address']['company'];
        $order_data['payment_address_1'] = $this->session->data['payment_address']['address_1'];
        $order_data['payment_address_2'] = $this->session->data['payment_address']['address_2'];
        $order_data['payment_city'] = $this->session->data['payment_address']['city'];
        $order_data['payment_postcode'] = $this->session->data['payment_address']['postcode'];
        $order_data['payment_zone'] = $this->session->data['payment_address']['zone'];
        $order_data['payment_zone_id'] = $this->session->data['payment_address']['zone_id'];
        $order_data['payment_country'] = $this->session->data['payment_address']['country'];
        $order_data['payment_country_id'] = $this->session->data['payment_address']['country_id'];
        $order_data['payment_address_format'] = $this->session->data['payment_address']['address_format'];
        $order_data['payment_custom_field'] = (isset($this->session->data['payment_address']['custom_field']) ? $this->session->data['payment_address']['custom_field'] : array());

        if (isset($this->session->data['payment_method']['title'])) {
          $order_data['payment_method'] = $this->session->data['payment_method']['title'];
        } else {
          $order_data['payment_method'] = '';
        }

        if (isset($this->session->data['payment_method']['code'])) {
          $order_data['payment_code'] = $this->session->data['payment_method']['code'];
        } else {
          $order_data['payment_code'] = '';
        }

        if ($this->cart->hasShipping()) {
          $order_data['shipping_firstname'] = $this->session->data['shipping_address']['firstname'];
          $order_data['shipping_lastname'] = $this->session->data['shipping_address']['lastname'];
          $order_data['shipping_company'] = $this->session->data['shipping_address']['company'];
          $order_data['shipping_address_1'] = $this->session->data['shipping_address']['address_1'];
          $order_data['shipping_address_2'] = $this->session->data['shipping_address']['address_2'];
          $order_data['shipping_city'] = $this->session->data['shipping_address']['city'];
          $order_data['shipping_postcode'] = $this->session->data['shipping_address']['postcode'];
          $order_data['shipping_zone'] = $this->session->data['shipping_address']['zone'];
          $order_data['shipping_zone_id'] = $this->session->data['shipping_address']['zone_id'];
          $order_data['shipping_country'] = $this->session->data['shipping_address']['country'];
          $order_data['shipping_country_id'] = $this->session->data['shipping_address']['country_id'];
          $order_data['shipping_address_format'] = $this->session->data['shipping_address']['address_format'];
          $order_data['shipping_custom_field'] = (isset($this->session->data['shipping_address']['custom_field']) ? $this->session->data['shipping_address']['custom_field'] : array());

          if (isset($this->session->data['shipping_method']['title'])) {
            $order_data['shipping_method'] = $this->session->data['shipping_method']['title'];
          } else {
            $order_data['shipping_method'] = '';
          }

          if (isset($this->session->data['shipping_method']['code'])) {
            $order_data['shipping_code'] = $this->session->data['shipping_method']['code'];
          } else {
            $order_data['shipping_code'] = '';
          }
        } else {
          $order_data['shipping_firstname'] = '';
          $order_data['shipping_lastname'] = '';
          $order_data['shipping_company'] = '';
          $order_data['shipping_address_1'] = '';
          $order_data['shipping_address_2'] = '';
          $order_data['shipping_city'] = '';
          $order_data['shipping_postcode'] = '';
          $order_data['shipping_zone'] = '';
          $order_data['shipping_zone_id'] = '';
          $order_data['shipping_country'] = '';
          $order_data['shipping_country_id'] = '';
          $order_data['shipping_address_format'] = '';
          $order_data['shipping_custom_field'] = array();
          $order_data['shipping_method'] = '';
          $order_data['shipping_code'] = '';
        }

        $order_data['products'] = array();

        foreach ($this->cart->getProducts() as $product) {
          $option_data = array();

          foreach ($product['option'] as $option) {
            $option_data[] = array(
              'product_option_id'       => $option['product_option_id'],
              'product_option_value_id' => $option['product_option_value_id'],
              'option_id'               => $option['option_id'],
              'option_value_id'         => $option['option_value_id'],
              'name'                    => $option['name'],
              'value'                   => $option['value'],
              'type'                    => $option['type']
            );
          }

          $order_data['products'][] = array(
            'product_id' => $product['product_id'],
            'name'       => $product['name'],
            'model'      => $product['model'],
            'option'     => $option_data,
            'download'   => $product['download'],
            'quantity'   => $product['quantity'],
            'subtract'   => $product['subtract'],
            'price'      => $product['price'],
            'total'      => $product['total'],
            'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
            'reward'     => $product['reward']
          );
        }

        // Gift Voucher
        $order_data['vouchers'] = array();

        $order_data['comment'] = '';
        $order_data['total'] = $total_data['total'];

        $order_data['affiliate_id'] = 0;
        $order_data['commission'] = 0;
        $order_data['marketing_id'] = 0;
        $order_data['tracking'] = '';

        $order_data['language_id'] = $this->config->get('config_language_id');
        $order_data['currency_id'] = $this->currency->getId($this->session->data['currency']);
        $order_data['currency_code'] = $this->session->data['currency'];
        $order_data['currency_value'] = $this->currency->getValue($this->session->data['currency']);
        $order_data['ip'] = $this->request->server['REMOTE_ADDR'];

        if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
          $order_data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
        } elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
          $order_data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
        } else {
          $order_data['forwarded_ip'] = '';
        }

        if (isset($this->request->server['HTTP_USER_AGENT'])) {
          $order_data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];
        } else {
          $order_data['user_agent'] = '';
        }

        if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
          $order_data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];
        } else {
          $order_data['accept_language'] = '';
        }

        $this->load->model('checkout/order');

        $this->session->data['order_id'] = $this->model_checkout_order->addOrder($order_data);

        $data['text_recurring_item'] = $this->language->get('text_recurring_item');
        $data['text_payment_recurring'] = $this->language->get('text_payment_recurring');

        $data['column_name'] = $this->language->get('column_name');
        $data['column_model'] = $this->language->get('column_model');
        $data['column_quantity'] = $this->language->get('column_quantity');
        $data['column_price'] = $this->language->get('column_price');
        $data['column_total'] = $this->language->get('column_total');

        $this->load->model('tool/upload');

        $data['products'] = array();

        foreach ($this->cart->getProducts() as $product) {
          $option_data = array();

          foreach ($product['option'] as $option) {
            if ($option['type'] != 'file') {
              $value = $option['value'];
            } else {
              $upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

              if ($upload_info) {
                $value = $upload_info['name'];
              } else {
                $value = '';
              }
            }

            $option_data[] = array(
              'name'  => $option['name'],
              'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
            );
          }

          $recurring = '';

          $data['products'][] = array(
            'cart_id'    => $product['cart_id'],
            'product_id' => $product['product_id'],
            'name'       => $product['name'],
            'model'      => $product['model'],
            'option'     => $option_data,
            'recurring'  => $recurring,
            'quantity'   => $product['quantity'],
            'subtract'   => $product['subtract'],
            'price'      => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']),
            'total'      => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'], $this->session->data['currency']),
            'href'       => $this->url->link('product/product', 'product_id=' . $product['product_id'])
          );
        }

        // Gift Voucher
        $data['vouchers'] = array();

        $data['totals'] = array();

        foreach ($order_data['totals'] as $total) {
          $data['totals'][] = array(
            'title' => $total['title'],
            'text'  => $this->currency->format($total['value'], $this->session->data['currency'])
          );
        }

        if ($this->session->data['payment_method']['code'] == 'cod')
        {
    			$this->load->model('checkout/order');

    			$this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $this->config->get('cod_order_status_id'));
    		}
      }
    // Re-Direct to Success

    if(isset($this->session->data['order_id']) && !empty($this->session->data['order_id']))
    {
      // Redirect to Success
      $json['redirect_url'] = ($this->url->link('checkout/success','&order_id='.$this->session->data['order_id']));
      $json['alert_msg'] = "Thank You for showing Interest in these Products, the respective Seller(s) will get in touch with you soon!";

      echo json_encode($json);
      exit;
    }else {
      // Error in order generation
      $json['redirect_url'] = ($this->url->link('checkout/cart'));
      $json['alert_msg'] = "There seems to be some issue with the Products, can you please contact our support via email!";

      echo json_encode($json);
      exit;
    }
	}

  public function sellerEmail()
  {
      if(isset($this->request->get['order_id']))
      {
        // Send emails to respective sellers.
        $sql_seller = " SELECT p.model, pd.name,p.price,
                         p.seller_id as seller_id
                          FROM product p
                                 LEFT JOIN product_description pd
                                        ON ( pd.product_id = p.product_id )
                                 LEFT JOIN order_product op
                                        ON ( p.product_id = op.product_id )
                          WHERE  op.order_id = ".$this->request->get['order_id']."
                          AND pd.language_id = 1";
        $rw = $this->db->query($sql_seller);
        $results = array();
        if($rw->rows)
        {
            foreach ($rw->rows as $row)
            {
              $results[$row['seller_id']][] = $row;
            }
        }
        $sql_customer = "SELECT CONCAT(firstname,' ', lastname) as customer_name, email as customer_email, telephone as customer_telephone FROM `order` WHERE order_id = {$this->request->get['order_id']}";
        $rw = $this->db->query($sql_customer);
        $data = $c_info = $rw->row;

        if(!empty($results))
        {
          foreach($results as $result => $obj)
          {
            $sellerId = $result;
            foreach ($obj as $ob)
            {
              $data['products'][] = array('name'=>$ob['name'],'model'=>$ob['model'],'price'=>$ob['price']);
            }
            $this->load->model('seller/seller');
            $data['seller_name'] = $this->model_seller_seller->getSellerName($sellerId);
            $data['seller_email'] = $this->model_seller_seller->getSellerEmail($sellerId);
            $data['web_name'] = $this->config->get('config_name');

            // Send an HTML email
            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
            $mail->smtp_username = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

            $mail->setTo($data['seller_email']);
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender(html_entity_decode($data['web_name'], ENT_QUOTES, 'UTF-8'));
            $mail->setSubject(html_entity_decode("Hi, A Customer is interested in your Product!", ENT_QUOTES, 'UTF-8'));
            $mail->setHtml($this->load->view('mail/seller/seller_order', $data));
            $mail->send();
          }
        }

      }
  }
}
