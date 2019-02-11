<?php
class ControllerExtensionModuleSellerEnquiry extends Controller {
    public function storeQuery() {

        $postData = $this->request->post;

        // Save the Post Data in DB
        $this->db->query("INSERT into `".DB_PREFIX."seller_enquiries` (`seller_id`,`sender_name`,`sender_email`,`sender_telephone`,`content`, `dataTime`)
                            VALUES ('".$this->db->escape($postData['seller_id'])."','".$this->db->escape($postData['sender_name'])."','".$this->db->escape($postData['sender_email'])."','".$this->db->escape($postData['sender_telephone'])."','".$this->db->escape($postData['content'])."', '".date('Y-m-d H:i:s')."') ");

        $enquiry_id = $this->db->getLastId();

        // e-Mail to Seller that they've received an enquiry, link to check it on back-end.
        $this->sendEmailToSeller(array('seller_id' => trim($postData['seller_id']), 'enquiry_id' => $enquiry_id));

        echo $enquiry_id;
    }


    protected function sendEmailToSeller($data) {

        $this->load->model('seller/seller');
        $data['seller_name'] = $this->model_seller_seller->getSellerName($data['seller_id']);
        $data['seller_email'] = $this->model_seller_seller->getSellerEmail($data['seller_id']);
        $data['web_name'] = $this->config->get('config_name');
        $data['support_email'] = "seller.support@sezplus.com";

        $data['enquiry_link'] = HTTPS_SERVER.'admin/index.php?route=catalog/seller_enquiry/view&enquiry_id='.$data['enquiry_id'];

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
        $mail->setSubject(html_entity_decode("Enquiry received!", ENT_QUOTES, 'UTF-8'));
        $mail->setHtml($this->load->view('mail/seller_enquiry_notification', $data));
        $mail->send();

    }

}