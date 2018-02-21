<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Userarea extends MY_Controller 
{

    function __construct() {
        parent::__construct();
    }

    public function index(){
        $data['module']  = 'userarea';
        $data['title'] = 'Userarea';
        $data['page']  = 'userarea_v';
        
        $this->load->model('Userarea_m');
        $query = $this->Userarea_m->get_where_join('userID', 1, 'outletName')->result();

        echo "<pre>";
            print_r($query);
        echo "</pre>";

        // echo Modules::run('template/myTemp', $data);
    }

    /*Kode Dasar*/
    function get($order_by){
        $this->load->model('Userarea_m');
        $query = $this->Userarea_m->get($order_by);
        return $query;
    }

    function get_with_limit($limit, $offset, $order_by) {
        $this->load->model('Userarea_m');
        $query = $this->Userarea_m->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    function get_where($id){
        $this->load->model('Userarea_m');
        $query = $this->Userarea_m->get_where($id);
        return $query;
    }

    function get_where_custom($col, $value, $order_by) {
        $this->load->model('Userarea_m');
        $query = $this->Userarea_m->get_where_custom($col, $value, $order_by);
        return $query;
    }

    function _insert($data){
        $this->load->model('Userarea_m');
        $this->Userarea_m->_insert($data);
    }

    function _update($id, $data){
        $this->load->model('Userarea_m');
        $this->Userarea_m->_update($id, $data);
    }

    function _delete($id){
        $this->load->model('Userarea_m');
        $this->Userarea_m->_delete($id);
    }

    function count_where($column, $value) {
        $this->load->model('Userarea_m');
        $count = $this->Userarea_m->count_where($column, $value);
        return $count;
    }

    function get_max() {
        $this->load->model('Userarea_m');
        $max_id = $this->Userarea_m->get_max();
        return $max_id;
    }

    function _custom_query($mysql_query) {
        $this->load->model('Userarea_m');
        $query = $this->Userarea_m->_custom_query($mysql_query);
        return $query;
    }

}