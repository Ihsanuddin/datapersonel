<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Area extends MY_Controller {

    function __construct() {
        parent::__construct();

        if (!$this->ion_auth->in_role(4)) {
            show_error('Anda Tidak Memiliki Hak Untuk Mengakses Halaman Ini!!', 1, 'Error Hak Akses');
        }
    }
 
    public function index(){
        $data['module']  = 'area';
        $data['title'] = 'Area';
        $data['page']  = 'area_v';

        echo Modules::run('template/myTemp', $data);
    }

    public function ajax_list(){
        $this->load->model('area_m');
        $list = $this->area_m->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $value) {
            $no++;
            $row = array();
            $row[] = $value->areaName;
            $row[] = $value->areaNote;

            //add html for action
            $row[] = '
                <button type="button" onclick="edit_area('.$value->areaID.')" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-pencil"></i></button>
                <button type="button" onclick="delete_area('."'".$value->areaID."'".')" class="btn btn-xs btn-danger"><i class="glyphicon glyphicon-trash"></i></button>';

            $data[] = $row;
        }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->area_m->count_all(),
            "recordsFiltered" => $this->area_m->count_filtered(),
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
        $this->form_validation->set_rules('areaName', 'Nama Area', 'trim|required|is_unique[area.areaName]|max_length[45]');
        $this->form_validation->set_rules('areaNote', 'Keterangan Area', 'trim|required|max_length[100]');

        if ($this->form_validation->run() === FALSE) {
            echo json_encode(array('st'=>0, 'msg'=>'ERROR: <br/>' . validation_errors()));
        }else{
            $data = array(
                'areaName' => $this->input->post('areaName'),
                'areaNote' => $this->input->post('areaNote'),
                'createdDate'  => date('Y-m-d H:i:s'),
                'createdUserID'  => $this->ion_auth->user()->row()->user_id,
            );
            $insert = $this->_insert($data);

            $str = "Selesai!";
            echo json_encode(array('st' => 1, "status" => TRUE, 'msg' => $str));
        }
    }

    public function ajax_update(){
        if ($this->input->post('areaName') != $this->get_where($this->input->post('id'))->row('areaName')) {
            $this->form_validation->set_rules('areaName', 'Nama Area', 'trim|required|is_unique[area.areaName]|max_length[45]');
        }else{
            $this->form_validation->set_rules('areaName', 'Nama Area', 'trim|required|max_length[45]');
        }

        $this->form_validation->set_rules('areaNote', 'Keterangan Area', 'trim|required|max_length[100]');

        if ($this->form_validation->run() === FALSE) {
            echo json_encode(array('st'=>0, 'msg'=>'ERROR: <br/>' . validation_errors()));
        }else{
            $id = $this->input->post('id');
            $data = array(
                    'areaName' => $this->input->post('areaName'),
                    'areaNote' => $this->input->post('areaNote'),
                    'createdDate'  => date('Y-m-d H:i:s'),
                    'createdUserID'  => $this->ion_auth->user()->row()->user_id,
            );
            $this->_update($id, $data);
            $str = "Selesai!";
            echo json_encode(array('st' => 1, "status" => TRUE, 'msg' => $str));
        }

    }

    public function ajax_delete($id){
        $this->_delete($id);
        echo json_encode(array("status" => TRUE));
    }

    /* ----- Fungsi-fungsi dasar ----- */
    private function get($order_by){
        $this->load->model('area_m');
        $query = $this->area_m->get($order_by);
        return $query;
    }

    private function get_with_limit($limit, $offset, $order_by) {
        $this->load->model('area_m');
        $query = $this->area_m->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    private function get_where($id){
        $this->load->model('area_m');
        $query = $this->area_m->get_where($id);
        return $query;
    }

    private function get_where_custom($col, $value) {
        $this->load->model('area_m');
        $query = $this->area_m->get_where_custom($col, $value);
        return $query;
    }

    private function _insert($data){
        $this->load->model('area_m');
        $this->area_m->_insert($data);
    }

    private function _update($id, $data){
        $this->load->model('area_m');
        $this->area_m->_update($id, $data);
    }

    private function _delete($id){
        $this->load->model('area_m');
        $this->area_m->_delete($id);
    }

    private function count_where($column, $value) {
        $this->load->model('area_m');
        $count = $this->area_m->count_where($column, $value);
        return $count;
    }

    private function get_max() {
        $this->load->model('area_m');
        $max_id = $this->area_m->get_max();
        return $max_id;
    }

    private function _custom_query($mysql_query) {
        $this->load->model('area_m');
        $query = $this->area_m->_custom_query($mysql_query);
        return $query;
    }

}
