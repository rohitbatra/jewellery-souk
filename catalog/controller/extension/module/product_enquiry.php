<?php
class ControllerExtensionModuleProductEnquiry extends Controller {
    public function storeQuery() {

        $postData = $this->request->post;

        // Save the Post Data in DB
        $this->db->query("INSERT into `".DB_PREFIX."product_enquiries` (`product_id`,`sender_name`,`sender_email`,`sender_telephone`,`content`, `enquiry_dataTime`)
                            VALUES ('".$this->db->escape($postData['product_id'])."','".$this->db->escape($postData['sender_name'])."','".$this->db->escape($postData['sender_email'])."','".$this->db->escape($postData['sender_telephone'])."','".$this->db->escape($postData['content'])."', 'NOW()') ");

        $enquiry_id = $this->db->getLastId();

        // e-Mail to Seller that they've received an enquiry regarding particular product, link to check it on back-end.
        $this->sendEmailToSeller(array('product_id' => trim($postData['product_id']), 'enquiry_id' => $enquiry_id));

        echo $enquiry_id;
    }


    protected function sendEmailToSeller($data) {

        // Get Seller Id & Product Name from DB Query
        $sql_seller = "SELECT p.seller_id, pd.name FROM `".DB_PREFIX."product_description` AS pd LEFT JOIN `".DB_PREFIX."product` p ON (pd.product_id = p.product_id) WHERE pd.product_id = '{$data['product_id']}' ";
        $query_result = $this->db->query($sql_seller);
        $sellerId = $query_result->row['seller_id'];
        $this->load->model('seller/seller');
        $data['seller_name'] = $this->model_seller_seller->getSellerName($sellerId);
        $data['seller_email'] = $this->model_seller_seller->getSellerEmail($sellerId);
        $data['web_name'] = $this->config->get('config_name');
        $data['support_email'] = "seller.support@sezplus.com";

        $data['product_name'] = $query_result->row['name'];
        $data['product_link'] = $this->url->link('product/product', 'product_id=' . $data['product_id'], true);
        $data['enquiry_link'] = HTTPS_SERVER.'admin/index.php?route=catalog/product_enquiry/view&enquiry_id='.$data['enquiry_id'];

        $data['web_url'] = HTTPS_SERVER . "/";
        $data['logo_url'] = HTTPS_SERVER . "image/" .$this->config->get('config_logo');

        // Send an HTML email
        $mail = new Mail();
        $mail->protocol = $this->config->get('config_mail_protocol');
        $mail->parameter = $this->config->get('config_mail_parameter');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->smtp_username = 'enquiries@sezplus.com';
        $mail->smtp_password = html_entity_decode('Sezplus@12345%', ENT_QUOTES, 'UTF-8');
        $mail->smtp_port = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

        $mail->setTo($data['seller_email']);
        $mail->setFrom("enquiries@sezplus.com");
        $mail->setSender(html_entity_decode($data['web_name'].' Enquiries', ENT_QUOTES, 'UTF-8'));
        $mail->setSubject(html_entity_decode("Enquiry for your Product!", ENT_QUOTES, 'UTF-8'));
        $mail->setHtml($this->load->view('mail/product_enquiry_notification', $data));
        $mail->send();

    }

}