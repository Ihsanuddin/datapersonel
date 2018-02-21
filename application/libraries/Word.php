<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/* 
 *  ======================================= 
 *  Author     : Ihsanudin 
 *  License    : Protected 
 *  Email      : ihsan624@gmail.com 
 *   
 *  Dilarang merubah, mengganti dan mendistribusikan 
 *  ulang tanpa sepengetahuan Author 
 *  ======================================= 
 */  
require_once APPPATH."/third_party/PHPWord.php"; 

class Word extends PHPWord { 
    public function __construct() { 
        parent::__construct(); 
    } 
}