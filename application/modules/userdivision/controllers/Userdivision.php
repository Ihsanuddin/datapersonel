<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Userdivision extends MY_Controller 
{

    function __construct() {
        parent::__construct();
    }

    public function index(){
        $data['module']  = 'userdivision';
        $data['title'] = 'User Divisi';
        $data['page']  = 'userdivision_v';
        
        $this->load->model('Userdivision_m');
        $query = $this->Userdivision_m->get_where_join('userID', 1, 'outletName')->result();

        echo "<pre>";
            print_r($query);
        echo "</pre>";

        // echo Modules::run('template/myTemp', $data);
    }

    public function load_userdivision_edit($userID=''){
        $this->load->model('userarea/userarea_m');
        $this->load->model('users/users_m');
        $this->load->model('userdivision/userdivision_m');
        $this->load->model('divisions/divisions_m');
        $this->load->model('area/area_m');

        $user = $this->ion_auth->user()->row();

        $detail_user = $this->users_m->get_where($userID)->row();

        $get_divisi = $this->divisions_m->get('divisionID')->result();
        $get_area = $this->area_m->get('areaID')->result();

        $selected_divisi = $this->get_where_custom('userID', $userID, 'divisionID')->result();
        $selected_area = $this->userarea_m->get_where_custom('userID', $userID, 'areaID')->result();
       
        $data['get_divisi'] = $get_divisi;
        $data['get_area']   = $get_area;
        $data['selected_divisi']   = $selected_divisi;
        $data['selected_area']   = $selected_area;

        $data['detail_user'] = $detail_user;

        $data['title'] = 'Pengaturan hak akses user';

        $this->load->view('load_userdivision_v', $data);
    }

    public function userdivision_edit($userID=''){
        $this->load->model('userarea/userarea_m');
        $this->load->model('users/users_m');
        $this->load->model('userdivision/userdivision_m');
        $this->load->model('divisions/divisions_m');
        $this->load->model('area/area_m');

        $user = $this->ion_auth->user()->row();

        $detail_user = $this->users_m->get_where($userID)->row();

        $get_divisi = $this->divisions_m->get('divisionID')->result();
        $get_area = $this->area_m->get('areaID')->result();

        $selected_divisi = $this->get_where_custom('userID', $userID, 'divisionID')->result();
        $selected_area = $this->userarea_m->get_where_custom('userID', $userID, 'areaID')->result();
       
        $data['get_divisi'] = $get_divisi;
        $data['get_area']   = $get_area;
        $data['selected_divisi']   = $selected_divisi;
        $data['selected_area']   = $selected_area;

        $data['detail_user'] = $detail_user;

        $data['module']  = 'userdivision';
        $data['title'] = 'Pengaturan hak akses user';
        $data['page']  = 'userdivision_v';

        $data['outlet'] = $this->userarea_m->get_outletuser($user->id)->result();

        echo Modules::run('template/myTemp', $data);
    }

    public function process_edit(){
        $this->load->model('userarea/userarea_m');
        $this->load->model('users/users_m');
        $this->load->model('userdivision/userdivision_m');
        $this->load->model('divisions/divisions_m');
        $this->load->model('area/area_m');

        $user = $this->ion_auth->user()->row();
        
        $userID = $this->input->post('userid');
        $area   = $this->input->post('area');
        $divisi = $this->input->post('divisi');

        $this->form_validation->set_rules("userid", "User ID", "trim|required");

        if (empty($area)) {
                $this->form_validation->set_rules("validation", "Area Kerja belum dipilih", "trim|required");
        }

        if (empty($divisi)) {
                $this->form_validation->set_rules("validation2", "Bagian belum dipilih", "trim|required");
        }
        

        if ($this->form_validation->run($this) === FALSE) {
            echo json_encode(array('st'=>0, 'msg'=>"ERROR: <br/>" . validation_errors()));
        }else{
            $selected_area = array();
            foreach ($area as $key => $val) {
                $selected_area[]= $val;
            }
            $selected_area = implode(',', $selected_area);

            $sql  = "SELECT * FROM userarea
                    WHERE `areaID` NOT IN ($selected_area)
                    AND `userID` = '$userID'";

            $unselect_area = $this->_custom_query($sql)->result();

            if (!empty($unselect_area)) {
                foreach ($unselect_area as $key => $val) {
                    $this->userarea_m->_delete($val->userareaID);
                }
            }

            $i=0;
            $dataUserArea='';
            foreach ($area as $key => $val) {
                //cek subproker
                $cek_userarea = $this->userarea_m->get_where_double_custom('userID', $userID, 'areaID', $val, 'userareaID');
                if ($cek_userarea->num_rows() == 0) {
                    $dataUserArea[$i]['userID'] = $userID;
                    $dataUserArea[$i]['areaID'] = $val;
                    $i++;
                }
                
            }
            if (!empty($dataUserArea)) {
                $this->userarea_m->_insert_batch($dataUserArea);
            }

            $selected_divisi = array();
            foreach ($divisi as $key => $val) {
                $selected_divisi[]= $val;
            }
            $selected_divisi = implode(',', $selected_divisi);

            $sql  = "SELECT * FROM userdivision
                    WHERE `divisionID` NOT IN ($selected_divisi)
                    AND `userID` = '$userID'";

            $unselect_divisi = $this->_custom_query($sql)->result();

            if (!empty($unselect_divisi)) {
                foreach ($unselect_divisi as $key => $val) {
                    $this->userdivision_m->_delete($val->userdivisionID);
                }
            }

            $i=0;
            $dataUserDivision='';
            foreach ($divisi as $key => $val) {
                //cek subproker
                $cek_userarea = $this->userdivision_m->get_where_double_custom('userID', $userID, 'divisionID', $val, 'userdivisionID');
                if ($cek_userarea->num_rows() == 0) {
                    $dataUserDivision[$i]['userID'] = $userID;
                    $dataUserDivision[$i]['divisionID'] = $val;
                    $i++;
                }
                
            }
            if (!empty($dataUserDivision)) {
                $this->userdivision_m->_insert_batch($dataUserDivision);
            }

            $message = array('st' => 1, 'msg' => 'sukses!');
            echo json_encode($message);
        }
    }

    /*Kode Dasar*/
    function get($order_by){
        $this->load->model('Userdivision_m');
        $query = $this->Userdivision_m->get($order_by);
        return $query;
    }

    function get_with_limit($limit, $offset, $order_by) {
        $this->load->model('Userdivision_m');
        $query = $this->Userdivision_m->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    function get_where($id){
        $this->load->model('Userdivision_m');
        $query = $this->Userdivision_m->get_where($id);
        return $query;
    }

    function get_where_custom($col, $value, $order_by) {
        $this->load->model('Userdivision_m');
        $query = $this->Userdivision_m->get_where_custom($col, $value, $order_by);
        return $query;
    }

    function _insert($data){
        $this->load->model('Userdivision_m');
        $this->Userdivision_m->_insert($data);
    }

    function _update($id, $data){
        $this->load->model('Userdivision_m');
        $this->Userdivision_m->_update($id, $data);
    }

    function _delete($id){
        $this->load->model('Userdivision_m');
        $this->Userdivision_m->_delete($id);
    }

    function count_where($column, $value) {
        $this->load->model('Userdivision_m');
        $count = $this->Userdivision_m->count_where($column, $value);
        return $count;
    }

    function get_max() {
        $this->load->model('Userdivision_m');
        $max_id = $this->Userdivision_m->get_max();
        return $max_id;
    }

    function _custom_query($mysql_query) {
        $this->load->model('Userdivision_m');
        $query = $this->Userdivision_m->_custom_query($mysql_query);
        return $query;
    }

}