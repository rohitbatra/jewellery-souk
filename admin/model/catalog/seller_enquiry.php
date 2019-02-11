<?php
class ModelCatalogSellerEnquiry extends Model {

    public function getEnquiry($enquiry_id) {
        $query = $this->db->query("SELECT se.* FROM `" . DB_PREFIX . "seller_enquiries` AS se WHERE se.id = '". (int)$enquiry_id."'");

        return $query->row;
    }

    public function getTotalEnquiries($data = array()) {
        $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "seller_enquiries AS se WHERE se.sender_email NOT LIKE '' ";

        if (!empty($data['filter_seller'])) {
            $sql .= " AND se.seller_id = '" . (int)$data['filter_seller'] . "'";
        }

        if (isset($data['filter_enquiry_status']) && !is_null($data['filter_enquiry_status'])) {
            $sql .= " AND se.read_by_seller = '" . $data['filter_enquiry_status'] . "'";
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function getEnquiriesList($data = array()) {
        $sql = "SELECT se.id as enquiry_id, se.seller_id, se.sender_name, se.read_by_seller, se.dataTime as enquiry_date, u.username as seller_username  FROM " . DB_PREFIX . "seller_enquiries AS se LEFT JOIN `" . DB_PREFIX . "user` u ON (u.user_id = se.seller_id) WHERE se.sender_email NOT LIKE ''  ";

        if (!empty($data['filter_seller'])) {
            $sql .= " AND se.seller_id = '" . (int)$data['filter_seller'] . "'";
        }

        if (isset($data['filter_enquiry_status']) && !is_null($data['filter_enquiry_status'])) {
            $sql .= " AND se.read_by_seller = '" . $data['filter_enquiry_status'] . "'";
        }

        $sql .= " ORDER BY dataTime DESC";

        $query = $this->db->query($sql);

        return $query->rows;
    }


    public function sendReplyToEnquirer($data) {

        // Get Seller Id & Product Name from DB Query
        $enquiry_info = $this->getEnquiry($data['enquiry_id']);

        $data['seller_id'] = $enquiry_info['seller_id'];
        $this->load->model('seller/seller');
        $seller_info = $this->model_seller_seller->getSellerDetails($data['seller_id']);
        $seller_data = $this->model_seller_seller->formatData($seller_info);

        $data['seller_href'] = HTTPS_CATALOG. 'index.php?route=seller/profile&seller='.base64_encode($data['seller_id']);
        $data['seller_name'] = ucwords($seller_data['name']);

        $data['web_name'] = $this->config->get('config_name');
        $data['support_email'] = "support@sezplus.com";

        $data['web_url'] = HTTPS_CATALOG . "/";
        $data['logo_url'] = HTTPS_CATALOG . "image/" .$this->config->get('config_logo');

        $data['enquirer_name'] = $enquiry_info['sender_name'];
        $data['enquiry_content'] = $enquiry_info['content'];
        $data['enquiry_response'] = $enquiry_info['reply_content'];

        // Send an HTML email
        $mail = new Mail();
        $mail->protocol = $this->config->get('config_mail_protocol');
        $mail->parameter = $this->config->get('config_mail_parameter');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->smtp_username = 'enquiries@sezplus.com';
        $mail->smtp_password = html_entity_decode('Sezplus@12345%', ENT_QUOTES, 'UTF-8');
        $mail->smtp_port = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

        $mail->setTo($enquiry_info['sender_email']);
        $mail->setFrom("enquiries@sezplus.com");
        $mail->setSender(html_entity_decode($data['web_name'].' Enquiries', ENT_QUOTES, 'UTF-8'));
        $mail->setSubject(html_entity_decode("Response of your Enquiry!", ENT_QUOTES, 'UTF-8'));
        $mail->setHtml($this->load->view('mail/seller/seller_enquiry_response', $data));
        $mail->send();

    }

    public function markEnquiryAsRead($enquiry_id) {
        $result = $this->db->query("SELECT `id` FROM `".DB_PREFIX."seller_enquiries` WHERE `id` = '{$enquiry_id}' AND `read_by_seller` = '1' ");
        if($result->num_rows == 0) {
            // Update Query
            $this->db->query("UPDATE `".DB_PREFIX."seller_enquiries` SET `read_by_seller` = '1', `read_dataTime` = '".date('Y-m-d H:i:s')."' WHERE `id` = '{$enquiry_id}' ");
        }
    }

    public function saveReplyToDb($data) {
        $this->db->query("UPDATE `".DB_PREFIX."seller_enquiries` SET `reply_content` = '".$this->db->escape($data['reply_content'])."', `reply_dataTime` = '".date('Y-m-d H:i:s')."' WHERE `id` = '{$data['enquiry_id']}' ");
    }

}