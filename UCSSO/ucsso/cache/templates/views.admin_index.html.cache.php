<?php if ($fn_include = $this->_include("header.html")) include($fn_include); ?>

<section class="vbox">
	<section class="scrollable padder">
		<div class="m-b-md">
			<h3 class="m-b-none"><i class="<?php echo $my_menu[1]; ?>"></i> <?php echo $my_menu[0]; ?></h3>
		</div>
		<section class="panel panel-default">
			<header class="panel-heading">
				管理员
			</header>
			<div class="row wrapper">
				<div class="col-sm-6 m-b-xs">
					<form>
						<input type="hidden" name="c" value="admin">
						<input type="hidden" name="m" value="index">
						<input type="hidden" name="page" value="0">
						<input type="hidden" name="total" value="0">
						<div class="input-group">
							<input type="text" name="keyword" value="<?php echo $param['keyword']; ?>" class="input-sm form-control" placeholder="用户名...">
							<span class="input-group-btn">
							<button class="btn btn-sm btn-default" type="submit">搜索</button>
						  </span>
						</div>
					</form>
				</div>
				<div class="col-sm-6 text-right">

					<a href="<?php echo dr_url('admin/add'); ?>" class="btn btn-sm btn-default"><i class="fa fa-plus"></i> 添加管理员</a>
				</div>
			</div>
			<form id="myform">
			<div class="table-responsive">
				<table class="table table-striped b-t b-light" style="margin-bottom: 0">
					<thead>
					<tr>
						<th width="20"><label class="checkbox m-l m-t-none m-b-none i-checks"><input type="checkbox"><i></i></label></th>
						<th>登录账号</th>
						<th>注册时间</th>
						<th width="100"></th>
					</tr>
					</thead>
					<tbody>
					<?php if (is_array($list)) { $count=count($list);foreach ($list as $t) { ?>
					<tr>
						<td><label class="checkbox m-l m-t-none m-b-none i-checks"><input type="checkbox" value="<?php echo $t['id']; ?>" name="ids[]"><i></i></label></td>
						<td ><?php echo $t['username']; ?></td>
						<td ><?php echo date('Y-m-d H:i:s', $t['regtime']); ?></td>
						<td >
							<a href="<?php echo dr_url('admin/edit', array('id'=>$t['id'])); ?>" class="btn btn-xs btn-info"><i class="fa fa-edit"></i> 修改</a>

						</td>
					</tr>
					<?php } } ?>
					</tbody>
				</table>
			</div>
			</form>
			<footer class="panel-footer">
				<div class="row">

						<div class="col-sm-4" style="padding-left: 10px">
							<button type="button" class="btn btn-sm btn-danger" onclick="dr_ajax_option('<?php echo dr_url('admin/del'); ?>', '确定要删除用户吗？');"><i class="fa fa-times"></i>  删除 </button>
						</div>
					<div class="col-sm-4 text-center">
						<small class="text-muted inline m-t-sm m-b-sm">共<?php echo $total; ?>个用户</small>
					</div>
					<div class="col-sm-4 text-right text-center-xs">
						<ul class="pagination pagination-sm m-t-none m-b-none">
							<?php echo $pages; ?>
						</ul>
					</div>
				</div>
			</footer>
		</section>
	</section>
</section>


<?php if ($fn_include = $this->_include("footer.html")) include($fn_include); ?>