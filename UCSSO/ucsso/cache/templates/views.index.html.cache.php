<?php if ($fn_include = $this->_include("header.html")) include($fn_include); ?>

<section class="hbox stretch">
	<section>
		<section class="vbox">
			<section class="scrollable padder">
				<section class="row m-b-md">
					<div class="col-sm-6">
						<h3 class="m-b-xs text-black">UCSSO</h3>
						<small>欢迎使用UCSSO单点登录用户管理平台</small>
					</div>

				</section>
				<div class="row">
					<div class="col-sm-12">
						<div class="panel b-a">
							<div class="row m-n">
								<div class="col-md-6 b-b b-r">
									<a href="<?php echo dr_url('app/index'); ?>" class="block padder-v hover">
									  <span class="i-s i-s-2x pull-left m-r-sm">
										<i class="i i-hexagon2 i-s-base text-danger hover-rotate"></i>
										<i class="fa fa-puzzle-piece i-1x text-white"></i>
									  </span>
										<span class="clear">
                                <span class="h3 block m-t-xs text-danger"><?php echo $apps; ?></span>
                                <small class="text-muted text-u-c">网站数量</small>
                              </span>
									</a>
								</div>
								<div class="col-md-6 b-b">
									<a href="<?php echo dr_url('member/index'); ?>" class="block padder-v hover">
                              <span class="i-s i-s-2x pull-left m-r-sm">
                                <i class="i i-hexagon2 i-s-base text-success-lt hover-rotate"></i>
                                <i class="i i-users2 i-sm text-white"></i>
                              </span>
										<span class="clear">
                                <span class="h3 block m-t-xs text-success"><?php echo $members; ?></span>
                                <small class="text-muted text-u-c">用户数量</small>
                              </span>
									</a>
								</div>

						</div>
					</div>
				</div>
						<div class="col-sm-12">

							<section class="panel panel-default">
								<table class="table table-striped m-b-none">
									<tbody>

									<?php if (is_array($app)) { $count=count($app);foreach ($app as $i=>$t) { ?>
									<tr>
										<td><?php echo $t['name']; ?></td>
										<td><a href="<?php echo $t['root']; ?>" target="_blank"><?php echo $t['root']; ?></a></td>
										<td id="web_<?php echo $i; ?>"><span class="label label-info">检测中</span></td>
									</tr>
									<?php } } ?>
									<tr>
										<td>服务器信息</td>
										<td></td>
										<td class="text-right"></td>
									</tr>
									<tr>
										<td>程序版本</td>
										<td>v<?php echo UCSSO_VERSION; ?></td>
										<td class="text-right"></td>
									</tr>
									<tr>
										<td>头像上传目录</td>
										<td><?php echo FCPATH; ?>avatar/</td>
										<td class="text-right"></td>
									</tr>
									<tr>
										<td>程序策划</td>
										<td>王春杰</td>
										<td class="text-right"></td>
									</tr>
									<tr>
										<td>开发厂商</td>
										<td>成都天睿信息技术有限公司</td>
										<td class="text-right"></td>
									</tr>
									</tbody>
								</table>
							</section>

						</div>

			</section>

		</section>
	</section>
	<!-- side content -->
	<!-- / side content -->
</section>


<?php if ($fn_include = $this->_include("footer.html")) include($fn_include); ?>

<script>
	<?php if (is_array($app)) { $count=count($app);foreach ($app as $i=>$t) { ?>
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