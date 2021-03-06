<?php if ($fn_include = $this->_include("header.html")) include($fn_include); ?>

<section class="vbox">
	<section class="scrollable padder">
		<div class="m-b-md">
			<h3 class="m-b-none"><i class="<?php echo $my_menu[1]; ?>"></i> <?php echo $my_menu[0]; ?></h3>
		</div>
		<form id="myform" action="">
			<section class="panel panel-default">
				<header class="panel-heading">
					<span class="h4"><?php echo $name; ?></span>
				</header>
				<div class="panel-body">


					<div class="form-group pull-in clearfix">
						<div class="col-sm-6">
							<label>用户账号</label>
							<input <?php if ($data['id']) { ?> readonly<?php } ?> type="text" class="form-control" name="data[username]" value="<?php echo $data['username']; ?>">
						</div>
						<div class="col-sm-6">
							<label>登录密码</label>
							<input type="text" class="form-control" name="password">
							<span class="help-block m-b-none">留空表示不修改密码</span>
						</div>
					</div>

					<div class="form-group pull-in clearfix">
						<div class="col-sm-6">
							<label>邮箱地址</label>
							<input type="text" class="form-control " name="data[email]" value="<?php echo $data['email']; ?>">
						</div>
						<div class="col-sm-6">
							<label>手机号码</label>
							<input type="text" class="form-control " name="data[phone]" value="<?php echo $data['phone']; ?>">
						</div>
					</div>

				</div>
				<footer class="panel-footer text-right bg-light lter">
					<button type="button" onclick="dr_ajax_submit('<?php echo dr_now_url(); ?>', 'myform', 2000)" class="btn btn-success btn-s-xs">提交保存</button>
				</footer>
			</section>
		</form>
	</section>
</section>

<script type="text/javascript">
	function dr_to_key() {
		$.get("<?php echo dr_url('app/syskey'); ?>", function(data){
			$("#sys_key").val(data);
		});
	}
</script>
<?php if ($fn_include = $this->_include("footer.html")) include($fn_include); ?>