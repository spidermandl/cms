<?php if ($fn_include = $this->_include("header.html")) include($fn_include); ?>

<form id="myform">
<section class="vbox">
	<section class="scrollable padder">
		<div class="m-b-md">
			<h3 class="m-b-none"><i class="<?php echo $my_menu[1]; ?>"></i> <?php echo $my_menu[0]; ?></h3>
		</div>
		<section class="panel panel-default">
			<header class="panel-heading">
				我的网站
			</header>
			<div class="row wrapper">

				<div class="col-sm-12 text-right">

					<a href="<?php echo dr_url('app/add'); ?>" class="btn btn-sm btn-default"><i class="fa fa-plus"></i> 添加网站</a>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table table-striped b-t b-light">
					<thead>
					<tr>
						<th width="20"><label class="checkbox m-l m-t-none m-b-none i-checks"><input type="checkbox"><i></i></label></th>
						<th width="130">类型</th>
						<th>名称</th>
						<th>地址</th>
						<th>状态</th>
						<th  width="100" ></th>
					</tr>
					</thead>
					<tbody>
					<?php if (is_array($list)) { $count=count($list);foreach ($list as $t) { ?>
					<tr>
						<td><label class="checkbox m-l m-t-none m-b-none i-checks"><input type="checkbox" name="ids[]" value="<?php echo $t['id']; ?>"><i></i></label></td>
						<td><?php echo $app_type[$t['type']]; ?></td>
						<td><?php echo $t['name']; ?></td>
						<td><a href="<?php echo $t['url']; ?>" target="_blank"><?php echo $t['url']; ?></a></td>
						<td id="web_<?php echo $t['id']; ?>"><span class="label label-info">检测中</span></td>
						<td>
							<a href="<?php echo dr_url('app/edit', array('id'=>$t['id'])); ?>" class="btn btn-xs btn-info"><i class="fa fa-edit"></i> 修改</a>
						</td>
					</tr>
					<?php } } ?>
					</tbody>
				</table>
			</div>
			<footer class="panel-footer">
				<div class="row">
					<div class="col-sm-4" style="padding-left: 10px">
						<button type="button" class="btn btn-sm btn-danger" onclick="dr_ajax_option('<?php echo dr_url('app/del'); ?>', '确定要删除站点吗？');"><i class="fa fa-times"></i>  删除 </button>
					</div>

				</div>
			</footer>
		</section>
	</section>
</section>
</form>
<?php if ($fn_include = $this->_include("footer.html")) include($fn_include); ?>

<script>
	<?php if (is_array($cache)) { $count=count($cache);foreach ($cache as $i=>$t) { ?>
	$.ajax({
		type: "GET",
		dataType: "jsonp",
		url: '<?php echo $t[url][0]; ?>?time=<?php echo SYS_TIME; ?>&code=<?php echo urlencode(ucsso_authcode("&time=".SYS_TIME, "ENCODE", $t['key'])); ?>',
		success: function(json) {
			if (json.code == 1) {
				$('#web_<?php echo $i; ?>').html('<span class="label label-success danger">通信成功</span>');
			} else {
				$('#web_<?php echo $i; ?>').html('<span class="label label-danger">异常：'+json.msg+'</span>');
			}
		},
		error: function(HttpRequest, ajaxOptions, thrownError) {
			$('#web_<?php echo $i; ?>').html('<span class="label label-danger">通信失败</span>');
		}
	});
	<?php } } ?>
</script>