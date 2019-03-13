<?php
class ModelLeadsBuy extends Model {

    public function addLead($data) {

        $sql_insert = "INSERT into `".DB_PREFIX."leads`
                        (`title`,`description`,`quantity`,`contact_name`,`contact_email`, `contact_phone`, `location`, `date_added`)
                        VALUES
                        ('".$this->db->escape($data['title'])."','".$this->db->escape($data['description'])."','".$this->db->escape($data['quantity'])."','".$this->db->escape($data['contact_name'])."','".$this->db->escape($data['contact_email'])."','".$this->db->escape($data['contact_phone'])."','".$this->db->escape($data['location'])."','".date('Y-m-d H:i:s')."')";

        $this->db->query($sql_insert);

        return $this->db->getLastId();
    }

    public function updateLead($data) {

        foreach($data as $key => $value) {
            if($key !== 'lead_id') {
                $sql_update = "UPDATE `".DB_PREFIX."leads` SET `".$key."` = '".$this->db->escape($value)."' WHERE `lead_id` = '{$data['lead_id']}'";
                $this->db->query($sql_update);
            }
        }
    }

    public function getLead($leadId) {
        $sql = "SELECT * FROM `".DB_PREFIX."leads` WHERE `lead_id` = '{$leadId}' ";
        $result_set = $this->db->query($sql);
        return $result_set->row;
    }

    public function getLeads($data) {

        $sql = "SELECT l.lead_id FROM `" . DB_PREFIX . "leads` AS l  ";

        $sql .= " WHERE l.status LIKE 'approved' ";

        $sql .= " GROUP BY l.lead_id";

        $sql .= " ORDER BY UNIX_TIMESTAMP(l.date_added) DESC";

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $lead_data = array();

        $query = $this->db->query($sql);

        foreach ($query->rows as $result) {
            $lead_data[$result['lead_id']] = $this->getLead($result['lead_id']);
        }

        return $lead_data;
    }

    public function  getTotalLeads($data) {
        $sql = "SELECT COUNT(DISTINCT(l.lead_id)) FROM `" . DB_PREFIX . "leads` AS l  ";

        $sql .= " WHERE l.status LIKE 'approved' ";

        $sql .= " GROUP BY l.lead_id";

        $sql .= " ORDER BY UNIX_TIMESTAMP(l.date_added) DESC";

        $query = $this->db->query($sql);

        return $query->row['total'];;
    }

    public function updateViews($data) {
        $sql_update = "UPDATE `".DB_PREFIX."leads` SET views = views+1 WHERE `lead_id` = '{$data['lead_id']}'";
        $this->db->query($sql_update);
    }

    public function sendApprovalNotification($data) {

        $data['web_name'] = $this->config->get('config_name');
        $data['subject'] = "Lead submitted for approval | {$data['web_name']}";
        $data['lead_admin_link'] = HTTPS_SERVER.'admin/index.php?route=leads/action/view&method=all&lead='.base64_encode($data['lead_id']);

        $mail = new Mail();
        $mail->protocol = $this->config->get('config_mail_protocol');
        $mail->parameter = $this->config->get('config_mail_parameter');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->smtp_username = $this->config->get('config_mail_smtp_username');
        $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mail->smtp_port = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
        $mail->setTo('approval@sezplus.com');
        $mail->setFrom($this->config->get('config_email'));
        $mail->setSender(html_entity_decode($data['web_name'], ENT_QUOTES, 'UTF-8'));
        $mail->setSubject(html_entity_decode($data['subject'], ENT_QUOTES, 'UTF-8'));
        $html = '<p>Hello, <br/>Someone has submitted a new Lead. Please Approve / Reject it. <br/> Link: <a href="'.$data['lead_admin_link'].'">Lead</a></p>';
        $mail->setHtml($html);
        $mail->send();

    }

    public function sendAcknowledgement($data) {

        $data['web_url'] = HTTPS_SERVER . "/";
        $data['logo_url'] = HTTPS_SERVER . "image/" .$this->config->get('config_logo');
        $data['to_email'] = $data['email'];
        $data['web_name'] = $this->config->get('config_name');
        $data['support_email'] = 'support@sezplus.com';
        $data['subject'] = "Your requirements have been submitted | {$data['web_name']}";
        $data['lead_link'] = $this->url->link('leads/buy/view', '&lead='. base64_encode($data['lead_id']).'&state=pending', true);

        $mail = new Mail();
        $mail->protocol = $this->config->get('config_mail_protocol');
        $mail->parameter = $this->config->get('config_mail_parameter');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->smtp_username = $this->config->get('config_mail_smtp_username');
        $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mail->smtp_port = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
        $mail->setTo($data['email']);
        $mail->setFrom($this->config->get('config_email'));
        $mail->setSender(html_entity_decode($data['web_name'], ENT_QUOTES, 'UTF-8'));
        $mail->setSubject(html_entity_decode($data['subject'], ENT_QUOTES, 'UTF-8'));
        $mail->setHtml($this->load->view('mail/leads/acknowledgement', $data));

        $mail->send();

    }

}
