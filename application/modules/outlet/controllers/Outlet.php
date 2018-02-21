<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Outlet extends MY_Controller {

    function __construct() {
        parent::__construct();

        if (!$this->ion_auth->in_role(5)) {
            show_error('Anda Tidak Memiliki Hak Untuk Mengakses Halaman Ini!!', 1, 'Error Hak Akses');
        }
    }

    public function index(){
        $this->load->model('area/area_m');

        $data['module']  = 'outlet';
        $data['title'] = 'Sub Area Kerja';
        $data['page']  = 'outlet_v';
        $data['area'] = $this->area_m->get('areaID')->result();

        echo Modules::run('template/myTemp', $data);
    }

    public function ajax_list(){
        $this->load->model('Outlet_m');
        $list = $this->Outlet_m->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $value) {
            $no++;
            $row = array();
            $row[] = $value->outletName;
            $row[] = $value->areaName;

            if ($value->outletStatus == 1) {
                $row[] = 'Aktif';
            }else{
                $row[] = 'Tidak Aktif';
            }

            //add html for action
            $row[] = '
                <button type="button" onclick="edit_outlet('.$value->outletID.')" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-pencil"></i></button>
                <button type="button" onclick="delete_outlet('."'".$value->outletID."'".')" class="btn btn-xs btn-danger"><i class="glyphicon glyphicon-trash"></i></button>';

            $data[] = $row;
        }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->Outlet_m->count_all(),
            "recordsFiltered" => $this->Outlet_m->count_filtered(),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
    }

    public function ajax_edit($id){
        $data = $this->get_where($id)->row();
        echo json_encode($data);
    }

    public function ajax_add(){
        $this->form_validation->set_rules('outletName', 'Nama Outlet', 'trim|is_unique[outlet.outletName]|required|max_length[45]');
        $this->form_validation->set_rules('outletAddress', 'Alamat Outlet', 'trim|required|max_length[100]');
        $this->form_validation->set_rules('areaID', 'Area', 'trim|required');
        $this->form_validation->set_rules('outletStatus', 'outlet Status', "trim|required|in_list[0,1]");
        if ($this->form_validation->run() === FALSE) {
            echo json_encode(array('st'=>0, 'msg'=>'ERROR: <br/>' . validation_errors()));
        }else{
            $data = array(
                'outletName' => $this->input->post('outletName'),
                'outletAddress' => $this->input->post('outletAddress'),
                'areaID' => $this->input->post('areaID'),
                'outletStatus' => $this->input->post('outletStatus'),
                'createdDate'  => date('Y-m-d H:i:s'),
                'createdUserID'  => $this->ion_auth->user()->row()->user_id,
            );
            $insert = $this->_insert($data);

            $message = array(
                'st' => 1,
                "status" => TRUE,
                'msg' => "sukses!",
            );
            echo json_encode($message);
        }
    }

    public function ajax_update(){
        if ($this->input->post('outletName') != $this->get_where($this->input->post('id'))->row('outletName')) {
            $this->form_validation->set_rules('outletName', 'Nama Kategori', 'trim|required|is_unique[outlet.outletName]|max_length[45]');
        }else{
            $this->form_validation->set_rules('outletName', 'Nama Kategori', 'trim|required|max_length[45]');
        }
        $this->form_validation->set_rules('outletAddress', 'Alamat Outlet', 'trim|required|max_length[100]');
        $this->form_validation->set_rules('areaID', 'Area', 'trim|required');
        $this->form_validation->set_rules('outletStatus', 'outlet Status', 'trim|required|in_list[0,1]');
        if ($this->form_validation->run() === FALSE) {
            echo json_encode(array('st'=>0, 'msg'=>'ERROR: <br/>' . validation_errors()));
        }else{
            $id = $this->input->post('id');
            $data = array(
                'outletName' => $this->input->post('outletName'),
                'outletAddress' => $this->input->post('outletAddress'),
                'areaID' => $this->input->post('areaID'),
                'outletStatus' => $this->input->post('outletStatus'),
                'createdDate'  => date('Y-m-d H:i:s'),
                'createdUserID'  => $this->ion_auth->user()->row()->user_id,
            );
            $this->_update($id, $data);

            $message = array(
                'st' => 1,
                "status" => TRUE,
                'msg' => "sukses!",
            );
            echo json_encode($message);
        }

    }

    public function ajax_delete($id){
        $this->_delete($id);
        echo json_encode(array("status" => TRUE));
    }

    public function updateFormDate(){
        $date = date("Y-m-d");
        $date1 = str_replace('-', '/', $date);
        $tomorrow = date('Y-m-d',strtotime($date1 . "+1 days"));

        $data = array(
            'formDate' => $tomorrow,
            'lastFormDate' => $date,
            'lastUpdateFormDate' => date("Y-m-d"),
        );

        $this->_update2($data);
    }

    function _update2($data){
        $this->load->model('Outlet_m');
        $this->Outlet_m->_update2($data);
    }

    /* ----- Fungsi-fungsi dasar ----- */
    private function get($order_by){
        $this->load->model('Outlet_m');
        $query = $this->Outlet_m->get($order_by);
        return $query;
    }

    private function get_with_limit($limit, $offset, $order_by) {
        $this->load->model('Outlet_m');
        $query = $this->Outlet_m->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    private function get_where($id){
        $this->load->model('Outlet_m');
        $query = $this->Outlet_m->get_where($id);
        return $query;
    }

    private function get_where_custom($col, $value, $order_by) {
        $this->load->model('Outlet_m');
        $query = $this->Outlet_m->get_where_custom($col, $value, $order_by);
        return $query;
    }

    private function _insert($data){
        $this->load->model('Outlet_m');
        $this->Outlet_m->_insert($data);
    }

    private function _update($id, $data){
        $this->load->model('Outlet_m');
        $this->Outlet_m->_update($id, $data);
    }

    private function _delete($id){
        $this->load->model('Outlet_m');
        $this->Outlet_m->_delete($id);
    }

    private function count_where($column, $value) {
        $this->load->model('Outlet_m');
        $count = $this->Outlet_m->count_where($column, $value);
        return $count;
    }

    private function get_max() {
        $this->load->model('Outlet_m');
        $max_id = $this->Outlet_m->get_max();
        return $max_id;
    }

    private function _custom_query($mysql_query) {
        $this->load->model('Outlet_m');
        $query = $this->Outlet_m->_custom_query($mysql_query);
        return $query;
    }

}
