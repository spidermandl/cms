<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Template {


    public $_dir;
    public $_cache;
    public $_options;
    public $_filename;

    /**
     * 构造函数
     */

    public function __construct() {
        $this->_dir = APPPATH.'views/';
        $this->_cache = APPPATH.'cache/templates/';

    }

    /**
     * 输出模板
     */
    public function display($_name) {

        $this->_options && extract($this->_options, EXTR_PREFIX_SAME, 'data');
        $this->_options = NULL;
        $this->_filename = $_name;

        include $this->load_view_file($this->get_file_name($_name));

        $this->_include_file = NULL;
    }

    /**
     * 设置模块/应用的模板目录
     */
    public function get_file_name($file) {

        return $this->_dir.$file;
    }


    /**
     * 设置模板变量
     */
    public function assign($key, $value = NULL) {

        if (!$key) {
            return FALSE;
        }

        if (is_array($key)) {
            foreach ($key as $k => $v) {
                $this->_options[$k] = $v;
            }
        } else {
            $this->_options[$key] = $value;
        }
    }


    /**
     * 模板标签include/template
     */
    public function _include($name) {

        $file = $this->get_file_name($name);
        return $this->load_view_file($file);
    }

    /**
     * 加载
     *
     * @param	string
     * @return  string
     */
    public function load_view_file($name) {

        $cache_file = $this->_cache.str_replace(array(APPPATH, '/', '\\', DIRECTORY_SEPARATOR), array('', '.', '.', '.'), $name).'.cache.php';

        // 当缓存文件不存在时或者缓存文件创建时间少于了模板文件时,再重新生成缓存文件
        if (!is_file($cache_file) || (is_file($cache_file) && is_file($name) && filemtime($cache_file) < filemtime($name))) {
            $content = $this->handle_view_file(file_get_contents($name));
            @file_put_contents($cache_file, $content, LOCK_EX) === FALSE && show_error('请将模板缓存目录（/cache/templates/）权限设为777', 404, '无写入权限');
        }

        return $cache_file;
    }


    /**
     * 解析模板文件
     *
     * @param	string
     * @param	string
     * @return  string
     */
    public function handle_view_file($view_content) {

        if (!$view_content) {
            return '';
        }

        // 正则表达式匹配的模板标签
        $regex_array = array(
            // 站点缓存数据变量
            '#{([A-Z\-]+)\.(.+)}#U',
            // 3维数组变量
            '#{\$(\w+?)\.(\w+?)\.(\w+?)\.(\w+?)}#i',
            // 2维数组变量
            '#{\$(\w+?)\.(\w+?)\.(\w+?)}#i',
            // 1维数组变量
            '#{\$(\w+?)\.(\w+?)}#i',
            // 3维数组变量
            '#\$(\w+?)\.(\w+?)\.(\w+?)\.(\w+?)#Ui',
            // 2维数组变量
            '#\$(\w+?)\.(\w+?)\.(\w+?)#Ui',
            // 1维数组变量
            '#\$(\w+?)\.(\w+?)#Ui',
            // PHP函数
            '#{([a-z_0-9]+)\((.*)\)}#Ui',
            // PHP常量
            '#{([A-Z_]+)}#',
            // PHP变量
            '#{\$(.+?)}#i',
            // 引入模板
            '#{\s*template\s+"([\$\-_\/\w\.]+)",\s*"(.+)"\s*}#Uis',
            '#{\s*template\s+"([\$\-_\/\w\.]+)",\s*MOD_DIR\s*}#Uis',
            '#{\s*template\s+"([\$\-_\/\w\.]+)"\s*}#Uis',
            '#{\s*template\s+([\$\-_\/\w\.]+)\s*}#Uis',
            // php标签
            '#{php\s+(.+?)}#is',
            // if判断语句
            '#{\s?if\s+(.+?)\s?}#i',
            '#{\s?else\sif\s+(.+?)\s?}#i',
            '#{\s?else\s?}#i',
            '#{\s?\/if\s?}#i',
            // 循环语句
            '#{\s?loop\s+\$(.+?)\s+\$(\w+?)\s?\$(\w+?)\s?}#i',
            '#{\s?loop\s+\$(.+?)\s+\$(\w+?)\s?}#i',
            '#{\s?loop\s+\$(.+?)\s+\$(\w+?)\s?=>\s?\$(\w+?)\s?}#i',
            '#{\s?\/loop\s?}#i',
            // 结束标记
            '#{\s?php\s?}#i',
            '#{\s?\/php\s?}#i',
            '#\?\>\s*\<\?php\s#s',
        );

        // 替换直接变量输出
        $replace_array = array(
            "<?php \$cache = \$this->_cache_var('\\1'); eval('echo \$cache'.\$this->_get_var('\\2').';');unset(\$cache); ?>",
            "<?php echo \$\\1['\\2']['\\3']['\\4']; ?>",
            "<?php echo \$\\1['\\2']['\\3']; ?>",
            "<?php echo \$\\1['\\2']; ?>",
            "\$\\1['\\2']['\\3']['\\4']",
            "\$\\1['\\2']['\\3']",
            "\$\\1['\\2']",
            "<?php echo \\1(\\2); ?>",
            "<?php echo \\1; ?>",
            "<?php echo \$\\1; ?>",
            "<?php if (\$fn_include = \$this->_include(\"\\1\", \"\\2\")) include(\$fn_include); ?>",
            "<?php if (\$fn_include = \$this->_include(\"\\1\", \"MOD_DIR\")) include(\$fn_include); ?>",
            "<?php if (\$fn_include = \$this->_include(\"\\1\")) include(\$fn_include); ?>",
            "<?php if (\$fn_include = \$this->_include(\"\\1\")) include(\$fn_include); ?>",
            "<?php \\1 ?>",
            "<?php if (\\1) { ?>",
            "<?php } else if (\\1) { ?>",
            "<?php } else { ?>",
            "<?php } ?>",
            "<?php if (is_array(\$\\1)) { \$count=count(\$\\1);foreach (\$\\1 as \$\\2=>\$\\3) { ?>",
            "<?php if (is_array(\$\\1)) { \$count=count(\$\\1);foreach (\$\\1 as \$\\2) { ?>",
            "<?php if (is_array(\$\\1)) { \$count=count(\$\\1);foreach (\$\\1 as \$\\2=>\$\\3) { ?>",
            "<?php } } ?>",
            "<?php ",
            " ?>",
            " ",
        );

        $view_content = preg_replace($regex_array, $replace_array, $view_content);

        return $view_content;
    }


}