<?php
class ModelSellerSeller extends Model {
    public function addSeller($data) {

        // Check for seller_type
        if(isset($data['seller_type'])) {
            if($data['seller_type'] == 'company') {
                $firstname = $data['company_p_firstname'];
                $lastname = $data['company_p_lastname'];

            } else if($data['seller_type'] == 'individual') {
                $firstname = $data['firstname'];
                $lastname = $data['lastname'];

            }
        }

        // By-Default 'Others' is the User Group for any new Seller
        $data['user_group'] = 'others';
        $data['user_group_id'] = 0;
        // Check for Category to determine which user_group to choose
        $associativeUG = array('manufacturer' => array('jewellery_manufacturer'), 'wholeseller' => array('jewellery_wholeseller'), 'retailer' => array('jewellery_retailer'), 'service' => array('jewellery_institute','cam_processing'), 'others' => array('others'), 'freelance' => array('freelancer'), 'used_item_seller' => array('used_machinery_seller'), 'diamond_seller' => array('diamond_seller'), 'gemstone_seller' => array('gemstone_seller'),'tools_&_machinery' => array('tools_&_machinery'));

        foreach($associativeUG as $user_group => $possibleCategories) {
          if(in_array($data['category'], $possibleCategories)) {
            $data['user_group'] = str_replace('_', ' ', $user_group);
          }
        }

        $query_ug = $this->db->query("SELECT ug.user_group_id FROM " . DB_PREFIX . "user_group AS ug WHERE LOWER(ug.name) LIKE '{$data['user_group']}' ");
        if($this->db->countAffected() > 0) {
          $data['user_group_id'] = $query_ug->row['user_group_id'];
        }

        if(empty($data['image'])) {
            $imageUrl = "https://www.gravatar.com/avatar/".md5(strtolower(trim($data['email'])))."?s=348&d=robohash";
        } else {
            $imageUrl = HTTPS_SERVER . $data['image'];
        }

        $this->db->query("INSERT INTO " . DB_PREFIX . "user SET username = '" . $this->db->escape($data['username']) . "', user_group_id = '". (int)$data['user_group_id'] ."', firstname = '" . $this->db->escape($firstname) . "', lastname = '" . $this->db->escape($lastname) . "', email = '" . $this->db->escape($data['email']) . "', salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "',  ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', `image` = '".$this->db->escape($imageUrl)."', status = '0',  date_added = NOW()");

        $seller_id = $this->db->getLastId();

        $ignore = ['username', 'firstname', 'lastname', 'email', 'password', 'confirm', 'agree'];
        // Add the Additional Info to Seller Info Table
        foreach($data as $dt => $dv) {
            if(!in_array($dt, $ignore)) {
              $this->db->query("INSERT INTO " . DB_PREFIX . "seller_info SET user_id = '{$seller_id}', `key` = '". $this->db->escape($dt) ."' , `value` = '". $this->db->escape($dv) ."' ;");
            }
        }

        // Make Image Folder for User
        $this->makeImageFolder($seller_id);

        // Trigger Registration/Welcome email to Seller
        $this->sendWelcomeEmailToSeller($seller_id);

        return $seller_id;
    }

    protected function makeImageFolder($seller_id) {
      $directory = DIR_IMAGE .'/catalog/seller';
      $folder = "sez_{$seller_id}";
      mkdir($directory . '/' . $folder, 0777);
      chmod($directory . '/' . $folder, 0777);

      @touch($directory . '/' . $folder . '/' . 'index.html');

    }

    protected function sendWelcomeEmailToSeller($seller_id) {

      $seller_data = $this->getSellerById($seller_id);

      $data['web_url'] = HTTPS_SERVER . "/";
      $data['logo_url'] = HTTPS_SERVER . "image/" .$this->config->get('config_logo');
      $data['subject'] = "Welcome to ".$this->config->get('config_name')."!" ;
      $data['firstname'] = $seller_data['firstname'];
      $data['username'] = $seller_data['username'];
      $data['to_email'] = $seller_data['email'];
      $data['web_name'] = $this->config->get('config_name');
      $data['action_url'] = $this->url->link('seller/payment_process', 'uID=' . base64_encode($seller_id), true);
      $data['login_url'] = $this->url->link('seller/login','',true);
      $data['ip_address'] = $this->request->server['REMOTE_ADDR'];
      $data['support_email'] = 'seller.support@sezplus.com';

      // Send an HTML email
      $mail = new Mail();
      $mail->protocol = $this->config->get('config_mail_protocol');
      $mail->parameter = $this->config->get('config_mail_parameter');
      $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
      $mail->smtp_username = $this->config->get('config_mail_smtp_username');
      $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
      $mail->smtp_port = $this->config->get('config_mail_smtp_port');
      $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

      $mail->setTo($data['to_email']);

      $mail->setFrom($this->config->get('config_email'));
      $mail->setSender(html_entity_decode($data['web_name'], ENT_QUOTES, 'UTF-8'));
      $mail->setSubject(html_entity_decode($data['subject'], ENT_QUOTES, 'UTF-8'));
      $mail->setHtml($this->load->view('mail/seller/register', $data));

      $mail->send();

      // Send a text email to other stakeholders
      if(!empty($this->config->get('config_mail_alert_email'))) {
          $bccMsgHtml = "Hi, <br/> New Seller registered! <br/> Seller E-Mail: {$data['username']} <br/> Thanks!";
          $mail = new Mail();
          $mail->protocol = $this->config->get('config_mail_protocol');
          $mail->parameter = $this->config->get('config_mail_parameter');
          $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
          $mail->smtp_username = $this->config->get('config_mail_smtp_username');
          $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
          $mail->smtp_port = $this->config->get('config_mail_smtp_port');
          $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
          $mail->setTo($this->config->get('config_mail_alert_email'));
          $mail->setFrom($this->config->get('config_email'));
          $mail->setSender(html_entity_decode($data['web_name'], ENT_QUOTES, 'UTF-8'));
          $mail->setSubject(html_entity_decode("New Seller | {$data['web_name']}", ENT_QUOTES, 'UTF-8'));
          $mail->setHtml($bccMsgHtml);
          $mail->send();
      }
      
    }

    public function addPaymentInfo($data) {
        $this->db->query("INSERT into " . DB_PREFIX . "seller_payments (user_id,amount,payment_date,payment_status,payment_id,extra_data)
                            VALUES
                            ('{$data['seller_id']}','{$data['amount']}','".date('Y-m-d')."','{$data['order_status']}','{$data['tracking_id']}','".json_encode($data)."') ");

    }

    public function getSellerById($uID) {
      $sql = "SELECT u.username, u.firstname, u.lastname, u.email, ug.user_group_id, ug.name as user_group_name, ug.permission, u.image FROM " . DB_PREFIX . "user AS u LEFT OUTER JOIN user_group ug ON (ug.user_group_id = u.user_group_id) WHERE u.user_id = '{$uID}' ";
      $query = $this->db->query($sql);

      $retArr = $query->row;

      $sql_info = "SELECT si.key, si.value FROM " . DB_PREFIX . "seller_info AS si WHERE si.user_id = '{$uID}' ";
      $query_info = $this->db->query($sql_info);

      foreach ($query_info->rows as $row) {
        $retArr[$row['key']] = $row['value'];
      }

      return $retArr;
    }

    public function approveSeller($seller_id) {
        $this->db->query("UPDATE " . DB_PREFIX . "user SET status = '1'  WHERE user_id = '{$seller_id}' ");
    }

    public function getSellerEmail($user_id) {
        $q = $this->db->query("SELECT email FROM " . DB_PREFIX . "user WHERE user_id = '{$user_id}'");
        return $q->row['email'];
    }

    public function getSellerName($user_id,$full_name=false) {
        $str = "firstname";
        if($full_name)
        {
          $str = "CONCAT(firstname,' ',lastname)";
        }
        $q = $this->db->query("SELECT {$str} as `name` FROM " . DB_PREFIX . "user WHERE user_id = '{$user_id}'");
        return $q->row['name'];
    }

    public function emailPaymentReceipt($postData) {
        $seller_data = $this->getSellerById($postData['seller_id']);

        $data['order_status'] = $data['payment_status'] = strtolower($postData['order_status']);
        $data['web_url'] = HTTPS_SERVER . "/";
        $data['logo_url'] = HTTPS_SERVER . "image/" .$this->config->get('config_logo');
        $data['to_email'] = $seller_data['email'];
        $data['web_name'] = $this->config->get('config_name');

        $data['support_email'] = 'seller.support@sezplus.com';

        $mail = new Mail();
        $mail->protocol = $this->config->get('config_mail_protocol');
        $mail->parameter = $this->config->get('config_mail_parameter');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->smtp_username = $this->config->get('config_mail_smtp_username');
        $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mail->smtp_port = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
        $mail->setTo($data['to_email']);
        $mail->setFrom($this->config->get('config_email'));
        $mail->setSender(html_entity_decode($data['web_name'], ENT_QUOTES, 'UTF-8'));

        if(strtolower($data['order_status']) == "success") {
            // Payment Recieved
            $data['subject'] = "Seller Payment Success | {$data['web_name']}";
            $data['receipt_id'] = $postData['payment_id'];
            $data['date'] = date('d-m-Y');
            $data['description'] = "Seller Subscription Fees";
            $data['amount'] = $postData['amount'];
            $data['total'] = $postData['amount'];
            $data['firstname'] = $seller_data['firstname'];
            $data['username'] = $seller_data['username'];
            $data['login_url'] = $this->url->link('seller/login', '', true);
            $mail->setSubject(html_entity_decode($data['subject'], ENT_QUOTES, 'UTF-8'));
            $mail->setHtml($this->load->view('mail/seller/payment_receipt', $data));

        } else {
            // Payment Issue ** NOT Recieved **
            $data['subject'] = "Seller Payment Failed | {$data['web_name']}";
            $data['payment_resume_url'] = $this->url->link('seller/payment_process', 'uID=' . base64_encode($postData['user_id']), true);
            $mail->setSubject(html_entity_decode($data['subject'], ENT_QUOTES, 'UTF-8'));
            $mail->setHtml($this->load->view('mail/seller/payment_failed', $data));
        }

        $mail->send();
    }

    public function getUserByUsername($username) {
      $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE LOWER(username) = '" . $this->db->escape(utf8_strtolower($username)) . "'");

      return $query->row;
    }

    public function checkForEmail($email) {
        $query = $this->db->query("SELECT user_id FROM " . DB_PREFIX . "user WHERE email LIKE '" . $this->db->escape($email) . "'");

        return $query->rows;
    }

    public function checkForUsername($username) {
        $query = $this->db->query("SELECT user_id FROM " . DB_PREFIX . "user WHERE LOWER(username) LIKE '" . $this->db->escape(utf8_strtolower($username)) . "'");

        return $query->rows;
    }

    public function getSubscriptionFeesByUserGroup($userGroupId) {
      $query = $this->db->query("SELECT subscription_fees FROM " . DB_PREFIX . "user_group WHERE user_group_id = '" . (int)$userGroupId . "'");

      return $query->row['subscription_fees'];
    }

    public function getAllSellerPricingForUI() {
      $retArr = array();
      $query = $this->db->query("SELECT name, subscription_fees AS fees FROM " . DB_PREFIX . "user_group WHERE LOWER(name) NOT LIKE 'administrator' AND LOWER(name) NOT LIKE 'moderator' ");

      foreach($query->rows as $row) {
        $retArr[] = $row;
      }

      return $retArr;
    }

    public function sendNoPayWelcomeEmail($userId) {
      $data = [];
      $seller_data = $this->getSellerById($userId);

      $data['web_url'] = HTTPS_SERVER . "/";
      $data['logo_url'] = HTTPS_SERVER . "image/" .$this->config->get('config_logo');
      $data['to_email'] = $seller_data['email'];
      $data['web_name'] = $this->config->get('config_name');
      $data['firstname'] = $seller_data['firstname'];
      $data['username'] = $seller_data['username'];
      $data['login_url'] = $this->url->link('seller/login', '', true);
      $data['support_email'] = 'seller.support@sezplus.com';
      $data['subject'] = "Get Started {$data['firstname']} | {$data['web_name']}";

      $mail = new Mail();
      $mail->protocol = $this->config->get('config_mail_protocol');
      $mail->parameter = $this->config->get('config_mail_parameter');
      $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
      $mail->smtp_username = $this->config->get('config_mail_smtp_username');
      $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
      $mail->smtp_port = $this->config->get('config_mail_smtp_port');
      $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
      $mail->setTo($data['to_email']);
      $mail->setFrom($this->config->get('config_email'));
      $mail->setSender(html_entity_decode($data['web_name'], ENT_QUOTES, 'UTF-8'));
      $mail->setSubject(html_entity_decode($data['subject'], ENT_QUOTES, 'UTF-8'));
      $mail->setHtml($this->load->view('mail/seller/nopay_welcome', $data));

      $mail->send();

    }

    public function getMostViewedProductsOfSeller($data) {
        $sql = "SELECT p.product_id, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special";

        $sql .= " FROM " . DB_PREFIX . "product p";

        $sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

        $sql .= " AND p.seller_id = '". (int) $data['seller_id']."' ";

        $sql .= " GROUP BY p.product_id";

        $sql .= " ORDER BY p.viewed DESC";

        if (isset($data['limit'])) {

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " .(int)$data['limit'];
        }

        $product_data = array();

        $query = $this->db->query($sql);

        $this->load->model('catalog/product');
        foreach ($query->rows as $result) {
            $product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
        }

        return $product_data;
    }

    public function formatData($data) {

        $retArr = array();

        $this->load->model('localisation/country');

        switch ($data['seller_type']) {

            case 'individual':
                $retArr['name'] = $data['firstname'].' '.$data['lastname'];
                $retArr['email'] = $data['email'];
                $retArr['contact_person'] = $retArr['name'];
                $retArr['seller_type'] = 'Individual';
                break;

            case 'company':
                $retArr['name'] = $data['company_name'];
                $retArr['email'] = $data['email'];
                $retArr['contact_person'] = $data['company_p_firstname'].' '.$data['company_p_lastname'];
                $retArr['seller_type'] = 'Company';
                break;

        }

        $retArr['category'] = $data['user_group_name'];
        $retArr['postcode'] = $data['postcode'];
        $retArr['city'] = $data['city'];
        $retArr['country_info'] = $this->model_localisation_country->getCountry($data['country_id']);
        $retArr['telephone'] = $data['telephone'];
        if(isset($data['address_1']) && !empty($data['address_1'])) {
            $retArr['address'] = $data['address_1'] ." ".$data['address_2'];
        }

        if(empty($data['image'])) {
            $retArr['img'] = "https://www.gravatar.com/avatar/".md5(strtolower(trim($retArr['email'])))."?s=348&d=robohash";
        } else {
            $retArr['img'] = $data['image'];
        }

        return $retArr;
    }

}
