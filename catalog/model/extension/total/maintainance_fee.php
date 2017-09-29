<?php
    class ModelExtensionTotalMaintainanceFee extends Model {
        public function getTotal($total) {
            if (($this->cart->getSubTotal() > $this->config->get('maintainance_fee_total')) && ($this->cart->getSubTotal() > 0)) {
                $this->load->language('extension/total/maintainance_fee');

                $total['totals'][] = array(
                    'code'       => 'maintainance_fee',
                    'title'      => $this->language->get('text_maintainance_fee'),
                    'percent'      => $this->config->get('maintainance_fee'),
                    'value'      => ($this->cart->getSubTotal() * ($this->config->get('maintainance_fee') / 100 )),
                    'sort_order' => $this->config->get('maintainance_fee_sort_order')
                );

                if ($this->config->get('maintainance_fee_tax_class_id')) {
                    $tax_rates = $this->tax->getRates($this->config->get('maintainance_fee'), $this->config->get('maintainance_fee_tax_class_id'));

                    foreach ($tax_rates as $tax_rate) {
                        if (!isset($total['taxes'][$tax_rate['tax_rate_id']])) {
                            $total['taxes'][$tax_rate['tax_rate_id']] = $tax_rate['amount'];
                        } else {
                            $total['taxes'][$tax_rate['tax_rate_id']] += $tax_rate['amount'];
                        }
                    }
                }

                $total['total'] += ($total['total'] * ($this->config->get('maintainance_fee') / 100 ));
            }
        }
    }