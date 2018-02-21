<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Userarea_m extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function get_where_join($col, $value, $order_by) {
        $table = $this->get_table();
        $this->db->select('*');
        $this->db->from("$table uo");
        $this->db->join("outlet o", "o.outletID = uo.outletID");
        $this->db->order_by("o.$order_by");
        $this->db->where("uo.$col", $value);
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

    function get_outletuser($usrID='',$outletID='', $areaID='')
    {
        $where3 = '';
        if (!empty($areaID)) {
            $where3 = "AND `a`.`areaID` = '$areaID'";
        }
        $where2 = '';
        if (!empty($outletID)) {
            $where2 = "AND `o`.`outletID` = '$outletID'";
        }
        $where1 = '';
        if (!empty($usrID)) {
            $where1 = "WHERE `o`.`areaID` IN ( SELECT `areaID` FROM `userarea` WHERE `userID` = '$usrID') ";
        }
        $sql = "SELECT `o`.* ,`a`.`areaName`
                FROM `outlet` `o` 
                JOIN `area` `a`  ON `a`.`areaID` = `o`.`areaID`
                ".$where1.$where2.$where3;

        return $this->_custom_query($sql);
    }

    public function get_areauser($usrID='')
    {
        $sql = "SELECT * FROM `area` WHERE areaID IN (SELECT areaID FROM userarea WHERE userID = $usrID)";
        return $this->_custom_query($sql);
    }

    /*Kode Dasar*/
    function get_table() {
        $table = "userarea";
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
        $this->db->where('userareaID', $id);
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
        $this->db->where('userareaID', $id);
        $this->db->update($table, $data);
    }

    function _delete($id){
        $table = $this->get_table();
        $this->db->where('userareaID', $id);
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
        $this->db->select_max('userareaID');
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
