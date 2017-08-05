<?php
class ModelSellerSeller extends Model {
    public function addSeller($data) {

        // Check for seller_type
        if(isset($data['seller_type']))
        {
            if($data['seller_type'] == 'company')
            {
                $firstname = $data['company_p_firstname'];
                $lastname = $data['company_p_lastname'];

            }else if($data['seller_type'] == 'individual')
            {
                $firstname = $data['firstname'];
                $lastname = $data['lastname'];

            }
        }

        $this->db->query("INSERT INTO " . DB_PREFIX . "user SET username = '" . $this->db->escape($data['username']) . "', firstname = '" . $this->db->escape($firstname) . "', lastname = '" . $this->db->escape($lastname) . "', email = '" . $this->db->escape($data['email']) . "', salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "',  ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', status = '0',  date_added = NOW()");

        $seller_id = $this->db->getLastId();

        $ignore = ['username', 'firstname', 'lastname', 'email', 'password','confirm','agree'];
        // Add the Additional Info to Seller Info Table
        foreach($data as $dt => $dv)
        {
            if(!in_array($dt, $ignore))
            {
              $this->db->query("INSERT INTO " . DB_PREFIX . "seller_info SET user_id = '{$seller_id}', `key` = '". $this->db->escape($dt) ."' , `value` = '". $this->db->escape($dv) ."' ;");
            }
        }

        return $seller_id;
    }


    public function addPaymentInfo($data)
    {
        $this->db->query("INSERT into " . DB_PREFIX . "seller_payments (user_id,amount,status,payment_id,extra_data)
                            VALUES
                            ('{$data['user_id']}','{$data['amount']}','{$data['order_status']}','{$data['tracking_id']}','".json_encode($data)."') ");

    }

    public function getSellerById($uID)
    {
      $retArr = array();

      $sql = "SELECT u.username, u.firstname, u.lastname, u.email, ug.user_group_id, ug.name as user_group_name, ug.permission FROM " . DB_PREFIX . "user AS u LEFT OUTER JOIN user_group ug ON (ug.user_group_id = u.user_group_id) WHERE u.user_id = '{$uID}' ";
      $query = $this->db->query($sql);

      $retArr = $query->row;

      $sql_info = "SELECT si.key, si.value FROM " . DB_PREFIX . "seller_info AS si WHERE si.user_id = '{$uID}' ";
      $query_info = $this->db->query($sql_info);

      foreach ($query_info->rows as $row) {
        $retArr[$row['key']] = $row['value'];
      }

      return $retArr;
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

    public function getUserByUsername($username)
    {
      $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE LOWER(username) = '" . $this->db->escape(utf8_strtolower($username)) . "'");

      return $query->row;
    }

    public function checkForEmail($email)
    {
        $query = $this->db->query("SELECT user_id FROM " . DB_PREFIX . "user WHERE email LIKE '" . $this->db->escape($email) . "'");

        return $query->rows;
    }

    public function checkForUsername($username)
    {
        $query = $this->db->query("SELECT user_id FROM " . DB_PREFIX . "user WHERE LOWER(username) LIKE '" . $this->db->escape(utf8_strtolower($username)) . "'");

        return $query->rows;
    }

}
