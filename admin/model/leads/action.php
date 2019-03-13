<?php
class ModelLeadsAction extends Model {

    public function getLeadById($leadId) {
        $sql = "SELECT * FROM `" . DB_PREFIX . "leads` WHERE `lead_id` = '{$leadId}' ";
        $query = $this->db->query($sql);
        return $query->row;
    }

    public function getPurchaseDetailsOfLeadById($data) {
        $sql = "SELECT * FROM `" . DB_PREFIX . "leads_purchased` WHERE `lead_id` = '".(int)$data['lead_id']."' ";

        if(array_key_exists('user_id',$data)) {
            $sql .= " AND `user_id` = '".(int)$data['user_id']."' ";
        }

        $query = $this->db->query($sql);
        return $query->row;
    }

    public function getLeads($data = array()) {

        $sql = "SELECT l.* FROM `" . DB_PREFIX . "leads` AS l LEFT JOIN `" . DB_PREFIX . "leads_purchased` lp ON (lp.lead_id = l.lead_id) WHERE l.lead_id <> 0 ";

        if (isset($data['filter_status']) && !empty($data['filter_status'])) {
            $sql .= " AND l.status LIKE '". $data['filter_status'] ."'";
        }

        if (isset($data['filter_date_added']) && !empty($data['filter_date_added'])) {
            $sql .= " AND DATE(l.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "') ";
        }

        if (isset($data['filter_user']) && !empty($data['filter_user'])) {
            $sql .= " AND lp.user_id = '" . (int)$data['filter_user'] . "' ";
        }

        $sql .= " GROUP BY l.lead_id";

        $sql .= " ORDER BY l.date_added DESC";

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getTotalLeads($data = array()) {

        $sql = "SELECT count(DISTINCT(l.lead_id)) as total FROM `" . DB_PREFIX . "leads` AS l LEFT JOIN `" . DB_PREFIX . "leads_purchased` lp ON (lp.lead_id = l.lead_id) WHERE l.lead_id <> 0 ";


        if (isset($data['filter_status']) && !empty($data['filter_status'])) {
            $sql .= " AND l.status LIKE '". $data['filter_status'] ."'";
        }

        if (isset($data['filter_date_added']) && !empty($data['filter_date_added'])) {
            $sql .= " AND DATE(l.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "') ";
        }

        if (isset($data['filter_user']) && !empty($data['filter_user'])) {
            $sql .= " AND lp.user_id = '" . (int)$data['filter_user'] . "' ";
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function approve($leadId) {
        $this->db->query("UPDATE `" . DB_PREFIX . "leads` SET `status` = 'approved' WHERE `lead_id` = '". (int)$leadId ."' ");
        // Send an Status Change email
        $this->emailLeadStatusChange($leadId);
    }

    public function reject($data) {
        $this->db->query("UPDATE `" . DB_PREFIX . "leads` SET `status` = 'rejected', `reason` = '".$this->db->escape($data['reason'])."' WHERE `lead_id` = '". (int)$data['lead_id'] ."' ");
        // Send an Status Change email
        $this->emailLeadStatusChange($data['lead_id']);
    }

    public function expire($data) {
        $this->db->query("UPDATE `" . DB_PREFIX . "leads` SET `status` = 'expired', `reason` = '".$this->db->escape($data['reason'])."' WHERE `lead_id` = '". (int)$data['lead_id'] ."' ");
        // Send an Status Change email
        $this->emailLeadStatusChange($data['lead_id']);
    }

    public function buy($data) {
        $sql = "INSERT into `" . DB_PREFIX . "leads_purchased` (`lead_id`, `user_id`) VALUES ('".(int)$data['lead_id']."', '".(int)$data['user_id']."') ";
        $this->db->query($sql);
        $this->sendBuyEmail($data);
        return $this->db->getLastId();
    }

    public function updateViews($data) {
        $sql_update = "UPDATE `".DB_PREFIX."leads` SET views = views+1 WHERE `lead_id` = '{$data['lead_id']}'";
        $this->db->query($sql_update);
    }

    protected function emailLeadStatusChange($leadId) {
        $lead_data = $this->getLeadById($leadId);

        $data['web_url'] = HTTPS_CATALOG . "/";
        $data['logo_url'] = HTTPS_CATALOG . "image/" .$this->config->get('config_logo');
        $data['to_email'] = $lead_data['contact_email'];
        $data['name'] = $lead_data['contact_name'];
        $data['web_name'] = $this->config->get('config_name');
        $data['support_email'] = 'support@sezplus.com';
        $data['subject'] = "Your submission status has been changed | {$data['web_name']}";
        $data['lead_link'] = HTTPS_CATALOG . 'view-lead.html&lead='. base64_encode($lead_data['lead_id']).'&state='.$lead_data['status'];
        $data['lead_status'] = $lead_data['status'];
        $data['reason'] = $lead_data['reason'];


        $mail = new Mail();
        $mail->protocol = $this->config->get('config_mail_protocol');
        $mail->parameter = $this->config->get('config_mail_parameter');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->smtp_username = $this->config->get('config_mail_smtp_username');
        $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mail->smtp_port = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
        $mail->setTo($lead_data['contact_email']);
        $mail->setFrom($this->config->get('config_email'));
        $mail->setSender(html_entity_decode($data['web_name'], ENT_QUOTES, 'UTF-8'));
        $mail->setSubject(html_entity_decode($data['subject'], ENT_QUOTES, 'UTF-8'));
        $mail->setHtml($this->load->view('mail/leads/status_change', $data));

        $mail->send();
    }

    protected function sendBuyEmail($data) {

        $lead_data = $this->getLeadById($data['lead_id']);
        $this->load->model('user/user');
        $user_data = $this->model_user_user->getUser($data['user_id']);

        $data['web_url'] = HTTPS_CATALOG . "/";
        $data['logo_url'] = HTTPS_CATALOG . "image/" .$this->config->get('config_logo');
        $data['web_name'] = $this->config->get('config_name');

        $data['to_email'] = $user_data['email'];
        $data['name'] = $user_data['firstname'];
        $data['subject'] = "Lead Purchased | {$data['web_name']}";
        $data['lead_link'] = $this->url->link('leads/action/view','&lead='. base64_encode($lead_data['lead_id']). '&method=purchased',true);
        $data['lead_name'] = $lead_data['title'];


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
        $mail->setHtml($this->load->view('mail/leads/lead_purchased', $data));

        $mail->send();
    }
}
