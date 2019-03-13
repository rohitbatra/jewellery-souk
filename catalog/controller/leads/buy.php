<?php
class ControllerLeadsBuy extends Controller {

    public function index() {

        // Get List View - by Default
        $this->getList();
    }

    public function getList() {

        $this->load->language('leads/buy');

        $this->load->model('leads/buy');

        $this->load->model('tool/image');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        if (isset($this->request->get['limit'])) {
            $limit = (int)$this->request->get['limit'];
        } else {
            $limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $url = '';

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        if (isset($this->request->get['limit'])) {
            $url .= '&limit=' . $this->request->get['limit'];
        }

        $data['leads'] = array();

        $filter_data = array(
            'start'              => ($page - 1) * $limit,
            'limit'              => $limit
        );

        $leads_total = $this->model_leads_buy->getTotalLeads($filter_data);

        $results = $this->model_leads_buy->getLeads($filter_data);

        if ($results) {

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_leads'),
                'href' => $this->url->link('leads/buy', $url)
            );

            $data['heading_title'] = sprintf($this->language->get('heading_title'),$this->config->get('config_name'));
            $this->document->setTitle($data['heading_title']);

            $data['text_limit'] = $this->language->get('text_limit');
            $data['text_quantity'] = $this->language->get('text_quantity');
            $data['text_location'] = $this->language->get('text_location');
            $data['text_date_added'] = $this->language->get('text_date_added');

            $data['button_view_lead'] = $this->language->get('button_view_lead');

            foreach ($results as $result) {

                if (!empty($result['image_path'])) {
                    $image = $this->model_tool_image->resize($result['image_path'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                } else {
                    $image = 'image/no_image_placeholder.svg';
                }

                $data['leads'][] = array(
                    'lead_id'     => $result['lead_id'],
                    'thumb'       => $image,
                    'name'        => $result['title'],
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                    'quantity'    => $result['quantity'],
                    'location'    => $result['location'],
                    'date_added'  => date('d M Y',strtotime($result['date_added'])),
                    'href'        => $this->url->link('leads/buy/view', 'lead=' . base64_encode($result['lead_id']). $url)
                );
            }

            $data['limits'] = array();

            $limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

            sort($limits);

            foreach($limits as $value) {
                $data['limits'][] = array(
                    'text'  => $value,
                    'value' => $value,
                    'href'  => $this->url->link('leads/buy', '&limit=' . $value)
                );
            }

            $url = '';

            $pagination = new Pagination();
            $pagination->total = $leads_total;
            $pagination->page = $page;
            $pagination->limit = $limit;
            $pagination->url = $this->url->link('leads/buy', 'path=' . $this->request->get['path'] . $url . '&page={page}');

            $data['pagination'] = $pagination->render();

            $data['results'] = sprintf($this->language->get('text_pagination'), ($leads_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($leads_total - $limit)) ? $leads_total : ((($page - 1) * $limit) + $limit), $leads_total, ceil($leads_total / $limit));

            // http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
            if ($page == 1) {
                $this->document->addLink($this->url->link('leads/buy', true), 'canonical');
            } elseif ($page == 2) {
                $this->document->addLink($this->url->link('leads/buy', true), 'prev');
            } else {
                $this->document->addLink($this->url->link('leads/buy', '&page='. ($page - 1), true), 'prev');
            }

            if ($limit && ceil($leads_total / $limit) > $page) {
                $this->document->addLink($this->url->link('leads/buy', '&page='. ($page + 1), true), 'next');
            }

            $data['limit'] = $limit;

            $data['continue'] = $this->url->link('common/home');

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('leads/list_lead', $data));
        } else {

            $url = '';

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_error'),
                'href' => $this->url->link('leads/buy', $url)
            );

            $this->document->setTitle($this->language->get('text_error'));

            $data['heading_title'] = $this->language->get('text_error');

            $data['text_error'] = $this->language->get('text_empty');

            $data['button_continue'] = $this->language->get('button_continue');

            $data['continue'] = $this->url->link('common/home');

            $this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('error/not_found', $data));
        }

    }

    public function getForm() {

        $this->load->language('leads/buy');

        $data = array();

        $data['heading_title'] = sprintf($this->language->get('heading_title_new_lead'),$this->config->get('config_name'));

        $this->document->setTitle($data['heading_title']);

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_leads'),
            'href' => $this->url->link('leads/buy', '', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_new_lead'),
            'href' => $this->url->link('leads/buy/post', '', true)
        );


        $data['heading_new_lead'] = $this->language->get('heading_new_lead');
        $data['subline_new_lead'] = $this->language->get('subline_new_lead');
        $data['text_lead_info'] = $this->language->get('text_lead_info');
        $data['text_contact_details'] = $this->language->get('text_contact_details');

        $data['entry_lead_title'] = $this->language->get('entry_lead_title');
        $data['placeholder_lead_title'] = $this->language->get('placeholder_lead_title');
        $data['entry_quantity'] = $this->language->get('entry_quantity');
        $data['placeholder_quantity'] = $this->language->get('placeholder_quantity');
        $data['entry_lead_description'] = $this->language->get('entry_lead_description');
        $data['placeholder_lead_description'] = $this->language->get('placeholder_lead_description');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_phone'] = $this->language->get('entry_phone');
        $data['entry_email'] = $this->language->get('entry_email');
        $data['entry_location'] = $this->language->get('entry_location');
        $data['entry_image'] = $this->language->get('entry_image');
        $data['help_image'] = $this->language->get('help_image');

        // Errors
        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['contact_name'])) {
            $data['error_contact_name'] = $this->error['error_contact_name'];
        } else {
            $data['error_contact_name'] = '';
        }

        if (isset($this->error['contact_phone'])) {
            $data['error_contact_phone'] = $this->error['error_contact_phone'];
        } else {
            $data['error_contact_phone'] = '';
        }

        if (isset($this->error['contact_email'])) {
            $data['error_contact_email'] = $this->error['error_contact_email'];
        } else {
            $data['error_contact_email'] = '';
        }

        if (isset($this->error['title'])) {
            $data['error_title'] = $this->error['error_title'];
        } else {
            $data['error_title'] = '';
        }

        if (isset($this->error['description'])) {
            $data['error_description'] = $this->error['error_description'];
        } else {
            $data['error_description'] = '';
        }

        $data['button_submit'] = $this->language->get('button_submit');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $data['action'] = $this->url->link('leads/buy/post', '', true);

        if (isset($this->request->post['title'])) {
            $data['title'] = $this->request->post['title'];
        } else {
            $data['title'] = '';
        }

        if (isset($this->request->post['quantity'])) {
            $data['quantity'] = $this->request->post['quantity'];
        } else {
            $data['quantity'] = '';
        }

        if (isset($this->request->post['description'])) {
            $data['description'] = $this->request->post['description'];
        } else {
            $data['description'] = '';
        }

        if (isset($this->request->post['contact_name'])) {
            $data['contact_name'] = $this->request->post['contact_name'];
        } else {
            $data['contact_name'] = '';
        }

        if (isset($this->request->post['contact_email'])) {
            $data['contact_email'] = $this->request->post['contact_email'];
        } else {
            $data['contact_email'] = '';
        }

        if (isset($this->request->post['contact_phone'])) {
            $data['contact_phone'] = $this->request->post['contact_phone'];
        } else {
            $data['contact_phone'] = '';
        }

        if (isset($this->request->post['location'])) {
            $data['location'] = $this->request->post['location'];
        } else {
            $data['location'] = '';
        }

        // Captcha
        if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('register', (array)$this->config->get('config_captcha_page'))) {
            $data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'), $this->error);
        } else {
            $data['captcha'] = '';
        }

        $this->response->setOutput($this->load->view('leads/post_lead_form', $data));

    }

    public function post() {

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

            $this->load->model('leads/buy');

            $image_path = $this->saveImage();

            $lead_id = $this->model_leads_buy->addLead($this->request->post);

            if(is_numeric($lead_id)) {

                if($image_path !== false) {
                    // update the Image URI
                    $this->model_leads_buy->updateLead(array('lead_id' => $lead_id, 'image_path' => $image_path));
                }

                // Send notification email to Approver
                $this->model_leads_buy->sendApprovalNotification(array('lead_id' => $lead_id));
                // Send Acknowledgement email to User
                $this->model_leads_buy->sendAcknowledgement(array('lead_id' => $lead_id, 'email' => $this->request->post['contact_email'], 'name' => $this->request->post['contact_name']));
                // Redirect to Lead Posted page
                $this->response->redirect($this->url->link('leads/buy/posted', '&lead='. base64_encode($lead_id).'&status=pending', true));
            } else {
                $this->session->data['error'] = "There's a problem with your Submission, please email us at <a href='mailto:support@sezplus.com'>support@sezplus.com</a>'";
            }
        }

        $this->getForm();

    }

    public function posted() {

        $this->load->language('leads/buy');

        $data['heading_title'] = sprintf($this->language->get('heading_title_lead_posted'),$this->config->get('config_name'));

        $this->document->setTitle($data['heading_title']);

        $data['text_message'] = $this->language->get('text_message_posted');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_leads'),
            'href' => $this->url->link('leads/buy', '', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_lead_posted'),
            'href' => $this->url->link('leads/buy/posted', '&lead='.$this->request->get['lead'].'&status=pending', true)
        );

        $data['error_warning'] = "";
        $data['success'] = "";

        $data['heading_title'] = $this->language->get('subline_title_lead_posted');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $data['continue'] = $this->url->link('leads/buy', '', true);
        $data['button_continue'] = $this->language->get('button_continue');

        $this->response->setOutput($this->load->view('leads/lead_posted', $data));

    }

    public function view() {

        $this->load->language('leads/buy');
        $this->load->model('leads/buy');
        $this->load->model('tool/image');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        if(isset($this->request->get['lead']) && !empty($this->request->get['lead'])) {

            $leadId = base64_decode($this->request->get['lead']);

            $data['error_warning'] = "";
            $data['success'] = "";

            $leadInfo = $this->model_leads_buy->getLead($leadId);

            if(is_array($leadInfo) && !empty($leadInfo)) {

                // Check Lead Status
                if($leadInfo['status'] == 'approved') {

                    // Approved Lead show it
                    $data['btnDisabled'] = false;

                } else if($leadInfo['status'] == 'expired') {

                    // Expired Lead show a warning & disable 'Buy Lead' button
                    $data['error_warning'] = "Lead has expired. You will not be able to buy it!";
                    $data['btnDisabled'] = true;

                } else if($leadInfo['status'] == 'pending') {

                    // Pending Review
                    $data['error_warning'] = "Lead is Pending Review!";
                    $data['btnDisabled'] = true;

                } else if($leadInfo['status'] == 'rejected') {

                    // Rejected state
                    $data['error_warning'] = "Lead has been Rejected. It does not meet our Policy!";
                    $data['btnDisabled'] = true;

                }

                if(isset($this->request->get['state'])) {
                    if($leadInfo['status'] == 'approved') {
                        // just Approved Lead
                        $data['success'] = "Lead is Approved.";

                    }
                }

                /* PAGE PRODUCT */
                $text_config = array(
                    'product_page_button',
                    'product_socialshare',
                );
                foreach ($text_config as $text ) {
                    $data[$text] = $this->soconfig->get_settings($text);
                }

                $data['lead_id'] = $leadInfo['lead_id'];
                $data['lead_title'] = $leadInfo['title'];
                $data['lead_description'] = $leadInfo['description'];
                $data['lead_quantity'] = $leadInfo['quantity'];
                $data['lead_location'] = $leadInfo['location'];
                $data['lead_posted_on'] = date('d M Y',strtotime($leadInfo['date_added']));
                $data['lead_href'] = $this->url->link('leads/buy/view','&lead='.base64_encode($leadInfo['lead_id']). true);

                // Buy Link
                $tmpStr = rawurlencode("leads/action/view"."&lead=".base64_encode($leadInfo['lead_id']));
                $data['lead_buy_href'] = $this->url->link('seller/login','&redirect='.$tmpStr, true);


                if (!empty($leadInfo['image_path'])) {
                    $image = $this->model_tool_image->resize($leadInfo['image_path'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                } else {
                    $image = 'image/no_image_placeholder.svg';
                }

                $data['lead_img'] = $image;

                $this->document->setTitle(sprintf($this->language->get('heading_title_view_lead'),$this->config->get('config_name')));

                $data['heading_title'] = sprintf($this->language->get('subline_title_view_lead'),ucwords($data['lead_title']));

                $data['breadcrumbs'][] = array(
                    'text' => $this->language->get('text_leads'),
                    'href' => $this->url->link('leads/buy','', true)
                );

                $data['breadcrumbs'][] = array(
                    'text' => $data['heading_title'],
                    'href' => $data['lead_href']
                );

                $data['text_latest_leads'] = $this->language->get('text_latest_leads');
                $data['text_quantity'] = $this->language->get('text_quantity');
                $data['text_location'] = $this->language->get('text_location');
                $data['text_date_added'] = $this->language->get('text_date_added');

                $data['button_cart'] = $this->language->get('button_buy_lead');
                $data['button_continue'] = $this->language->get('button_continue');

                $data['home_link'] = $this->url->link('common/home','', true);

                $data['column_left'] = $this->load->controller('common/column_left');
                $data['column_right'] = $this->load->controller('common/column_right');
                $data['content_top'] = $this->load->controller('common/content_top');
                $data['content_bottom'] = $this->load->controller('common/content_bottom');
                $data['footer'] = $this->load->controller('common/footer');
                $data['header'] = $this->load->controller('common/header');

                // get Latest Leads
                $latestLeadsData = $this->model_leads_buy->getLeads(array('limit' => '6'));

                foreach($latestLeadsData as $lead) {

                    if (!empty($lead['image_path'])) {
                        $image = $this->model_tool_image->resize($lead['image_path'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                    } else {
                        $image = 'image/no_image_placeholder.svg';
                    }

                    $data['latest_leads'][] = array(
                                            'lead_id'   => $lead['lead_id'],
                                            'thumb'     => $image,
                                            'href'      => $this->url->link('leads/buy/view','&lead='.base64_encode($lead['lead_id']),true),
                                            'title'     => $lead['title'],
                                            'location'  => $lead['location']
                                            );
                }

                if(false || ($leadInfo['status'] == 'pending' || $leadInfo['status'] == 'rejected')) {

                } else {
                    // Add +1 to View Count
                    $this->model_leads_buy->updateViews(array('lead_id' => $leadInfo['lead_id']));
                }

                $this->response->setOutput($this->load->view('leads/view_lead', $data));

            } else {

                // Error - Lead Not Found
                $data['breadcrumbs'][] = array(
                    'text' => $this->language->get('text_error'),
                    'href' => $this->url->link('leads/buy/view', '&lead='.$this->request->get['lead'] ,true)
                );

                $this->document->setTitle($this->language->get('text_error'));

                $data['heading_title'] = $this->language->get('text_error');

                $data['text_error'] = $this->language->get('text_error');

                $data['button_continue'] = $this->language->get('button_continue');

                $data['continue'] = $this->url->link('common/home');

                $this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

                $data['column_left'] = $this->load->controller('common/column_left');
                $data['column_right'] = $this->load->controller('common/column_right');
                $data['content_top'] = $this->load->controller('common/content_top');
                $data['content_bottom'] = $this->load->controller('common/content_bottom');
                $data['footer'] = $this->load->controller('common/footer');
                $data['header'] = $this->load->controller('common/header');

                $this->response->setOutput($this->load->view('error/not_found', $data));
            }


        } else {
            // Error Page Not Found
            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_error'),
                'href' => $this->url->link('leads/buy/view', '&lead=0' ,true)
            );

            $this->document->setTitle($this->language->get('text_error'));

            $data['heading_title'] = $this->language->get('text_error');

            $data['text_error'] = $this->language->get('text_error');

            $data['button_continue'] = $this->language->get('button_continue');

            $data['continue'] = $this->url->link('common/home');

            $this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('error/not_found', $data));
        }

    }

    protected function validate() {

        if (!empty($this->request->post['contact_name']) && (utf8_strlen($this->request->post['contact_name']) < 3)) {
            $this->error['contact_name'] = $this->language->get('error_contact_name');
        }

        if (!empty($this->request->post['contact_email']) && (utf8_strlen($this->request->post['contact_email']) < 3)) {
            $this->error['contact_email'] = $this->language->get('error_contact_email');
        }

        if (!empty($this->request->post['contact_phone']) && (utf8_strlen($this->request->post['contact_phone']) < 3 && utf8_strlen($this->request->post['contact_phone']) < 11)) {
            $this->error['contact_phone'] = $this->language->get('error_contact_phone');
        }

        if (!empty($this->request->post['title']) && (utf8_strlen($this->request->post['title']) < 3)) {
            $this->error['title'] = $this->language->get('error_title');
        }

        if (!empty($this->request->post['description']) && (utf8_strlen($this->request->post['description']) < 3)) {
            $this->error['description'] = $this->language->get('error_description');
        }

        return !$this->error;

    }

    protected function saveImage() {

        $json = array();

        $uDir = 'leads';

        // Make sure we have the correct directory
        $directory = DIR_IMAGE . $uDir;

        // Check its a directory
        if (!is_dir($directory) || substr(str_replace('\\', '/', realpath($directory)), 0, strlen(DIR_IMAGE . 'leads')) != DIR_IMAGE . 'leads') {
            mkdir($directory);
        }

        $file = $this->request->files['lead-image'];

        if (is_file($file['tmp_name'])) {
            // Sanitize the filename
            $filename = mt_rand(1,1000).'_'.basename(html_entity_decode($file['name'], ENT_QUOTES, 'UTF-8'));

            // Allowed file extension types
            $allowed = array(
                'jpg',
                'jpeg',
                'gif',
                'png'
            );

            if (!in_array(utf8_strtolower(utf8_substr(strrchr($filename, '.'), 1)), $allowed)) {
                $json['error'] = $this->language->get('error_filetype');
            }

            // Allowed file mime types
            $allowed = array(
                'image/jpeg',
                'image/pjpeg',
                'image/png',
                'image/x-png',
                'image/gif'
            );

            if (!in_array($file['type'], $allowed)) {
                $json['error'] = $this->language->get('error_filetype');
            }

            // Return any upload error
            if ($file['error'] != UPLOAD_ERR_OK) {
                $json['error'] = $this->language->get('error_upload_' . $file['error']);
            }
        } else {
            $json['error'] = $this->language->get('error_upload');
        }

        if (!$json) {
            move_uploaded_file($file['tmp_name'], $directory . '/' . $filename);
            return $uDir . '/' . $filename;
        } else {
            return false;
        }

    }

}
