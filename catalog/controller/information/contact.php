<?php
class ControllerInformationContact extends Controller {

    public function index()
    {
        $this->load->language('information/contact');

        $this->document->setTitle($this->language->get('heading_title'));

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
          'text' => $this->language->get('text_home'),
          'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
          'text' => $this->language->get('text_contact'),
          'href' => $this->url->link('information/contact', '', true)
        );

        $data['error_warning'] = "";
        $data['success'] = "";


        // Form-Post Request -- Trigger email to Seller.Support & bcc to gmail
        if (($this->request->server['REQUEST_METHOD'] == 'POST'))
        {

          $subject =  "Contact Us Data | SEZPLUS";

    			$message  = "Howdy!" . "\n\n";
    			$message .= "-- Form-Data Below --"  . "\n\n";
          $message .= "Full Name:"." ".$this->request->post['name'] . "\n\n";
          $message .= "Telephone:"." ".$this->request->post['telephone'] . "\n\n";
          $message .= "E-Mail:"." ".$this->request->post['email'] . "\n\n";
          $message .= "Query:"." ".$this->request->post['query'] . "\n\n";
          $message .= "-- Form-Data Ends --" . "\n\n";

          $mail = new Mail();
          $mail->protocol = $this->config->get('config_mail_protocol');
          $mail->parameter = $this->config->get('config_mail_parameter');
          $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
          $mail->smtp_username = $this->config->get('config_mail_smtp_username');
          $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
          $mail->smtp_port = $this->config->get('config_mail_smtp_port');
          $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

          //$mail->setTo('support@sezplus.com');
          $mail->setTo('rohit.rishi14@gmail.com');
          $mail->setFrom($this->config->get('config_email'));
          $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
          $mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
    			$mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
          $mail->send();

          $data['success'] = "We've recieved your query, our team will contact you shortly!";
        }

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_email'] = $this->language->get('entry_email');
        $data['entry_number'] = $this->language->get('entry_number');
        $data['entry_query'] = $this->language->get('entry_query');
        $data['button_send'] = $this->language->get('button_send');

        // Captcha
        if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('register', (array)$this->config->get('config_captcha_page'))) {
            $data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'), $this->error);
        } else {
            $data['captcha'] = '';
        }

        $data['action'] = $this->url->link('information/contact', '', true);

        $data['heading_title'] = $this->language->get('heading_title');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('information/contact', $data));
    }

}
