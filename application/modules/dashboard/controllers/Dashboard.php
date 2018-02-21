<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MY_Controller
{

function __construct() {
    parent::__construct();
}

public function index(){
	if (!$this->ion_auth->in_role(2)) {
        show_error('Anda Tidak Memiliki Hak Untuk Mengakses Halaman Ini!!', 1, 'Error Hak Akses');
    }
    
    $data['module']  = 'dashboard';
    $data['title'] = 'Dashboard';
    $data['page']  = 'dashboard_v';

    $user = $this->ion_auth->user()->row();

    $data['user'] = $user;
    
    echo Modules::run('template/myTemp', $data);
}

public function test()
{
	$alphabet = range('A', 'Z');

	echo $alphabet[3]; // returns D
}

public function tes2()
{
	$this->load->view('tes_v');
}

public function tes10($prokerID, $subprokerID, $jenis='all', $istes='tes')
{
	$this->load->model('items/items_m');

	switch ($jenis) {
		case 'waroeng':
			$kondisi = 'AND `outletID` NOT IN (91, 3, 82, 26, 18, 1, 50, 67, 32)';
			break;

		case 'management':
			$kondisi = 'AND `outletID` IN (91, 3, 82, 26, 18, 1, 50, 67, 32)';
			break;
		
		default:
			$kondisi = '';
			break;
	}

	$sql = "
		SELECT * FROM `subproker` `sp`
		JOIN `proker` `p` ON `p`.`prokerID` = `sp`.`prokerID`
		WHERE `sp`.`prokerID` = $prokerID
		AND `subprokerID` NOT IN ($subprokerID) ".$kondisi;

	$subproker = $this->db->query($sql)->result();

	foreach ($subproker as $key => $val) {
		$sql2 = "
			SELECT * FROM `items` WHERE `subprokerID` = $subprokerID
		";
		$item = $this->db->query($sql2)->result();

		foreach ($item as $key2 => $val2) {
			$mydata[] = array(
				'subprokerID' => $val->subprokerID,
				'itemName' => $val2->itemName,
				'classification' => '',
				'is_new' => 0,
				'createdDate' => date('Y-m-d H:i:s'),
				'createdUserID' => 1
			);
		}
	}

	if ($istes == 'tes') {
		dump($mydata);
	}else{
		// $this->items_m->_insert_batch($mydata);
	}
	
}

public function tes($prokerID, $subprokerID, $jenis='all', $istes='tes')
{
	$this->load->model('subproker/subproker_m');

	$sql = "
		SELECT * FROM `subproker`
		WHERE `outletID` = 13
			AND `prokerID` NOT IN (SELECT `prokerID` FROM `subproker` WHERE `outletID` = 97)";

	$subproker = $this->db->query($sql)->result();

	$data = array();
	foreach ($subproker as $key => $val) {
		$data[] = array(
			'prokerID' => $val->prokerID,
			'outletID' => 97,
			'createdDate' => date('Y-m-d H:i:s'),
			'createdUserID' => 26 );
	}
	
	// $this->subproker_m->_insert_batch($data);
}

public function _custom_query($mysql_query) {
    $query = $this->db->query($mysql_query);
    return $query;
}

}