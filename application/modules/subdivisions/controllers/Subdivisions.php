<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Subdivisions extends MY_Controller {

    function __construct() {
        parent::__construct();

        if (!$this->ion_auth->in_role(7)) {
            show_error('Anda Tidak Memiliki Hak Untuk Mengakses Halaman Ini!!', 1, 'Error Hak Akses');
        }
    }

    public function index(){
        $this->load->model('divisions/divisions_m');

        $data['module']  = 'subdivisions';
        $data['title'] = 'Sub Bagian';
        $data['page']  = 'subdivisions_v';
        $data['divisions'] = $this->divisions_m->get('divisionID')->result();

        echo Modules::run('template/myTemp', $data);
    }

    public function ajax_list(){
        $this->load->model('subdivisions_m');
        $list = $this->subdivisions_m->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $value) {
            $no++;
            $row = array();
            $row[] = $value->subdivName;
            $row[] = $value->divisionName;

            if ($value->subdivStatus == 1) {
                $row[] = 'Aktif';
            }else{
                $row[] = 'Tidak Aktif';
            }

            //add html for action
            $row[] = '
                <button type="button" onclick="edit_subdiv('.$value->subdivID.')" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-pencil"></i></button>
                <button type="button" onclick="delete_subdiv('."'".$value->subdivID."'".')" class="btn btn-xs btn-danger"><i class="glyphicon glyphicon-trash"></i></button>';

            $data[] = $row;
        }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->subdivisions_m->count_all(),
            "recordsFiltered" => $this->subdivisions_m->count_filtered(),
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
        $this->form_validation->set_rules('subdivName', 'Nama', 'trim|is_unique[subdivisions.subdivName]|required|max_length[100]');
        $this->form_validation->set_rules('divisionID', 'Devisi', 'trim|required');
        $this->form_validation->set_rules('subdivStatus', 'Status', "trim|required|in_list[0,1]");
        if ($this->form_validation->run() === FALSE) {
            echo json_encode(array('st'=>0, 'msg'=>'ERROR: <br/>' . validation_errors()));
        }else{
            $data = array(
                'subdivName' => $this->input->post('subdivName'),
                'divisionID' => $this->input->post('divisionID'),
                'subdivStatus' => $this->input->post('subdivStatus'),
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
        if ($this->input->post('subdivName') != $this->get_where($this->input->post('id'))->row('subdivName')) {
            $this->form_validation->set_rules('subdivName', 'Nama', 'trim|required|is_unique[subdivisions.subdivName]|max_length[100]');
        }else{
            $this->form_validation->set_rules('subdivName', 'Nama', 'trim|required|max_length[100]');
        }
        $this->form_validation->set_rules('divisionID', 'Devisi', 'trim|required');
        $this->form_validation->set_rules('subdivStatus', 'Status', 'trim|required|in_list[0,1]');
        if ($this->form_validation->run() === FALSE) {
            echo json_encode(array('st'=>0, 'msg'=>'ERROR: <br/>' . validation_errors()));
        }else{
            $id = $this->input->post('id');
            $data = array(
                'subdivName' => $this->input->post('subdivName'),
                'divisionID' => $this->input->post('divisionID'),
                'subdivStatus' => $this->input->post('subdivStatus'),
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
        $this->load->model('subdivisions_m');
        $this->subdivisions_m->_update2($data);
    }

    /* ----- Fungsi-fungsi dasar ----- */
    private function get($order_by){
        $this->load->model('subdivisions_m');
        $query = $this->subdivisions_m->get($order_by);
        return $query;
    }

    private function get_with_limit($limit, $offset, $order_by) {
        $this->load->model('subdivisions_m');
        $query = $this->subdivisions_m->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    private function get_where($id){
        $this->load->model('subdivisions_m');
        $query = $this->subdivisions_m->get_where($id);
        return $query;
    }

    private function get_where_custom($col, $value, $order_by) {
        $this->load->model('subdivisions_m');
        $query = $this->subdivisions_m->get_where_custom($col, $value, $order_by);
        return $query;
    }

    private function _insert($data){
        $this->load->model('subdivisions_m');
        $this->subdivisions_m->_insert($data);
    }

    private function _update($id, $data){
        $this->load->model('subdivisions_m');
        $this->subdivisions_m->_update($id, $data);
    }

    private function _delete($id){
        $this->load->model('subdivisions_m');
        $this->subdivisions_m->_delete($id);
    }

    private function count_where($column, $value) {
        $this->load->model('subdivisions_m');
        $count = $this->subdivisions_m->count_where($column, $value);
        return $count;
    }

    private function get_max() {
        $this->load->model('subdivisions_m');
        $max_id = $this->subdivisions_m->get_max();
        return $max_id;
    }

    private function _custom_query($mysql_query) {
        $this->load->model('subdivisions_m');
        $query = $this->subdivisions_m->_custom_query($mysql_query);
        return $query;
    }

}
