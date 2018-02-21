<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Change extends MY_Controller
{

function __construct() {
    parent::__construct();
}

public function index(){
    $this->load->model('useroutlet/useroutlet_m');
    $user = $this->ion_auth->user()->row();
    $sql = "
        SELECT * FROM `useroutlet`
        INNER JOIN `outlet` ON `useroutlet`.`outletID` = `outlet`.`outletID`
        WHERE `useroutlet`.`userID` = '$user->id'
        ORDER BY `outlet`.`outletName`";

    $data['get_uo'] = $this->_custom_query($sql)->result();
    $data['module']  = 'change';
    $data['title'] = 'Change';

    $this->load->view('change_v', $data);
}

public function process_ubah(){
    $this->load->model('users/users_m');
    $this->load->model('outlet/outlet_m');
    $this->load->model('useroutlet/useroutlet_m');
    $this->load->library('ownlog');

    $user = $this->ion_auth->user()->row();

    $get_outlet = $this->useroutlet_m->get_where_custom('userID', $user->id, 'useroutletID')->result();

    foreach ($get_outlet as $key) {
        $listoutlet[] = $key->outletID;
    }

    $listoutlet = implode(',', $listoutlet);

    $this->form_validation->set_rules('outlet', 'Pilih Waroeng', "trim|required|in_list[$listoutlet]");

    if ($this->form_validation->run($this) === FALSE) {
        $this->session->set_flashdata('message', validation_errors());
        $this->ownlog->log_security(8, $user->id);
        redirect('change');
    }else{
        $this->session->set_flashdata('message', 'Waroeng Berhasil diubah!!');

        $outletName = $this->outlet_m->get_where($this->input->post('outlet'))->row('outletName');

        $this->ownlog->log_security(7, $user->id, "Mengubah waroeng menjadi $outletName");

        $data = array(
            'outletID' => $this->input->post('outlet'),
        );
        $this->users_m->_update($user->id, $data);

        redirect('dashboard');
    }
}

private function _custom_query($mysql_query) {
    $this->load->model('change_m');
    $query = $this->change_m->_custom_query($mysql_query);
    return $query;
}

}
