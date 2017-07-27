<?php if ($fn_include = $this->_include("nheader.html")) include($fn_include); ?>

<div class="page-bar">
	<ul class="page-breadcrumb">
		<li><a href="<?php echo dr_url('home/cache'); ?>" class="blue"> <i class="fa fa-refresh"></i> <?php echo fc_lang('更新缓存'); ?></a> <i class="fa fa-circle"></i></li>
		<li><a href="<?php echo dr_url('check/index'); ?>"> <i class="icon-compass"></i> <?php echo fc_lang('系统体检'); ?></a> <i class="fa fa-circle"></i></li>
		<li><a href="<?php echo dr_url('check/phpinfo'); ?>" target="_blank"> <i class="fa fa-pie-chart"></i> <?php echo fc_lang('PHP环境'); ?></a></li>
	</ul>
</div>



<h3 class="page-title">
	<small><a href="javascript:dr_update_cache_all();"><?php echo fc_lang('单击一键更新全部缓存，数据量大时会出现卡顿现象，建议单独按需更新'); ?></a></small>
</h3>

<form class="form-horizontal" action="" method="post" id="myform" name="myform">
	<div class="portlet mylistbody">

		<div class="portlet-body">
			<div class="table-scrollable">
				<table class="mytable table table-striped table-bordered table-hover table-checkable dataTable">
					<thead>
					<tr>
						<th width="55"> </th>
						<th> <?php echo fc_lang('更新项目'); ?> </th>
						<th width="400"> </th>
					</tr>
					</thead>
					<tbody>
					<?php if (is_array($list)) { $count=count($list);foreach ($list as $id=>$t) { ?>
					<tr>
						<td>
							<span class="badge badge-success"> <?php echo $id+1; ?> </span>
						</td>
						<td>
							<?php echo fc_lang($t[0]); ?>
						</td>
						<td>
							<label>
								<a href="javascript:my_update_cache('<?php echo $id; ?>', '<?php echo $t[1]; ?>');" class="btn red btn-xs"><i class="fa fa-refresh"></i> <?php echo fc_lang('立即更新'); ?> </a>
							</label>
							<label id="dr_<?php echo $id; ?>_result" >

							</label>
						</td>
					</tr>
					<?php } } ?>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</form>

<script>
    function my_update_cache(id, m) {

        var obj = $('#dr_'+id+'_result');
        obj.html("<img style='height:17px' src='<?php echo THEME_PATH; ?>admin/images/mloading.gif' />");

        if (m == 'app') {
            obj.html('<font color="green"><?php echo fc_lang("更新完成"); ?></font>');
            <?php if (is_array($aurl)) { $count=count($aurl);foreach ($aurl as $url) { ?>
            $.ajax({
                type: "GET",
                url: "<?php echo $url; ?>&"+Math.random(),
                dataType: "text",
                success: function (data) {

                },
                error: function(HttpRequest, ajaxOptions, thrownError) {

                }
            });
            <?php } } ?>

		} else {
            $.ajax({
                type: "GET",
                dataType: "json",
                url: "<?php echo SELF; ?>?c=home&m=cache&at="+m,
                success: function (json) {
                    if (json.code == 0) {
                        obj.html('<font color="red">'+json.msg+'</font>');
                    } else {
                        obj.html('<font color="green"><?php echo fc_lang("更新完成"); ?></font>');
                    }
                },
                error: function(HttpRequest, ajaxOptions, thrownError) {
                    obj.html('<a href="javascript:;" onclick="dr_show_file_code(\'<?php echo fc_lang('查看文件'); ?>\', \'<?php echo dr_url('system/debug_file', array('time'=>SYS_TIME)); ?>\')" style="color:red"><?php echo fc_lang("系统崩溃，请单击把错误日志发给官方处理"); ?></a>');
                }
            });
		}


    }
    function dr_update_cache_all() {
        <?php if (is_array($list)) { $count=count($list);foreach ($list as $id=>$t) { ?>
        my_update_cache('<?php echo $id; ?>', '<?php echo $t[1]; ?>');
        <?php } } ?>
    }
</script>


<?php if ($fn_include = $this->_include("footer.html")) include($fn_include); ?>