<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class MY_Controller extends MX_Controller
{
    public function __construct(){
        parent::__construct();

        date_default_timezone_set("Asia/Jakarta");

        // $this->output->enable_profiler(true);

        $user = $this->ion_auth->user()->row();

        if (!$this->ion_auth->logged_in()){
    			$this->session->set_flashdata('message', 'Anda, tidak memiliki hak mengakses halaman ini!!');
    			redirect('/login');
    		}
    }
}
