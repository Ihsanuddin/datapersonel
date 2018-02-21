<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Divisions extends MY_Controller {

    function __construct() {
        parent::__construct();

        if (!$this->ion_auth->in_role(6)) {
            show_error('Anda Tidak Memiliki Hak Untuk Mengakses Halaman Ini!!', 1, 'Error Hak Akses');
        }
    }
 
    public function index(){
        $data['module']  = 'divisions';
        $data['title'] = 'Bagian';
        $data['page']  = 'divisions_v';

        echo Modules::run('template/myTemp', $data);
    }

    public function ajax_list(){
        $this->load->model('divisions_m');
        $list = $this->divisions_m->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $value) {
            $no++;
            $row = array();
            $row[] = $value->divisionName;
            $row[] = $value->divisionNote;

            //add html for action
            $row[] = '
                <button type="button" onclick="edit_division('.$value->divisionID.')" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-pencil"></i></button>
                <button type="button" onclick="delete_division('."'".$value->divisionID."'".')" class="btn btn-xs btn-danger"><i class="glyphicon glyphicon-trash"></i></button>';

            $data[] = $row;
        }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->divisions_m->count_all(),
            "recordsFiltered" => $this->divisions_m->count_filtered(),
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
        $this->form_validation->set_rules('divisionName', 'Nama', 'trim|required|is_unique[divisions.divisionName]|max_length[100]');
        $this->form_validation->set_rules('divisionNote', 'Keterangan', 'trim|required|max_length[100]');

        if ($this->form_validation->run() === FALSE) {
            echo json_encode(array('st'=>0, 'msg'=>'ERROR: <br/>' . validation_errors()));
        }else{
            $data = array(
                'divisionName' => $this->input->post('divisionName'),
                'divisionNote' => $this->input->post('divisionNote'),
                'createdDate'  => date('Y-m-d H:i:s'),
                'createdUserID'  => $this->ion_auth->user()->row()->user_id,
            );
            $insert = $this->_insert($data);

            $str = "Selesai!";
            echo json_encode(array('st' => 1, "status" => TRUE, 'msg' => $str));
        }
    }

    public function ajax_update(){
        if ($this->input->post('divisionName') != $this->get_where($this->input->post('id'))->row('divisionName')) {
            $this->form_validation->set_rules('divisionName', 'Nama', 'trim|required|is_unique[divisions.divisionName]|max_length[100]');
        }else{
            $this->form_validation->set_rules('divisionName', 'Nama', 'trim|required|max_length[100]');
        }

        $this->form_validation->set_rules('divisionNote', 'Keterangan', 'trim|required|max_length[100]');

        if ($this->form_validation->run() === FALSE) {
            echo json_encode(array('st'=>0, 'msg'=>'ERROR: <br/>' . validation_errors()));
        }else{
            $id = $this->input->post('id');
            $data = array(
                    'divisionName' => $this->input->post('divisionName'),
                    'divisionNote' => $this->input->post('divisionNote'),
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
        $this->load->model('divisions_m');
        $query = $this->divisions_m->get($order_by);
        return $query;
    }

    private function get_with_limit($limit, $offset, $order_by) {
        $this->load->model('divisions_m');
        $query = $this->divisions_m->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    private function get_where($id){
        $this->load->model('divisions_m');
        $query = $this->divisions_m->get_where($id);
        return $query;
    }

    private function get_where_custom($col, $value) {
        $this->load->model('divisions_m');
        $query = $this->divisions_m->get_where_custom($col, $value);
        return $query;
    }

    private function _insert($data){
        $this->load->model('divisions_m');
        $this->divisions_m->_insert($data);
    }

    private function _update($id, $data){
        $this->load->model('divisions_m');
        $this->divisions_m->_update($id, $data);
    }

    private function _delete($id){
        $this->load->model('divisions_m');
        $this->divisions_m->_delete($id);
    }

    private function count_where($column, $value) {
        $this->load->model('divisions_m');
        $count = $this->divisions_m->count_where($column, $value);
        return $count;
    }

    private function get_max() {
        $this->load->model('divisions_m');
        $max_id = $this->divisions_m->get_max();
        return $max_id;
    }

    private function _custom_query($mysql_query) {
        $this->load->model('divisions_m');
        $query = $this->divisions_m->_custom_query($mysql_query);
        return $query;
    }

}
