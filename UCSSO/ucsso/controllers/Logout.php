<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Logout extends MY_Controller
{

	public function index()
	{


        $this->session->set_userdata('admin_id', 0);

        redirect(dr_url('login/index'));
	}

}
