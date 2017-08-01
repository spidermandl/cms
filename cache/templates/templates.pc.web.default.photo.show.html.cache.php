<?php if ($fn_include = $this->_include("header.html", "/")) include($fn_include); ?>
<script language="javascript">
	// 这是加入收藏夹的ajax请求，我就随意写了一下提示信息，至于美化啊什么交给你们了
	function dr_favorite() {
		$.get("/index.php?s=<?php echo MOD_DIR; ?>&c=api&m=favorite&id=<?php echo $id; ?>", function(data){
			if (data == 1) {
				dr_tips("没有登录，不能收藏");
			} else if (data == 2) {
				dr_tips("文档不存在，无法收藏");
			} else if (data == 3) {
				dr_tips("更新收藏成功", 3, 1);
			} else if (data == 4) {
				dr_tips("收藏成功", 3, 1);
			}
		});
	}
</script>
<div class="page-container">
	<div class="page-content-wrapper">
		<?php if ($fn_include = $this->_include("header.html")) include($fn_include); ?>
		<div class="page-content">
			<div class="container">

				<ul class="page-breadcrumb breadcrumb">
					<li>
						<a href="<?php echo SITE_URL; ?>">首页</a>
						<i class="fa fa-circle"></i>
					</li>
					<?php if (!IS_SHARE) { ?>
					<li>
						<a href="<?php echo MODULE_URL; ?>"><?php echo MODULE_NAME; ?></a>
						<i class="fa fa-circle"></i>
					</li>
					<?php }  echo dr_catpos($catid, '', true, '<li><a href="{url}">{name}</a><i class="fa fa-circle"></i></li>'); ?>
					<li>
						<span><?php echo $title; ?></span>
					</li>
				</ul>

				<div class="page-content-inner">
					<div class="search-page search-content-2">
						<div class="row">
							<div class="col-md-12">

								<div class="portlet light">
									<div class="portlet-title">
										<div class="caption">
											<span class="caption-subject font-dark bold uppercase"><?php echo $title; ?></span>
										</div>
										<div class="actions">
											<a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title="全屏查看"> </a>
										</div>
									</div>
									<div class="search-post-foot" style="padding-top:0px;text-align:left;padding-bottom: 10px">
										<div class="search-post-meta">
											<i class="icon-user font-blue"></i>
											<a href="javascript:;"><?php echo $author; ?></a>
										</div>
										<div class="search-post-meta">
											<i class="icon-calendar font-blue"></i>
											<a href="javascript:;"><?php echo $updatetime; ?></a>
										</div>
										<div class="search-post-meta">
											<i class="icon-fire font-blue"></i>
											<a href="javascript:;"><?php echo dr_show_hits($id); ?>次</a>
										</div>
										<div class="search-post-meta">
											<i class="icon-bubble font-blue"></i>
											<a href="javascript:;"><?php echo $comments; ?></a>
										</div>
										<div class="search-post-meta">
											<i class="icon-flag font-blue"></i>
											<a href="javascript:dr_favorite();">加入收藏</a>
										</div>
									</div>
									<div class="portlet-body" style="height: auto;">
										<?php echo $content; ?>
									</div>

									<div class="blog-single-foot">
										<div id="myphoto">
											<div class="row">

												<div class="col-md-12">
													<div id="photosDemo" class="photos-demo">
														<!-- layer-src表示大图  layer-pid表示图片id  src表示缩略图-->

														<?php if (is_array($images)) { $count=count($images);foreach ($images as $i=>$t) { ?>
														<img layer-src="<?php echo dr_get_file($t['file']); ?>" layer-pid="" src="<?php echo dr_thumb($t['file'], 200, 200); ?>" alt="<?php echo $t['title']; ?>">

														<?php } } ?>

													</div>
												</div>
											</div>
										</div>
										<ul class="blog-post-tags" style="margin-top: 20px;">
											<?php if (is_array($keyword_list)) { $count=count($keyword_list);foreach ($keyword_list as $name=>$url) { ?>
											<li class="uppercase">
												<a href="<?php echo $url; ?>" target="_blank"><?php echo $name; ?></a>
											</li>
											<?php } } ?>
										</ul>
										<p class="f14" style="margin-bottom: 0">
											<strong>上一篇：</strong><?php if ($prev_page) { ?><a href="<?php echo $prev_page['url']; ?>"><?php echo $prev_page['title']; ?></a><?php } else { ?>没有了<?php } ?><br>
											<strong>下一篇：</strong><?php if ($next_page) { ?><a href="<?php echo $next_page['url']; ?>"><?php echo $next_page['title']; ?></a><?php } else { ?>没有了<?php } ?>
										</p>
									</div>

									<?php echo dr_module_comment(MOD_DIR, $id); ?>

								</div>


							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>
</div>

<style>
	#photosDemo img {
		margin-bottom: 20px;
		margin-right: 15px;
		width: 200px;
		padding:5px;
		height: 150px;
		background-color: #fff;
		border: 1px solid #ddd;
		border-radius: 4px;
		cursor: pointer;
	}
</style>
<script type="text/javascript" src="<?php echo THEME_PATH; ?>js/layer/layer.js"></script>
<script type="text/javascript">
jQuery(function($) {
		//加载扩展模块
		layer.config({
			extend: 'extend/layer.ext.js'
		});

		//页面一打开就执行，放入ready是为了layer所需配件（css、扩展模块）加载完毕
		layer.ready(function(){
			//使用相册
			layer.photos({
				photos: '#photosDemo'
			});
		});



	});
</script>

<?php if ($fn_include = $this->_include("footer.html", "/")) include($fn_include); ?>