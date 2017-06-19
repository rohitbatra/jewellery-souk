<?php
class ModelAccountSeller extends Model {
    public function addSeller($data) {

        $this->db->query("INSERT INTO " . DB_PREFIX . "user SET user_group_id = '11', username = '" . $this->db->escape($data['username']) . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "',  ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', status = '0',  date_added = NOW()");

        $seller_id = $this->db->getLastId();

        // update Seller_details table for bank details.
        $sql_seller_details = "INSERT INTO " . DB_PREFIX . "seller_details (user_id, phone, address, bank_name, bank_account_number, bank_branch, bank_payee_name, bank_ifsc_code, comments)
                                VALUES( '{$seller_id}', '".$this->db->escape($data['telephone'])."', '', '".$this->db->escape($data['bank_name'])."','".$this->db->escape($data['bank_account_number'])."','".$this->db->escape($data['bank_branch'])."','".$this->db->escape($data['bank_payee_name'])."','".$this->db->escape($data['bank_ifsc_code'])."', '') ;";
        $this->db->query($sql_seller_details);

        return $seller_id;
    }


    public function addPaymentInfo($data)
    {
        $this->db->query("INSERT into " . DB_PREFIX . "seller_payment_status (user_id,amount,status,payment_id,extra_data) 
                            VALUES 
                            ('{$data['user_id']}','{$data['amount']}','{$data['order_status']}','{$data['tracking_id']}','".json_encode($data)."') ");
        
    }
    
    public function approveSeller($data)
    {
        $this->db->query("UPDATE " . DB_PREFIX . "user SET status = '1'  WHERE user_id = '{$data['user_id']}' ");
    }

    public function getSellerEmail($user_id)
    {
        $q = $this->db->query("SELECT email FROM " . DB_PREFIX . "user WHERE user_id = '{$user_id}'");
        return $q->row['email'];
    }

    public function sendEmail($data)
    {

        $this->load->language('mail/seller');

        if($data['order_status'] == "Success")
        {
            $subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

            $message = sprintf($this->language->get('text_welcome'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')) . "\n\n";

            $message .= $this->language->get('text_login') . "\n";
            $message .= $this->url->link('account/seller/login', '', true) . "\n\n";
            $message .= $this->language->get('text_services') . "\n\n";
            $message .= $this->language->get('text_thanks') . "\n";
            $message .= html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');

        }else{
            $subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

            $message = sprintf($this->language->get('text_welcome_error'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')) . "\n\n";

            $message .= $this->language->get('text_login_error') . "\n";
            $message .= $this->url->link('account/seller/login', '', true) . "\n\n";
            $message .= $this->language->get('text_services') . "\n\n";
            $message .= $this->language->get('text_thanks') . "\n";
            $message .= html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');

        }

        $sellerEmail = $this->getSellerEmail($data['user_id']);

        $mail = new Mail();
        $mail->protocol = $this->config->get('config_mail_protocol');
        $mail->parameter = $this->config->get('config_mail_parameter');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->smtp_username = $this->config->get('config_mail_smtp_username');
        $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mail->smtp_port = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

        $mail->setTo($sellerEmail);
        $mail->setFrom($this->config->get('config_email'));
        $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
        $mail->setSubject($subject);
        $mail->setText($message);
        $mail->send();

        // Send to main admin email if new account email is enabled
        if (in_array('account', (array)$this->config->get('config_mail_alert'))) {
            $message  = $this->language->get('text_signup') . "\n\n";
            $message .= $this->language->get('text_website') . ' ' . html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8') . "\n";
            $message .= $this->language->get('text_firstname') . ' ' . $data['billing_name'] . "\n";
            $message .= $this->language->get('text_userid') . ' ' . $data['user_id'] . "\n";
            //$message .= $this->language->get('text_lastname') . ' ' . $data['user_id'] . "\n";
            $message .= "Seller User \n";
            //$message .= $this->language->get('text_email') . ' '  .  $data['email'] . "\n";
            //$message .= $this->language->get('text_telephone') . ' ' . $data['telephone'] . "\n";

            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
            $mail->smtp_username = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

            $mail->setTo($this->config->get('config_email'));
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
            $mail->setSubject(html_entity_decode($this->language->get('text_new_customer'), ENT_QUOTES, 'UTF-8'));
            $mail->setText($message);
            $mail->send();

            // Send to additional alert emails if new account email is enabled
            $emails = explode(',', $this->config->get('config_alert_email'));

            foreach ($emails as $email) {
                if (utf8_strlen($email) > 0 && filter_var($email, FILTER_VALIDATE_EMAIL)) {
                    $mail->setTo($email);
                    $mail->send();
                }
            }
        }
    }
}
