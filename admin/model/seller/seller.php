<?php
class ModelSellerSeller extends Model {

	public function getSellers($data = array()) {

		$sql = "SELECT u.*, ug.name as seller_type FROM `" . DB_PREFIX . "user` AS u LEFT JOIN `" . DB_PREFIX . "user_group` ug ON (u.user_group_id = ug.user_group_id) WHERE LOWER(ug.name) NOT LIKE 'administrator' AND LOWER(ug.name) NOT LIKE 'moderator' ";

		if (isset($data['filter_email']))
		{
			$sql .= " AND u.email LIKE '". $data['filter_email'] ."'";
		}

		if (isset($data['filter_status']))
		{
			$sql .= " AND u.status LIKE '". (int)$data['filter_status'] ."'";
		}

		if (isset($data['filter_seller_type']))
		{
			$sql .= " AND u.user_group_id = '". (int)$data['filter_seller_type'] ."'";
		}

		$sql .= " ORDER BY username";

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

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

	public function getTotalSellers($data = array()) {

		$sql = "SELECT count(u.user_id) as total FROM `" . DB_PREFIX . "user` AS u LEFT JOIN `" . DB_PREFIX . "user_group` ug ON (u.user_group_id = ug.user_group_id) WHERE LOWER(ug.name) NOT LIKE 'administrator' AND LOWER(ug.name) NOT LIKE 'moderator'";


		if (isset($data['filter_email']))
		{
			$sql .= " AND u.email LIKE '". $data['filter_email'] ."'";
		}

		if (isset($data['filter_status']))
		{
			$sql .= " AND u.status LIKE '". (int)$data['filter_status'] ."'";
		}

		if (isset($data['filter_seller_type']))
		{
			$sql .= " AND u.user_group_id = '". (int)$data['filter_seller_type'] ."'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getSellerTypes() {
		$query = $this->db->query("SELECT s.name as name, s.user_group_id as id FROM `" . DB_PREFIX . "user_group` AS s WHERE LOWER(s.name) NOT LIKE 'administrator' AND LOWER(s.name) NOT LIKE 'moderator' ");
		return $query->rows;
	}

	public function enableSeller($seller_id) {
		$this->db->query("UPDATE `" . DB_PREFIX . "user` SET `status` = '1' WHERE user_id = '". (int)$seller_id ."' ");
	}

	public function disableSeller($seller_id) {
		$this->db->query("UPDATE `" . DB_PREFIX . "user` SET `status` = '0' WHERE user_id = '". (int)$seller_id ."' ");
	}

	public function getSeller($seller_id) {
		$query = $this->db->query("SELECT u.*, ug.* FROM `" . DB_PREFIX . "user` AS u LEFT JOIN `" . DB_PREFIX . "user_group` ug ON (u.user_group_id = ug.user_group_id) WHERE u.user_id = '" . (int)$seller_id . "'");

		return $query->row;
	}

	public function getSellerDetails($seller_id) {
		$retArr = array();
		$query = $this->db->query("SELECT si.* FROM `" . DB_PREFIX . "seller_info` AS si WHERE si.user_id = '" . (int)$seller_id . "'");

		foreach($query->rows as $row)
		{
			$retArr[$row['key']] = $row['value'];
		}
		return $retArr;
	}

	public function getSellerPaymentTransactions($seller_id) {
		$query = $this->db->query("SELECT sp.amount, sp.payment_date, sp.payment_status, sp.payment_id, sp.extra_data, DATE(sp.dataTime) as date_modified FROM `" . DB_PREFIX . "seller_payments` AS sp WHERE sp.user_id = '" . (int)$seller_id . "'");

		return $query->rows;
	}

	public function editSeller($seller_id,$data) {

		// Update the USER table
		if(array_key_exists('company_p_firstname', $data))
		{
			$firstname = $data['company_p_firstname'];
		}else{
			$firstname = $data['firstname'];
		}

		if(array_key_exists('company_p_lastname', $data))
		{
			$lastname = $data['company_p_lastname'];
		}else{
			$lastname = $data['lastname'];
		}

		$this->db->query("UPDATE `" . DB_PREFIX . "user` SET `user_group_id` = '". (int)$data['seller_type_id'] ."', username = '".$this->db->escape($data['username'])."', status = '".(int) $data['status']."', email = '".$this->db->escape($data['email'])."', firstname = '".$this->db->escape($firstname)."', lastname = '".$this->db->escape($lastname)."', salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "' WHERE user_id = '". (int)$seller_id ."'  ");

		// Update the Seller Info
		foreach ($data as $key => $value) {
			$select_query = $this->db->query("Select id FROM `" . DB_PREFIX . "seller_info` WHERE user_id = '". (int)$seller_id ."' AND `key` LIKE '".$this->db->escape($key)."' ");

			if($select_query->rows)
			{
				$this->db->query("UPDATE `" . DB_PREFIX . "seller_info` SET `value` = '". $this->db->escape($value) ."' WHERE id = '".(int) $select_query->row['id']."' AND user_id = '". (int)$seller_id ."'");
			}
		}

	}

}
