<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Userdivision_m extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function get_where_join($col, $value, $order_by) {
        $table = $this->get_table();
        $this->db->select('*');
        $this->db->from("$table sd");
        $this->db->join("divisions d", "d.divisionID = sd.divisionID");
        $this->db->order_by("sd.$order_by");
        $this->db->where("sd.$col", $value);
        $query=$this->db->get();
        return $query;
    }

    function _insert_batch($data){
        $table = $this->get_table();
        $this->db->insert_batch($table, $data);
    }

    function _delete_where($col, $val){
        $table = $this->get_table();
        $this->db->where($col, $val);
        $this->db->delete($table);
    }
    
    function _delete_where_double_custom($col1, $val1, $col2, $val2){
        $table = $this->get_table();
        $this->db->where($col1, $val1);
        $this->db->where($col2, $val2);
        $this->db->delete($table);

        return true;
    }

    function get_user_division($usrID='',$subdivID='')
    {
        $where1 = '';
        if (!empty($usrID)) {
            $where1 = "AND `sd`.`divisionID` IN ( SELECT `divisionID` FROM `userdivision` WHERE `userID` = '$usrID') ";
        }

        $where2 = '';
        if (!empty($subdivID)) {
            $where2 = "AND `sd`.`subdivID` = '$subdivID'";
        }
        $sql = "SELECT `sd`.* ,`d`.`divisionName`,`d`.`divisionNote` FROM `subdivisions` `sd` 
                JOIN `divisions` `d`  ON `d`.`divisionID` = `sd`.`divisionID`
                WHERE `sd`.`subdivStatus` = 1
                ".$where1.$where2;
                
        $sql .= "ORDER BY `order`, `subdivID`";

        return $this->_custom_query($sql);
    }

    /*Kode Dasar*/
    function get_table() {
        $table = "userdivision";
        return $table;
    }

    function get($order_by){
        $table = $this->get_table();
        $this->db->order_by($order_by);
        $query=$this->db->get($table);
        return $query;
    }

    function get_with_limit($limit, $offset, $order_by) {
        $table = $this->get_table();
        $this->db->limit($limit, $offset);
        $this->db->order_by($order_by);
        $query=$this->db->get($table);
        return $query;
    }

    function get_where($id){
        $table = $this->get_table();
        $this->db->where('userdivisionID', $id);
        $query=$this->db->get($table);
        return $query;
    }

    function get_where_custom($col, $value, $order_by) {
        $table = $this->get_table();
        $this->db->order_by($order_by);
        $this->db->where($col, $value);
        $query=$this->db->get($table);
        return $query;
    }

    function get_where_double_custom($col1, $val1, $col2, $val2, $order_by){
        $table = $this->get_table();
        $this->db->order_by($order_by);
        $this->db->where($col1, $val1);
        $this->db->where($col2, $val2);
        $query=$this->db->get($table);
        return $query;
    }

    function _insert($data){
        $table = $this->get_table();
        $this->db->insert($table, $data);
    }

    function _update($id, $data){
        $table = $this->get_table();
        $this->db->where('userdivisionID', $id);
        $this->db->update($table, $data);
    }

    function _delete($id){
        $table = $this->get_table();
        $this->db->where('userdivisionID', $id);
        $this->db->delete($table);
    }

    function count_where($column, $value) {
        $table = $this->get_table();
        $this->db->where($column, $value);
        $query=$this->db->get($table);
        $num_rows = $query->num_rows();
        return $num_rows;
    }

    function count_all() {
        $table = $this->get_table();
        $query=$this->db->get($table);
        $num_rows = $query->num_rows();
        return $num_rows;
    }

    function get_max() {
        $table = $this->get_table();
        $this->db->select_max('userdivisionID');
        $query = $this->db->get($table);
        $row=$query->row();
        $id=$row->id;
        return $id;
    }

    function _custom_query($mysql_query) {
        $query = $this->db->query($mysql_query);
        return $query;
    }

}
