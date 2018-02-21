<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Template extends MY_Controller {
	public function myTemp($data){
		$this->lte2($data);
	}

	public function materialize($data){
		$this->load->view('materialize/index', $data);
	}
	
	public function lte2($data){
		$this->load->view('lte2/index', $data);
	}

	public function lte2top($data){
		$this->load->view('lte2top/index', $data);
	}
}
