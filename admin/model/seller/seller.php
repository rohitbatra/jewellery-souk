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

	public function enableSeller($user_id) {
		$this->db->query("UPDATE `" . DB_PREFIX . "user` SET `status` = '1' WHERE user_id = '". (int)$user_id ."' ");
	}

	public function disableSeller($user_id) {
		$this->db->query("UPDATE `" . DB_PREFIX . "user` SET `status` = '0' WHERE user_id = '". (int)$user_id ."' ");
	}

}
