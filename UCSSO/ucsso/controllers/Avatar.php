<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Avatar extends MY_Controller
{

	public function index()
	{


        $index = $this->db->where('app', (int)$_GET['app'])->where('uid', (int)$_GET['uid'])->get('uid')->row_array();
        $file = FCPATH.'avatar/'.(int)$index['mid'].'.jpg';
        !is_file($file)  && $file = FCPATH.'avatar/0.jpg';

        // 输出图片
        ob_clean();
        header('Content-Disposition: filename='.$file.';');
        header('Content-Type: image/jpg');
        header('Content-Transfer-Encoding: binary');
        header('Last-Modified: '.gmdate('D, d M Y H:i:s', time()).' GMT');

        $im = imagecreatefromjpeg($file);
        imagejpeg($im, NULL, 90);

        @imagedestroy($im);

	}
}
