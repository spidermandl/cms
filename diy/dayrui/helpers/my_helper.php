<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');



function dr_mylang() {

}
//<Desmond> 调用堆栈打印
function print_stack_trace()
{
    $html = "\n";
    $array = debug_backtrace();
    //print_r($array);//信息很齐全
    //unset($array[0]);
    foreach($array as $row)
    {
        $html .= '调用方法:'.$row['function']."\t\t".$row['file'].':'.$row['line'].'行'."<p>";
    }
    var_dump($html);
    //file_put_contents("/home/users/zhuqingchang/pay-finance-php/log/zqc.log",var_export($html,true));
}
//</Desmond>