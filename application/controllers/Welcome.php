<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends MX_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		$this->load->driver('cache', array('adapter' => 'apc', 'backup' => 'file'));

		if ( ! $foo = $this->cache->get('2017-01-01')){
		        echo 'Saving to the cache!<br />';
		        $foo = 'foobarbaz!';

		        // Save into the cache for 5 minutes
		        $this->cache->save('2017-01-01', $foo, 300);
		}

		echo $foo;
	}
}
