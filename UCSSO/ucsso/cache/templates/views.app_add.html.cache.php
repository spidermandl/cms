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
							<label>网站类型</label>
							<select class="form-control" name="data[type]">
								<?php if (is_array($app_type)) { $count=count($app_type);foreach ($app_type as $i=>$t) { ?>
								<option value="<?php echo $i; ?>" <?php if ($data['type']==$i) { ?> selected<?php } ?>><?php echo $t; ?></option>
								<?php } } ?>
							</select>
						</div>
					</div>

					<div class="form-group pull-in clearfix">
						<div class="col-sm-6">
							<label>网站名称</label>
							<input type="text" class="form-control" name="data[name]" value="<?php echo $data['name']; ?>">
						</div>
						<div class="col-sm-6">
							<label>网站地址</label>
							<input type="text" class="form-control" name="data[url]" value="<?php echo $data['url']; ?>">
						</div>
					</div>
					<div class="form-group">
						<label>网站其他地址</label>
						<textarea class="form-control" name="data[value][url]" rows="5"><?php echo $data['value']['url']; ?></textarea>
					</div>

					<div class="form-group">
						<label>通信密钥</label>
						<div class="input-group">
							<input type="text" id="sys_key" name="data[key]" value="<?php echo $data['key']; ?>" class="form-control">
							<span class="input-group-btn">
                            <button class="btn btn-default" onclick="dr_to_key()" type="button">随机生成</button>
                          </span>
						</div>
					</div>

					<div class="form-group pull-in clearfix">
						<div class="col-sm-6">
							<label>网站IP</label>
							<input type="text" class="form-control " name="data[value][ip]" value="<?php echo $data['value']['ip']; ?>">
							<span class="help-block m-b-none">当网站URL无法访问时，使用IP进行访问。</span>
						</div>
						<div class="col-sm-6">
							<label>通信文件</label>
							<input type="text" class="form-control " name="data[value][file]" value="<?php echo $data['value']['file']; ?>">
							<span class="help-block m-b-none">其他类型网站时的自定义接口文件。</span>
						</div>
					</div>

					<div class="form-group">
						<label>通信配置代码，用于UCSSO客户端的配置文件</label>
						<textarea class="form-control" rows="8"><?php echo $code; ?></textarea>
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