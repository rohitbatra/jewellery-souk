<?php
class ControllerTestConnect extends Controller {

    public function index()
    {
        // Get All filters from DB
        $filterArr = array();
        $sql_filter = $this->db->query("Select filter_id from `filter`");

        foreach($sql_filter->rows as $filter)
        {
          $filterArr[] = $filter['filter_id'];
        }

        $sql_category_select = $this->db->query("SELECT category_id FROM category WHERE category_id > '97' AND category_id < '132'");

        foreach($sql_category_select->rows as $category)
        {
          // Insert the Filters for this category

          foreach ($filterArr as $f)
          {
            //$this->db->query("INSERT into category_filter (category_id, filter_id) VALUES ('{$category['category_id']}','{$f}') ");
          }
        }



    }


}
