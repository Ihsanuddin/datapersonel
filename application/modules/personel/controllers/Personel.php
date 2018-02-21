<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Personel extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('personel_m');
        $this->load->model('bagan/bagan_m');
        $this->load->model('level/level_m');
        $this->load->model('wilayahkerja/wilayahkerja_m');
        $this->load->model('outlet/outlet_m');
        // if (!$this->ion_auth->in_role(7)) {
        //     show_error('Anda Tidak Memiliki Hak Untuk Mengakses Halaman Ini!!', 1, 'Error Hak Akses');
        // }
    }

    public function index(){
        $data['module']  = 'personel';
        $data['title'] = 'Data Personel';
        $data['page']  = 'personel_v';
        $data['bagan'] = $this->bagan_m->get('baganID')->result();
        $data['level'] = $this->level_m->get('levelID')->result();
        $data['wilayah'] = $this->wilayahkerja_m->get('wilayahKerjaID')->result();
        $data['outlet'] = $this->outlet_m->get('outletID')->result();
        $data['baganGroup'] = $this->bagan_m->get_where_custom('class', 1, 'baganID')->result();

        echo Modules::run('template/myTemp', $data);
    }

    public function ajax_list(){
        $this->load->model('personel_m');
        $list = $this->personel_m->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $value) {
            $no++;
            $row = array();
            $row[] = $value->personelNIK;
            $row[] = $value->personelName;
            $row[] = $value->wilayahKerjaName;
            $row[] = $value->levelName;

            if (!empty($value->baganName)) {
                $row[] = $value->baganName;
            }else{
                $row[] = '-';
            }
            $row[] = $value->outletName;
            //add html for action
            
                $row[] = '
                    <button type="button" onclick="edit_personel('.$value->personelID.')" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-pencil"></i></button>
                    <button type="button" onclick="delete_personel('."'".$value->personelID."'".')" class="btn btn-xs btn-danger"><i class="glyphicon glyphicon-trash"></i></button>';
            
            $data[] = $row;
        }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->personel_m->count_all(),
            "recordsFiltered" => $this->personel_m->count_filtered(),
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
        $this->form_validation->set_rules('personelNIK', 'NIK/KTP', 'trim|is_unique[personel.personelNIK]|required|numeric|max_length[20]');
        $this->form_validation->set_rules('personelName', 'Nama', 'trim|required|max_length[50]');
        $this->form_validation->set_rules('personelStatus', 'Status', 'trim|required');
        $this->form_validation->set_rules('alamatKTP', 'Alamat KTP', 'trim|required');
        $this->form_validation->set_rules('alamatDomisili', 'Alamat Domisili', 'trim|required');
        $this->form_validation->set_rules('personelBank', 'Nama Bank', 'trim');
        $this->form_validation->set_rules('personelRekening', 'No Rekening', 'trim|numeric');
        $this->form_validation->set_rules('wilayahKerjaID', 'Wilayah', 'trim|required');
        $this->form_validation->set_rules('levelID', 'Level', 'trim|required');
        $this->form_validation->set_rules('baganID', 'Bagian', 'trim|required');
        $this->form_validation->set_rules('outletID', 'Penempatan', 'trim|required');

        // $this->form_validation->set_rules('class', 'Class', 'trim|required|numeric|greater_than[0]');
        // $this->form_validation->set_rules('order', 'Order', "trim|required|numeric|greater_than[0]");
        if ($this->form_validation->run() === FALSE) {
            echo json_encode(array('st'=>0, 'msg'=>'ERROR: <br/>' . validation_errors()));
        }else{
            // echo $this->input->post('parentID');
            $data = array(
                'personelNIK' => $this->input->post('personelNIK'),
                'personelName' => $this->input->post('personelName'),
                'personelStatus' => $this->input->post('personelStatus'),
                'alamatKTP' => $this->input->post('alamatKTP'),
                'alamatDomisili' => $this->input->post('alamatDomisili'),
                'personelBank' => $this->input->post('personelBank'),
                'personelRekening' => $this->input->post('personelRekening'),
                'wilayahKerjaID' => $this->input->post('wilayahKerjaID'),
                'levelID' => $this->input->post('levelID'),
                'baganID' => $this->input->post('baganID'),
                'outletID' => $this->input->post('outletID'),
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
        if ($this->input->post('personelNIK') != $this->get_where($this->input->post('id'))->row('personelNIK')) {
            $this->form_validation->set_rules('baganName', 'NIK/KTP', 'trim|required|numeric|is_unique[personel.personelNIK]|max_length[20]');
        }else{
            $this->form_validation->set_rules('personelNIK', 'NIK/KTP', 'trim|required|numeric|max_length[20]');
        }
        $this->form_validation->set_rules('personelName', 'Nama', 'trim|required|max_length[50]');
        $this->form_validation->set_rules('personelStatus', 'Status', 'trim|required');
        $this->form_validation->set_rules('alamatKTP', 'Alamat KTP', 'trim|required');
        $this->form_validation->set_rules('alamatDomisili', 'Alamat Domisili', 'trim|required');
        $this->form_validation->set_rules('personelBank', 'Nama Bank', 'trim|required');
        $this->form_validation->set_rules('personelRekening', 'No Rekening', 'trim|required|numeric');
        $this->form_validation->set_rules('wilayahKerjaID', 'Wilayah', 'trim|required');
        $this->form_validation->set_rules('levelID', 'Level', 'trim|required');
        $this->form_validation->set_rules('baganID', 'Bagian', 'trim|required');
        $this->form_validation->set_rules('outletID', 'Penempatan', 'trim|required');
        if ($this->form_validation->run() === FALSE) {
            echo json_encode(array('st'=>0, 'msg'=>'ERROR: <br/>' . validation_errors()));
        }else{
            $id = $this->input->post('id');
            $data = array(
                'personelNIK' => $this->input->post('personelNIK'),
                'personelName' => $this->input->post('personelName'),
                'personelStatus' => $this->input->post('personelStatus'),
                'alamatKTP' => $this->input->post('alamatKTP'),
                'alamatDomisili' => $this->input->post('alamatDomisili'),
                'personelBank' => $this->input->post('personelBank'),
                'personelRekening' => $this->input->post('personelRekening'),
                'wilayahKerjaID' => $this->input->post('wilayahKerjaID'),
                'levelID' => $this->input->post('levelID'),
                'baganID' => $this->input->post('baganID'),
                'outletID' => $this->input->post('outletID'),
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
    //     $this->load->model('personel_m');
    //     $this->personel_m->_update2($data);
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

public function excellabarugiarea($areaID='')
{
    $this->load->model('area/area_m');
    $this->load->model('outlet/outlet_m');
    // $this->load->model('proker_m');
    $this->load->model('report_m');
    $this->load->library('excel');

    $areaName = $this->area_m->get_where($areaID)->row('areaName');
    // $prokerName = $this->proker_m->get_where($prokerID)->row('prokerName');

    $get_outlet = $this->outlet_m->get_where_custom('areaID', $areaID, 'outletID')->result();
  
    // dump($get_outlet);
    // exit();
    $i=0;
    foreach ($get_outlet as $keyoutlet => $valoutlet) {
        // create new sheet excel
        $this->excel->createSheet();

        // set sheet aktif
        $this->excel->setActiveSheetIndex($i);
        //name the worksheet
        $this->excel->getActiveSheet()->setTitle("$valoutlet->outletName");
        //set cell A1 content with some text
        $this->excel->getActiveSheet()->setCellValue('A1', 'Laporan Laba Rugi '.$valoutlet->outletName);
        $this->excel->getActiveSheet()->setCellValue('A2', 'Nama Akun');
        $this->excel->getActiveSheet()->setCellValue('A3', 'Pendapatan');
        $this->excel->getActiveSheet()->setCellValue('A4', 'Biaya Produksi');
        $this->excel->getActiveSheet()->setCellValue('A5', 'Biaya Pemakaian');
        $this->excel->getActiveSheet()->setCellValue('B2', 'Januari');
        $this->excel->getActiveSheet()->setCellValue('C2', 'Februari');
        $this->excel->getActiveSheet()->setCellValue('D2', 'Maret');
        $this->excel->getActiveSheet()->setCellValue('E2', 'April');
        $this->excel->getActiveSheet()->setCellValue('F2', 'Mei');
        $this->excel->getActiveSheet()->setCellValue('G2', 'Juni');
        $this->excel->getActiveSheet()->setCellValue('H2', 'Juli');
        $this->excel->getActiveSheet()->setCellValue('I2', 'Agustus');
        $this->excel->getActiveSheet()->setCellValue('J2', 'September');
        $this->excel->getActiveSheet()->setCellValue('K2', 'Oktober');
        $this->excel->getActiveSheet()->setCellValue('L2', 'November');
        $this->excel->getActiveSheet()->setCellValue('M2', 'Desember');

        //merge cell A1 until C1
        $this->excel->getActiveSheet()->mergeCells('A1:M1');
        //set aligment to center for that merged cell (A1 to C1)
        $this->excel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(16);
        $this->excel->getActiveSheet()->getStyle('A1')->getFill()->getStartColor()->setARGB('#333');

        $this->excel->getActiveSheet()->mergeCells('A4:M4');
        $this->excel->getActiveSheet()->getStyle('A4:M4')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('A4:M4')->getFont()->setSize(13);

        for($col = ord('A'); $col <= ord('M'); $col++){
                //set column dimension
            $this->excel->getActiveSheet()->getColumnDimension(chr($col))->setAutoSize(true);
            //change the font size
            $this->excel->getActiveSheet()->getStyle(chr($col))->getFont()->setSize(12);
            $this->excel->getActiveSheet()->getStyle(chr($col).'2')->getFont()->setSize(13);
            $this->excel->getActiveSheet()->getStyle(chr($col).'2')->getFont()->setBold(true);
            if (chr($col) == 'A') {
                $this->excel->getActiveSheet()->getStyle(chr($col))->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
            }else{
                $this->excel->getActiveSheet()->getStyle(chr($col))->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
            }
            
        }
        // $this->excel->getActiveSheet()->getStyle('A2',)->getFont()->setBold(true);
        // $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(16);
        // $this->excel->getActiveSheet()
        //                 ->getStyle('A2:M2')
        //                 ->getFill()
        //                 ->setFillType(PHPExcel_Style_Fill::FILL_GRADIENT_LINEAR)
        //                 ->getStartColor()
        //                 ->setARGB('FF0000FF');

        $getPenjualan = $this->report_m->getPenjualan($valoutlet->outletID)->result();
        $huruf = 'B';
        $p=1;
        foreach ($getPenjualan as $key => $val) {
            $col= 'bulan'.$p;
            $this->excel->getActiveSheet()->setCellValue($huruf.'3', $val->$col);
            $huruf++;
            $p++;
        }

        $getHpp = $this->report_m->getHpp($valoutlet->outletID)->result();
        $huruf = 'B';
        $p=1;
        foreach ($getHpp as $key => $val) {
            $col= 'bulan'.$p;
            $this->excel->getActiveSheet()->setCellValue($huruf.'5', $val->$col);
            $huruf++;
            $p++;
        }

        $getAccountCategory = $this->report_m->getListAccountCategory();

        $counter = 6; //baris awal
        foreach ($getAccountCategory->result() as $keycat => $valcat) {
            $this->excel->getActiveSheet()->setCellValue('A'.$counter, $valcat->acName);
            //merge cell
            $this->excel->getActiveSheet()->mergeCells('A'.$counter.':M'.$counter);
            $this->excel->getActiveSheet()->getStyle('A'.$counter.':M'.$counter)->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('A'.$counter.':M'.$counter)->getFont()->setSize(13);
            // $this->excel->getActiveSheet()
            //                 ->getStyle('A'.$counter.':M'.$counter)
            //                 ->getFill()
            //                 ->setFillType(PHPExcel_Style_Fill::FILL_SOLID)
            //                 ->getStartColor()
            //                 ->setARGB('FF0000FF');
            $getAkun = $this->report_m->get_labarugiwaroeng($valoutlet->outletID, $areaID, $valcat->acID);
            $ac = $counter+1;
            foreach ($getAkun->result() as $keyac => $valac) {
                $this->excel->getActiveSheet()->setCellValue('A'.$ac, $valac->accountName);

                $hrf = 'B';
                for ($field=1; $field <=12 ; $field++) { 
                    $bln = 'bulan'.$field;
                    $this->excel->getActiveSheet()->setCellValue($hrf.$ac, $valac->$bln);
                    $hrf++;
                }
                $ac++;
            }
            $counter = $ac;
        }

        $styleArray = array(
          'borders' => array(
              'allborders' => array(
                  'style' => PHPExcel_Style_Border::BORDER_THIN
              )
          )
        );
        $this->excel->getActiveSheet()->getStyle('A1:M'.$counter)->applyFromArray($styleArray);
        $i++;
    }

    $filename= 'Laporan Laba Rugi - '.$areaName.'.xls'; //save our workbook as this file name
    header('Content-Type: application/vnd.ms-excel'); //mime type
    header('Content-Disposition: attachment;filename="'.$filename.'"'); //tell browser what's the file name
    header('Cache-Control: max-age=0'); //no cache

    //save it to Excel5 format (excel 2003 .XLS file), change this to 'Excel2007' (and adjust the filename extension, also the header mime type)
    //if you want to save it as .XLSX Excel 2007 format
    $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');  
    //force user to download the Excel file without writing it to server's HD
    $objWriter->save('php://output');
}

Public function excelPersonel(){
    $this->load->library('excel');
    $this->excel->setActiveSheetIndex(0);
    //name the worksheet
    $this->excel->getActiveSheet()->setTitle('Data Personel');
    //set cell A1 content with some text
    $this->excel->getActiveSheet()->setCellValue('A1', 'NIK');
    $this->excel->getActiveSheet()->setCellValue('B1', 'Nama');
    $this->excel->getActiveSheet()->setCellValue('C1', 'Status');
    $this->excel->getActiveSheet()->setCellValue('D1', 'Alamat KTP');
    $this->excel->getActiveSheet()->setCellValue('E1', 'Alamat Domisili');
    $this->excel->getActiveSheet()->setCellValue('F1', 'Bank');
    $this->excel->getActiveSheet()->setCellValue('G1', 'No.Rek');
    $this->excel->getActiveSheet()->setCellValue('H1', 'Wilayah');
    $this->excel->getActiveSheet()->setCellValue('I1', 'Level');
    $this->excel->getActiveSheet()->setCellValue('J1', 'Bagian');
    $this->excel->getActiveSheet()->setCellValue('K1', 'Penempatan');
    //merge cell A1 until C1
    // $this->excel->getActiveSheet()->mergeCells('A1:B1');
    //set aligment to center for that merged cell (A1 to C1)
    $this->excel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
    //make the font become bold
    // $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
    // $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(12);
    // $this->excel->getActiveSheet()->getStyle('A1')->getFill()->getStartColor()->setARGB('#333');
    // $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setSize(12);
    // $this->excel->getActiveSheet()->getStyle('B1')->getFill()->getStartColor()->setARGB('#333');
    // $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setSize(12);
    // $this->excel->getActiveSheet()->getStyle('C1')->getFill()->getStartColor()->setARGB('#333');
    for($col = ord('A'); $col <= ord('K'); $col++){
                //set column dimension
            $this->excel->getActiveSheet()->getColumnDimension(chr($col))->setAutoSize(true);
            //change the font size
            $this->excel->getActiveSheet()->getStyle(chr($col))->getFont()->setSize(12);
            $this->excel->getActiveSheet()->getStyle(chr($col).'1')->getFont()->setSize(13);
            $this->excel->getActiveSheet()->getStyle(chr($col).'1')->getFont()->setBold(true);            
        }
    //retrive contries table data
    $sql = "
        SELECT `p`.`personelNIK`,`p`.`personelName`,`p`.`personelStatus`,`p`.`alamatKTP`,
        `p`.`alamatDomisili`,`p`.`personelBank`,`p`.`personelRekening`,`wk`.`wilayahKerjaName`,
        `l`.`levelName`,`b`.`baganName`,`o`.`outletName` FROM `personel` `p`
        JOIN `wilayahkerja` `wk` ON `wk`.`wilayahKerjaID` = `p`.`wilayahKerjaID` 
        JOIN `level` `l` ON `l`.`levelID` = `p`.`levelID`
        JOIN `bagan` `b` ON `b`.`baganID` = `p`.`baganID`
        JOIN `outlet` `o` ON `o`.`outletID` = `p`.`outletID`";        
    $personel = $this->db->query($sql);
    if (empty($personel->result())) {
        echo "data personel tidak ada!!";
        exit();
    }
    $exceldata="";
    foreach ($personel->result_array() as $row){
        $exceldata[] = $row;
    }

    //Fill data 
    $this->excel->getActiveSheet()->fromArray($exceldata, null, 'A2');
    $this->excel->getActiveSheet()->getStyle('A2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
    $this->excel->getActiveSheet()->getStyle('B2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
    $filename='data-personel.xls'; //save our workbook as this file name
    header('Content-Type: application/vnd.ms-excel'); //mime type
    header('Content-Disposition: attachment;filename="'.$filename.'"'); //tell browser what's the file name
    header('Cache-Control: max-age=0'); //no cache
    //save it to Excel5 format (excel 2003 .XLS file), change this to 'Excel2007' (and adjust the filename extension, also the header mime type)
    //if you want to save it as .XLSX Excel 2007 format
    $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');  
    //force user to download the Excel file without writing it to server's HD
    $objWriter->save('php://output');
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
        $this->load->model('personel_m');
        $query = $this->personel_m->get($order_by);
        return $query;
    }

    private function get_with_limit($limit, $offset, $order_by) {
        $this->load->model('personel_m');
        $query = $this->personel_m->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    private function get_where($id){
        $this->load->model('personel_m');
        $query = $this->personel_m->get_where($id);
        return $query;
    }

    private function get_where_custom($col, $value, $order_by) {
        $this->load->model('personel_m');
        $query = $this->personel_m->get_where_custom($col, $value, $order_by);
        return $query;
    }

    private function _insert($data){
        $this->load->model('personel_m');
        $this->personel_m->_insert($data);
    }

    private function _update($id, $data){
        $this->load->model('personel_m');
        $this->personel_m->_update($id, $data);
    }

    private function _delete($id){
        $this->load->model('personel_m');
        $this->personel_m->_delete($id);
    }

    private function count_where($column, $value) {
        $this->load->model('personel_m');
        $count = $this->personel_m->count_where($column, $value);
        return $count;
    }

    private function get_max() {
        $this->load->model('personel_m');
        $max_id = $this->personel_m->get_max();
        return $max_id;
    }

    private function _custom_query($mysql_query) {
        $this->load->model('personel_m');
        $query = $this->personel_m->_custom_query($mysql_query);
        return $query;
    }

}
