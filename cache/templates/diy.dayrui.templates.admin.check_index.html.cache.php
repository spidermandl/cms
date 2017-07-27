<?php if ($fn_include = $this->_include("nheader.html")) include($fn_include); ?>
<div class="page-bar">
	<ul class="page-breadcrumb">
		<li><a href="<?php echo dr_url('check/index'); ?>" class="blue"> <i class="icon-compass"></i> <?php echo fc_lang('系统体检'); ?></a> <i class="fa fa-circle"></i></li>
		<li><a href="<?php echo dr_url('check/phpinfo'); ?>" target="_blank"> <i class="fa fa-pie-chart"></i> <?php echo fc_lang('PHP环境'); ?></a></li>
	</ul>
</div>

<h3 class="page-title">
	<small>绿色部分表示正常配置，红色部分表示推荐处理。</small>
</h3>

<div class="portlet light bordered">
	<div class="portlet-body">
		<div class="table-list">
			<table width="100%" id="dr_result">
			</table>
		</div>
	</div>
</div>
<script type="text/javascript">
$("#dr_result").html("");
<?php if (is_array($step)) { $count=count($step);foreach ($step as $id=>$name) { ?>
$.ajax({
    type: "GET",
    url: "<?php echo dr_url('check/todo', array('step'=>$id)); ?>&"+Math.random(),
    contentType: "application/json; charset=utf-8",
    dataType: "text",
    success: function (data) {
        $("#dr_result").append(data);
    }
});
<?php } } ?>

</script>
<?php if ($fn_include = $this->_include("nfooter.html")) include($fn_include); ?>