<?php
class ControllerLeadsAction extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('seller/seller');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('seller/seller');

        $this->getList();
    }

    public function all() {

        $this->getList(array_merge($this->request->get,array('method' => 'all')));
    }

    public function purchased() {

        if($this->user->isSeller()) {
            $this->getList(array_merge($this->request->get,array('filter_user_id' => $this->user->getId(), 'method' => 'purchased', 'filter_status' => 'approved')));
        } else {
            // Admin case show all Purchased leads
            $this->getList(array_merge($this->request->get,array('method' => 'purchased', 'filter_status' => 'approved', 'filter_user_id' => $this->request->get['filter_user_id'])));
        }
    }

    protected function getList($pdata = array()) {

        $this->load->language('leads/action');

        $this->load->model('leads/action');

        if (isset($pdata['filter_status'])) {
            $status = $pdata['filter_status'];
        } else {
            if($this->user->isSeller()) {
                // If Seller only Show the Approved Leads
                $status = 'approved';
            } else {
                // Admin show all the Leads
                $status = '';
            }
        }

        if (isset($pdata['page'])) {
            $page = $pdata['page'];
        } else {
            $page = 1;
        }

        if (isset($pdata['method'])) {
            $method = $pdata['method'];
        } else {
            $method = 'all';
        }

        if (isset($pdata['filter_user_id'])) {
            $userId = $pdata['filter_user_id'];
        } else {
            $userId = '0';
        }

        $url = '';

        if (isset($pdata['page'])) {
            $url .= '&page=' . $pdata['page'];
        }

        if (isset($pdata['status'])) {
            $url .= '&status=' . $pdata['status'];
        }

        if (isset($pdata['token'])) {
            $url .= '&token=' . $pdata['token'];
            $data['token'] = $pdata['token'];
        }

        $data['method'] = $method;

        $data['heading_title'] = sprintf($this->language->get('heading_title'),ucfirst($method));

        $this->document->setTitle($data['heading_title']);

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', $url, true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $data['heading_title'],
            'href' => $this->url->link('leads/action/'.$method, $url, true)
        );

        $data['leads'] = array();

        $filter_data = array(
            'filter_status'	            => $status,
            'filter_user'	            => $userId,
            'start'                     => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'                     => $this->config->get('config_limit_admin')
        );

        $results_total = $this->model_leads_action->getTotalLeads($filter_data);

        $results = $this->model_leads_action->getLeads($filter_data);

        foreach ($results as $result) {

            $data['leads'][] = array(
                'lead_id'     => $result['lead_id'],
                'name'        => $result['title'],
                'views'       => number_format($result['views']),
                'quantity'    => $result['quantity'],
                'location'    => $result['location'],
                'status'      => ucfirst($result['status']),
                'date_added'  => date('d M Y',strtotime($result['date_added'])),
                'approve'     => $this->url->link('leads/action/approve', 'lead=' . base64_encode($result['lead_id']). $url),
                'reject'      => $this->url->link('leads/action/reject', 'lead=' . base64_encode($result['lead_id']). $url),
                'expire'      => $this->url->link('leads/action/expire', 'lead=' . base64_encode($result['lead_id']). $url),
                'view'        => $this->url->link('leads/action/view', 'lead=' . base64_encode($result['lead_id']). '&method='.$method. $url)
            );
        }

        if($this->user->isSeller()) {
            $data['isSeller'] = true;
        } else {
            $data['isSeller'] = false;
            $this->load->model('user/user');
            $data['sellers'] = $this->model_user_user->getSellers();
        }

        $data['text_list'] = $this->language->get('text_list');
        $data['text_approved'] = $this->language->get('text_approved');
        $data['text_rejected'] = $this->language->get('text_rejected');
        $data['text_expired'] = $this->language->get('text_expired');
        $data['text_pending'] = $this->language->get('text_pending');
        $data['text_all'] = $this->language->get('text_all');
        $data['text_view'] = $this->language->get('text_view');
        $data['text_no_results'] = "No Leads to Show!";

        $data['entry_status'] = $this->language->get('entry_status');
        $data['button_filter'] = $this->language->get('button_filter');
        $data['button_approve'] = $this->language->get('button_approve');
        $data['button_reject'] = $this->language->get('button_reject');
        $data['button_expire'] = $this->language->get('button_expire');

        if (isset($this->session->data['warning'])) {
            $data['error_warning'] = $this->session->data['warning'];
            unset($this->session->data['warning']);
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array)$this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $data['column_title'] = $this->language->get('column_title');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_location'] = $this->language->get('column_location');
        $data['column_views'] = $this->language->get('column_views');
        $data['column_date_added'] = $this->language->get('column_date_added');
        $data['column_action'] = $this->language->get('column_action');

        $pagination = new Pagination();
        $pagination->total = $results_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('leads/action'.$method, $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($results_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($results_total - $this->config->get('config_limit_admin'))) ? $results_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $results_total, ceil($results_total / $this->config->get('config_limit_admin')));

        $data['filter_status'] = $status;
        $data['filter_user_id'] = $userId;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('leads/list', $data));
    }

    public function approve() {

        if (isset($this->request->get['lead'])) {

            $this->load->model('leads/action');

            $this->model_leads_action->approve(base64_decode($this->request->get['lead']));

            $this->session->data['success'] = 'Lead has been Approved';

            $url = '';

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status=' . $this->request->get['filter_status'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('leads/action/all', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->session->data['warning'] = 'No Lead found!';

        $this->getList();
    }

    public function expire() {

        if (isset($this->request->get['lead'])) {

            $this->load->model('leads/action');

            $this->model_leads_action->expire(array('lead_id' => base64_decode($this->request->get['lead']), 'reason' => $this->request->get['reason']));

            $this->session->data['success'] = 'Lead has been set as Expired';

            $url = '';

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status=' . $this->request->get['filter_status'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('leads/action/all', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->session->data['warning'] = 'No Lead found!';

        $this->getList();
    }

    public function reject() {

        if (isset($this->request->get['lead'])) {

            $this->load->model('leads/action');

            $this->model_leads_action->reject(array('lead_id' => base64_decode($this->request->get['lead']), 'reason' => $this->request->get['reason']));

            $this->session->data['success'] = 'Lead has been Rejected.';

            $url = '';

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status=' . $this->request->get['filter_status'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('leads/action/all', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->session->data['warning'] = 'No Lead found!';

        $this->getList();
    }

    public function view() {

        $this->language->load('leads/action');

        $this->load->model('leads/action');

        $this->load->model('tool/image');

        $data['heading_title'] = $this->language->get('text_view_lead');

        $this->document->setTitle($data['heading_title']);

        $url = "";

        if(isset($this->request->get['token'])) {
            $url .= "&token=".$this->request->get['token'];
        }

        $method = 'all';
        if(isset($this->request->get['method'])) {
            $url .= "&method=".$this->request->get['method'];
            $method = $this->request->get['method'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', $url, true)
        );


        if(isset($this->request->get['lead']) && !empty($this->request->get['lead'])) {

            $leadId = base64_decode($this->request->get['lead']);
            $leadData = $this->model_leads_action->getLeadById($leadId);
            $data['lead']['title'] = $leadData['title'];
            $data['lead']['description'] = $leadData['description'];
            $data['lead']['quantity'] = $leadData['quantity'];
            $data['lead']['location'] = $leadData['location'];
            $data['lead']['date_added'] = date('d M Y',strtotime($leadData['date_added']));
            $data['lead']['status'] = $leadData['status'];
            $data['lead']['reason'] = $leadData['reason'];
            $data['lead']['email'] = $leadData['contact_email'];
            $data['lead']['phone'] = $leadData['contact_phone'];
            $data['lead']['name'] = $leadData['contact_name'];
            $data['lead']['views'] = $leadData['views'];

            $data['isSeller'] = false;
            if($this->user->isSeller()) {
                $data['isSeller'] = true;

                // Now check if the Seller has already bought this lead or not
                $leadData['purchase_data'] = $this->model_leads_action->getPurchaseDetailsOfLeadById(array('lead_id' => $leadId, 'user_id' => $this->user->getId()));

                if(!empty($leadData['purchase_data'])) {
                    $data['lead']['purchase_date'] = date('d M Y',strtotime($leadData['purchase_data']['dataTime']));
                    $data['lead']['bought'] = true;
                } else {
                    // Show the Buy Button
                    $data['lead']['bought'] = false;
                    $data['lead']['buy'] = $this->url->link('leads/action/buy', 'lead=' . base64_encode($leadData['lead_id']) . $url);
                }

                if($leadData['status'] == 'approved') {
                    // Add a view Count, if not yet Purchased
                    if($data['lead']['bought'] == false) {
                        $this->model_leads_action->updateViews(array('lead_id' => $leadId));
                    }
                }

            }

            if(!empty($leadData['image_path'])) {

                $img = $this->model_tool_image->resize($leadData['image_path'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                // Resize Logic
                $data['lead']['image'] = $img;
            } else {
                $data['lead']['image'] = HTTPS_CATALOG.'image/no_image_placeholder.svg';
            }

            $data['breadcrumbs'][] = array(
                'text' => sprintf($this->language->get('heading_title'),''),
                'href' => $this->url->link('leads/action/'.$method, $url, true)
            );

            $data['breadcrumbs'][] = array(
                'text' => $data['heading_title'],
                'href' => $this->url->link('leads/action/view', $url, true)
            );

            $data['lead']['approve'] = $this->url->link('leads/action/approve', 'lead=' . base64_encode($leadData['lead_id']). $url);
            $data['lead']['reject'] = $this->url->link('leads/action/reject', 'lead=' . base64_encode($leadData['lead_id']). $url);
            $data['lead']['expire'] = $this->url->link('leads/action/expire', 'lead=' . base64_encode($leadData['lead_id']). $url);


        } else {
            // No Lead to Show
            $data['no_results'] = "No Leads to Show!";
        }

        $data['cancel'] = $this->url->link('leads/action/'.$method, $url, true);

        $data['entry_image'] = 'Image';
        $data['entry_lead'] = 'Lead Details';
        $data['entry_action'] = 'Action';
        $data['button_approve'] = $this->language->get('button_approve');
        $data['button_reject'] = $this->language->get('button_reject');
        $data['button_expire'] = $this->language->get('button_expire');

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('leads/view', $data));
    }


    public function buy() {

        if (isset($this->request->get['lead']) && $this->user->isSeller()) {

            $this->load->model('leads/action');

            $this->model_leads_action->buy(array('lead_id' => base64_decode($this->request->get['lead']), 'user_id' => $this->user->getId()));

            $this->session->data['success'] = 'Lead has been Purchased.';

            $url = '';

            if (isset($this->session->data['token'])) {
                $url .= '&token=' . $this->session->data['token'];
            }

            $this->response->redirect($this->url->link('leads/action/view', 'lead=' . ($this->request->get['lead']) . $url, true));
        }

        $this->session->data['warning'] = 'You don\'t have permission to Buy this Lead!';

        $this->getList();

    }

}
