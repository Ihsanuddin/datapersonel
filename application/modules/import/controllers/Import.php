<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Import extends MY_Controller
{

function __construct() {
    parent::__construct();
}

public function index(){
    $data['module']  = 'import';
    $data['title'] = 'import';
    $data['page']  = 'import_v';

    echo Modules::run('template/myTemp', $data);
}

public function prosess_import()
{
    $this->load->library('excel');

    $this->form_validation->set_rules("importFile", "Import", "trim");

    if ($this->form_validation->run($this) === FALSE) {
        echo json_encode(array('st'=>0, 'msg'=>"ERROR: <br/>" . validation_errors()));
    }else{

        // File Upload
        $config['upload_path']          = './assets/import/proker/';
        $config['allowed_types']        = 'xlsx|xls|application/vnd.ms-excel';
        $config['max_size']             = 10000;
        $config['encrypt_name']         = true;

        $this->load->library('upload', $config);

        if (!$this->upload->do_upload('importFile')) {
            $error = array('error' => $this->upload->display_errors());
            // echo $this->upload->data('file_ext');
            $this->load->view('upload_form', $error);
        }else{
            // echo $this->upload->data('file_name');

            // Read Excel file
            $tmpfname = FCPATH.'assets/import/proker/'.$this->upload->data('file_name');
            $excelReader = PHPExcel_IOFactory::createReaderForFile($tmpfname);
            $excelObj = $excelReader->load($tmpfname);
            $worksheet = $excelObj->getSheet(0);
            $lastRow = $worksheet->getHighestRow();

            // Deklarasi array untuk menampung data batch insert
            $data = array();
            $i = 1;
            for ($row = 2; $row <= $lastRow; $row++) {
                $itemID = $worksheet->getCell('A'.$row)->getValue();
                $accountID = $worksheet->getCell('C'.$row)->getValue();

                $sqlUpdate = "UPDATE `items` SET `classification` = '$accountID' WHERE `itemID` = '$itemID'";

                dump($sqlUpdate);

                $this->_custom_query($sqlUpdate);
                $i++;
            }

            unlink($tmpfname);
        }
    }
}

/*Kode Dasar*/
private function get($order_by){
    $this->load->model('import_m');
    $query = $this->import_m->get($order_by);
    return $query;
}

private function get_with_limit($limit, $offset, $order_by) {
    $this->load->model('import_m');
    $query = $this->import_m->get_with_limit($limit, $offset, $order_by);
    return $query;
}

private function get_where($id){
    $this->load->model('import_m');
    $query = $this->import_m->get_where($id);
    return $query;
}

private function get_where_custom($col, $value, $order_by) {
    $this->load->model('import_m');
    $query = $this->import_m->get_where_custom($col, $value, $order_by);
    return $query;
}

private function get_where_double_custom($col1, $val1, $col2, $val2, $order_by) {
    $this->load->model('import_m');
    $query = $this->import_m->get_where_double_custom($col1, $val1, $col2, $val2, $order_by);
    return $query;
}

private function _insert($data){
    $this->load->model('import_m');
    $this->import_m->_insert($data);
}

private function _update($id, $data){
    $this->load->model('import_m');
    $this->import_m->_update($id, $data);
}

private function _delete($id){
    $this->load->model('import_m');
    $this->import_m->_delete($id);
}

private function count_where($column, $value) {
    $this->load->model('import_m');
    $count = $this->import_m->count_where($column, $value);
    return $count;
}

private function get_max() {
    $this->load->model('import_m');
    $max_id = $this->import_m->get_max();
    return $max_id;
}

private function _custom_query($mysql_query) {
    $this->load->model('import_m');
    $query = $this->import_m->_custom_query($mysql_query);
    return $query;
}

}
