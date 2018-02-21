<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Bagan extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('bagan_m');
        // if (!$this->ion_auth->in_role(7)) {
        //     show_error('Anda Tidak Memiliki Hak Untuk Mengakses Halaman Ini!!', 1, 'Error Hak Akses');
        // }
    }

    public function index(){
        $data['module']  = 'bagan';
        $data['title'] = 'Struktur Organisasi';
        $data['page']  = 'bagan_v';
        $data['parent'] = $this->get('baganID')->result();

        echo Modules::run('template/myTemp', $data);
    }

    public function daftarbagan(){
        $data['module']  = 'bagan';
        $data['title'] = 'Daftar Isi bagan';
        $data['page']  = 'daftarbagan_v';
        $data['parent'] = $this->get('baganID')->result();

        echo Modules::run('template/myTemp', $data);
    }

    public function load_daftarbagan(){
        $this->load->model('bagan/bagan_m');
        $user = $this->ion_auth->user()->row();

        $data['title'] = 'Daftar Isi bagan';

        $this->load->view('load_daftarbagan_v', $data);
    }

    public function ajax_list(){
        $this->load->model('bagan_m');
        $list = $this->bagan_m->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $value) {
            $no++;
            $row = array();
            $row[] = $value->baganID;
            $row[] = $value->child;
            if (!empty($value->parent)) {
                $row[] = "$value->parent";
            }else{
                $row[] = "-";
            }
            $row[] = $value->class;
            $row[] = $value->order;

            //add html for action
            if ($value->baganID == 1) {
                $row[] = '';
            }else{
                $row[] = '
                    <button type="button" onclick="edit_bagan('.$value->baganID.')" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-pencil"></i></button>
                    <button type="button" onclick="delete_bagan('."'".$value->baganID."'".')" class="btn btn-xs btn-danger"><i class="glyphicon glyphicon-trash"></i></button>';
            }
            $data[] = $row;
        }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->bagan_m->count_all(),
            "recordsFiltered" => $this->bagan_m->count_filtered(),
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
        $this->form_validation->set_rules('baganName', 'Nama Bagian', 'trim|is_unique[bagan.baganName]|required|max_length[150]');
        $this->form_validation->set_rules('class', 'Class', 'trim|required|numeric|greater_than[0]');
        $this->form_validation->set_rules('order', 'Order', "trim|required|numeric|greater_than[0]");
        if ($this->form_validation->run() === FALSE) {
            echo json_encode(array('st'=>0, 'msg'=>'ERROR: <br/>' . validation_errors()));
        }else{
            // echo $this->input->post('parentID');
            $data = array(
                'baganName' => $this->input->post('baganName'),
                'parentID' => $this->input->post('parentID'),
                'class' => $this->input->post('class'),
                'order' => $this->input->post('order'),
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
        if ($this->input->post('baganName') != $this->get_where($this->input->post('id'))->row('baganName')) {
            $this->form_validation->set_rules('baganName', 'Nama Bagian', 'trim|required|is_unique[bagan.baganName]|max_length[150]');
        }else{
            $this->form_validation->set_rules('baganName', 'Nama Bagian', 'trim|required|max_length[150]');
        }
        $this->form_validation->set_rules('class', 'Class', 'trim|required|numeric|greater_than[0]');
        $this->form_validation->set_rules('order', 'Order', "trim|required|numeric|greater_than[0]");
        if ($this->form_validation->run() === FALSE) {
            echo json_encode(array('st'=>0, 'msg'=>'ERROR: <br/>' . validation_errors()));
        }else{
            $id = $this->input->post('id');
            $data = array(
                'baganName' => $this->input->post('baganName'),
                'parentID' => $this->input->post('parentID'),
                'class' => $this->input->post('class'),
                'order' => $this->input->post('order'),
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

    // public function updateFormDate(){
    //     $date = date("Y-m-d");
    //     $date1 = str_replace('-', '/', $date);
    //     $tomorrow = date('Y-m-d',strtotime($date1 . "+1 days"));

    //     $data = array(
    //         'formDate' => $tomorrow,
    //         'lastFormDate' => $date,
    //         'lastUpdateFormDate' => date("Y-m-d"),
    //     );

    //     $this->_update2($data);
    // }

    // function _update2($data){
    //     $this->load->model('bagan_m');
    //     $this->bagan_m->_update2($data);
    // }
    public function coba($value='')
    {
        $this->load->library('word');
    
        $PHPWord = $this->word; // New Word Document
        $section = $PHPWord->createSection(); // New portrait section
        // Add text elements
        $section->addText('Hello World!');
        $section->addTextBreak(2);
        $section->addText('Mohammad Rifqi Sucahyo.', array('name'=>'Verdana', 'color'=>'006699'));
        $section->addTextBreak(2);
        $PHPWord->addFontStyle('rStyle', array('bold'=>true, 'italic'=>true, 'size'=>16));
        $PHPWord->addParagraphStyle('pStyle', array('align'=>'center', 'spaceAfter'=>100));
        // Save File / Download (Download dialog, prompt user to save or simply open it)
        $section->addText('Ini Adalah Demo PHPWord untuk CI', 'rStyle', 'pStyle');
        
        $filename='just_some_random_name.docx'; //save our document as this file name
        header('Content-Type: application/vnd.openxmlformats-officedocument.wordprocessingml.document'); //mime type
        header('Content-Disposition: attachment;filename="'.$filename.'"'); //tell browser what's the file name
        header('Cache-Control: max-age=0'); //no cache
        $objWriter = PHPWord_IOFactory::createWriter($PHPWord, 'Word2007');
        $objWriter->save('php://output');
    }

    public function load_preview_bagan()
    {
        $this->load->model('bagan/bagan_m');
        $user = $this->ion_auth->user()->row();

        $data['title'] = 'Preview Struktur Organisasi';

        $this->load->view('load_bagan_preview_v', $data);
    }

public function pdf_bagan()
{
    $this->load->library('mpdf');
    
    $user = $this->ion_auth->user()->row();
    
    $data['format'] = 'A4-L';
    $data['font_size'] = 10;
    $data['font_family'] = '';
    $data['margin_left'] = 10;
    $data['margin_right'] = 10;
    $data['margin_top'] = 15;
    $data['margin_bottom'] = 11;
    $data['margin_header'] = 20;
    $data['margin_footer'] = 9;

    $data['user'] = $user;

    $data['title'] = 'Laporan Program Kerja';

    $this->load->view('pdf_bagan_v',$data);
}

public function testpdf()
{
    $this->load->view('testpdf_v');
}

function get_duplicates ($array) {
    return array_unique( array_diff_assoc( $array, array_unique( $array ) ) );
}

public function empty_check($val, $empty_check){
    if ($empty_check) {
        return TRUE;
    }else{
        $this->form_validation->set_message('empty_check', 'Belum ada bagan yang ditambahkan!');
        return FALSE;
    }
}

public function doubleinput_check($val){
    $this->form_validation->set_message('doubleinput_check', 'bagan '.$val.' Tidak boleh lebih dari satu!');
    return FALSE;
}

    /* ----- Fungsi-fungsi dasar ----- */
    private function get($order_by){
        $this->load->model('bagan_m');
        $query = $this->bagan_m->get($order_by);
        return $query;
    }

    private function get_with_limit($limit, $offset, $order_by) {
        $this->load->model('bagan_m');
        $query = $this->bagan_m->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    private function get_where($id){
        $this->load->model('bagan_m');
        $query = $this->bagan_m->get_where($id);
        return $query;
    }

    private function get_where_custom($col, $value, $order_by) {
        $this->load->model('bagan_m');
        $query = $this->bagan_m->get_where_custom($col, $value, $order_by);
        return $query;
    }

    private function _insert($data){
        $this->load->model('bagan_m');
        $this->bagan_m->_insert($data);
    }

    private function _update($id, $data){
        $this->load->model('bagan_m');
        $this->bagan_m->_update($id, $data);
    }

    private function _delete($id){
        $this->load->model('bagan_m');
        $this->bagan_m->_delete($id);
    }

    private function count_where($column, $value) {
        $this->load->model('bagan_m');
        $count = $this->bagan_m->count_where($column, $value);
        return $count;
    }

    private function get_max() {
        $this->load->model('bagan_m');
        $max_id = $this->bagan_m->get_max();
        return $max_id;
    }

    private function _custom_query($mysql_query) {
        $this->load->model('bagan_m');
        $query = $this->bagan_m->_custom_query($mysql_query);
        return $query;
    }

}
