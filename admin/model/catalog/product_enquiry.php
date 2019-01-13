<?php
class ModelCatalogProductEnquiry extends Model {

    public function getEnquiry($enquiry_id) {
        $query = $this->db->query("SELECT pe.*, pd.name as product_name, p.seller_id FROM `" . DB_PREFIX . "product_enquiries` AS pe LEFT JOIN " . DB_PREFIX . "product_description pd ON (pd.product_id = pe.product_id) LEFT JOIN " . DB_PREFIX . "product p ON (p.product_id = pe.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pe.id = '". (int)$enquiry_id."'");

        return $query->row;
    }

    public function getTotalEnquiries($data = array()) {
        $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_enquiries AS pe LEFT JOIN " . DB_PREFIX . "product_description pd ON (pe.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product p ON (pe.product_id = p.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

        if (!empty($data['filter_product'])) {
            $sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_product']) . "%'";
        }

        if (!empty($data['filter_seller'])) {
            $sql .= " AND p.seller_id = '" . (int)$data['filter_seller'] . "'";
        }

        if (isset($data['filter_enquiry_status']) && !is_null($data['filter_enquiry_status'])) {
            $sql .= " AND pe.read_by_seller = '" . $data['filter_enquiry_status'] . "'";
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function getEnquiriesList($data = array()) {
        $sql = "SELECT pe.id as enquiry_id, pe.product_id, pd.name as product_name, pe.sender_name, pe.read_by_seller, pe.dataTime as enquiry_date  FROM " . DB_PREFIX . "product_enquiries AS pe LEFT JOIN " . DB_PREFIX . "product_description pd ON (pe.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product p ON (pe.product_id = p.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

        if (!empty($data['filter_product'])) {
            $sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_product']) . "%'";
        }

        if (!empty($data['filter_seller'])) {
            $sql .= " AND p.seller_id = '" . (int)$data['filter_seller'] . "'";
        }

        if (isset($data['filter_enquiry_status']) && !is_null($data['filter_enquiry_status'])) {
            $sql .= " AND pe.read_by_seller = '" . $data['filter_enquiry_status'] . "'";
        }

        $sql .= " ORDER BY dataTime DESC";

        $query = $this->db->query($sql);

        return $query->rows;
    }


    protected function sendReplyToEnquirer($data) {

        // Get Seller Id & Product Name from DB Query
        $enquiry_info = $this->getEnquiry($data['enquiry_id']);

        $data['web_name'] = $this->config->get('config_name');
        $data['support_email'] = "support@sezplus.com";

        $data['product_name'] = $enquiry_info['product_name'];
        $data['product_link'] = HTTPS_CATALOG.'index.php?route=product/product&product_id='.$data['product_id'];

        $data['web_url'] = HTTPS_CATALOG . "/";
        $data['logo_url'] = HTTPS_CATALOG . "image/" .$this->config->get('config_logo');

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
        $mail->setHtml($this->load->view('mail/seller/product_enquiry_response', $data));
        $mail->send();

    }

    public function markEnquiryAsRead($enquiry_id) {
        $result = $this->db->query("SELECT `id` FROM `".DB_PREFIX."product_enquiries` WHERE `id` = '{$enquiry_id}' AND `read_by_seller` = '1' ");
        if($result->num_rows == 0) {
            // Update Query
            $this->db->query("UPDATE `".DB_PREFIX."product_enquiries` SET `read_by_seller` = '1', `read_dataTime` = '".date('Y-m-d H:i:s')."' WHERE `id` = '{$enquiry_id}' ");
        }
    }

    public function saveReplyToDb($data) {
        $this->db->query("UPDATE `".DB_PREFIX."product_enquiries` SET `reply_content` = '".$this->db->escape($data['reply_content'])."', `reply_dataTime` = '".date('Y-m-d H:i:s')."' WHERE `id` = '{$data['enquiry_id']}' ");
    }

}