<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Form extends MY_Controller
{

function __construct() {
    parent::__construct();
}

public function index(){
  $this->load->helper('formmenu');

  $data['module']  = 'form';
  $data['title'] = 'Form';
  $data['page']  = 'form_v';

	// Menu Kacab
	$data['listmenukacab'] = formmenu('kacab');
	// END Menu Kacab

	// Menu Produksi
	$data['listmenuproduksi'] = formmenu('produksi');
	// END Menu Produksi

	// Menu Operasional
	$data['listmenuoperasional'] = formmenu('operasional');
	// END Menu Operasional

	// Menu Gudang
	$data['listmenugudang'] = formmenu('gudang');
	// End Menu Gudang

	// Menu Pengadaan
	$data['listmenupengadaan'] = formmenu('pengadaan');
	// End Menu Pengadaan

	// Menu Keuangan
	$data['listmenukeuangan'] = formmenu('keuangan');
	// End Menu Keuangan

  echo Modules::run('template/myTemp', $data);
}

public function sub($menu=''){
  $this->load->helper('formmenu');

  $data['module']  = 'form';
  $data['title'] = subformmenu($menu)[1];
  $data['listmenu'] = subformmenu($menu)[0];
  $data['page'] = 'sub_v';

  echo Modules::run('template/myTemp', $data);
}

public function kbbhp2($action=''){
    switch ($action) {
    	case 'add':
    		$user = $this->ion_auth->user()->row();
    		$data['user'] = $user;

			$data['module']  = 'form';
		    $data['title'] = 'Form KBBHP-2';
		    $data['page']  = 'kbbhp2/add_kbbhp2_v';

		    echo Modules::run('template/myTemp', $data);
    		break;

    	case 'history':
			$data['module']  = 'form';
		    $data['title'] = 'History KBBHP-2';
		    $data['page']  = 'kbbhp2/history_kbbhp2_v';

		    echo Modules::run('template/myTemp', $data);
    		break;

    	default:
    		redirect('form/sub/kbbhp-2');
    		break;
    }
}

public function lshp2($action=''){
	switch ($action) {
		case 'addterimaproduksi':
			$user = $this->ion_auth->user()->row();
    		$data['user'] = $user;

			$data['module']  = 'form';
		    $data['title'] = 'Input Terima Produksi (LSHP-2)';
		    $data['page']  = 'lshp2/add_terimaproduksi_v';

		    echo Modules::run('template/myTemp', $data);
		break;

		case 'historyterimaproduksi':
			$data['module']  = 'form';
		    $data['title'] = 'History Terima Produksi (LSHP-2)';
		    $data['page']  = 'lshp2/history_terimaproduksi_v';

		    echo Modules::run('template/myTemp', $data);
		break;

		case 'addterimatambahan':
			$user = $this->ion_auth->user()->row();
    		$data['user'] = $user;

			$data['module']  = 'form';
		    $data['title'] = 'Input Terima Tambahan (LSHP-2)';
		    $data['page']  = 'lshp2/add_terimatambahan_v';

		    echo Modules::run('template/myTemp', $data);
		break;

		case 'historyterimatambahan':
			$data['module']  = 'form';
		    $data['title'] = 'History Terima Tambahan (LSHP-2)';
		    $data['page']  = 'lshp2/history_terimatambahan_v';

		    echo Modules::run('template/myTemp', $data);
		break;

		case 'addsisalayak':
			$user = $this->ion_auth->user()->row();
    		$data['user'] = $user;

			$data['module']  = 'form';
		    $data['title'] = 'Input Sisa Layak (LSHP-2)';
		    $data['page']  = 'lshp2/add_sisalayak_v';

		    echo Modules::run('template/myTemp', $data);
		break;

		case 'historysisalayak':
			$data['module']  = 'form';
		    $data['title'] = 'History Sisa Layak (LSHP-2)';
		    $data['page']  = 'lshp2/history_sisalayak_v';

		    echo Modules::run('template/myTemp', $data);
		break;

		default:
			redirect('form/sub/lshp-2');
		break;
	}
}

public function kbbm($action=''){
	switch ($action) {
		case 'add':
			$user = $this->ion_auth->user()->row();
    		$data['user'] = $user;

			  $data['module']  = 'form';
		    $data['title'] = 'Input Kebutuhan Bahan Baku Mingguan';
		    $data['page']  = 'kbbm/add_v';

		    echo Modules::run('template/myTemp', $data);
		break;

		case 'history':
			$data['module']  = 'form';
		    $data['title'] = 'History Kebutuhan Bahan Baku Mingguan';
		    $data['page']  = 'kbbm/history_v';

		    echo Modules::run('template/myTemp', $data);
		break;

		default:
			redirect('form/sub/kbbm');
		break;
	}
}

public function lttbbm($action=''){
	switch ($action) {
		case 'add':
			$user = $this->ion_auth->user()->row();
    		$data['user'] = $user;

			$data['module']  = 'form';
		    $data['title'] = 'Input LTTB-BM';
		    $data['page']  = 'lttbbm/add_v';

		    echo Modules::run('template/myTemp', $data);
		break;

		case 'history':
			$data['module']  = 'form';
		    $data['title'] = 'History LTTB-BM';
		    $data['page']  = 'lttbbm/history_v';

		    echo Modules::run('template/myTemp', $data);
		break;

		default:
			redirect('form/sub/lttb-bm');
		break;
	}
}

public function lshg($action=''){
	switch ($action) {
		case 'addkeluargudang':
			$user = $this->ion_auth->user()->row();
    		$data['user'] = $user;

			$data['module']  = 'form';
		    $data['title'] = 'Input Keluar Gudang (LSHG)';
		    $data['page']  = 'lshg/add_keluargudang_v';

		    echo Modules::run('template/myTemp', $data);
		break;

		case 'historykeluargudang':
			$data['module']  = 'form';
		    $data['title'] = 'History Keluar Gudang (LSHG)';
		    $data['page']  = 'lshg/history_keluargudang_v';

		    echo Modules::run('template/myTemp', $data);
		break;

		case 'addkeluartambahan':
			$user = $this->ion_auth->user()->row();
    		$data['user'] = $user;

			$data['module']  = 'form';
		    $data['title'] = 'Input Keluar Tambahan (LSHG)';
		    $data['page']  = 'lshg/add_keluartambahan_v';

		    echo Modules::run('template/myTemp', $data);
		break;

		case 'historykeluartambahan':
			$data['module']  = 'form';
		    $data['title'] = 'History Keluar Tambahan (LSHG)';
		    $data['page']  = 'lshg/history_keluartambahan_v';

		    echo Modules::run('template/myTemp', $data);
		break;

		default:
			redirect('form/sub/lshg');
		break;
	}
}

public function sogpo($action=''){
	switch ($action) {
		case 'add':
			$user = $this->ion_auth->user()->row();
    		$data['user'] = $user;

			$data['module']  = 'form';
		    $data['title'] = 'Input Stock Opname Gudang';
		    $data['page']  = 'sogpo/add_v';

		    echo Modules::run('template/myTemp', $data);
		break;

		case 'history':
			$data['module']  = 'form';
		    $data['title'] = 'History Stock Opname Gudang';
		    $data['page']  = 'sogpo/history_v';

		    echo Modules::run('template/myTemp', $data);
		break;

		default:
			redirect('form/sub/so-gpo');
		break;
	}
}

public function opbm($action=''){
	switch ($action) {
		case 'add':
			$user = $this->ion_auth->user()->row();
    		$data['user'] = $user;

			$data['module']  = 'form';
		    $data['title'] = 'Input Order Pembelian Belanja Mingguan (OP-BM)';
		    $data['page']  = 'opbm/add_v';

		    echo Modules::run('template/myTemp', $data);
		break;

		case 'history':
			$data['module']  = 'form';
		    $data['title'] = 'History Order Pembelian Belanja Mingguan (OP-BM)';
		    $data['page']  = 'opbm/history_v';

		    echo Modules::run('template/myTemp', $data);
		break;

		default:
			redirect('form/sub/op-bm');
		break;
	}
}

}
