<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Rolesgroups_m extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function _delete_double($col1, $val1, $col2, $val2){
        $table = $this->get_table();
        $this->db->where($col1, $val1);
        $this->db->where($col2, $val2);
        $this->db->delete($table);
    }

    public function get_roles_groups($id=FALSE){
        $table = $this->get_table();

        $this->db->select("rg.group_id as id, g.name, g.description");
        $this->db->from("$table rg");
        $this->db->join("groups g", "rg.group_id = g.id");
        $this->db->where("rg.roleID", $id);
        $query=$this->db->get();

        return $query;
    }

    function _delete_where($col, $val){
        $table = $this->get_table();
        $this->db->where($col, $val);
        $this->db->delete($table);
    }

    function _insert_batch($data){
        $table = $this->get_table();
        $this->db->insert_batch($table, $data);
    }

    /*Kode Dasar*/
    function get_table() {
        $table = "roles_groups";
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
        $this->db->where('id', $id);
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
        $this->db->where('id', $id);
        $this->db->update($table, $data);
    }

    function _delete($id){
        $table = $this->get_table();
        $this->db->where('id', $id);
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
        $this->db->select_max('id');
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
