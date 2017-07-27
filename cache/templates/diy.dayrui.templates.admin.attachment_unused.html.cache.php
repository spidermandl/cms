<?php if ($fn_include = $this->_include("nheader.html")) include($fn_include); ?>
<div class="page-bar">
	<ul class="page-breadcrumb mylink">
		<?php echo $menu['link']; ?>

	</ul>
	<ul class="page-breadcrumb myname">
		<?php echo $menu['name']; ?>
	</ul>
	<div class="page-toolbar">
		<div class="btn-group pull-right">
			<button type="button" class="btn green btn-sm btn-outline dropdown-toggle" data-toggle="dropdown" aria-expanded="false" data-hover="dropdown"> <?php echo fc_lang('操作菜单'); ?>
				<i class="fa fa-angle-down"></i>
			</button>
			<ul class="dropdown-menu pull-right" role="menu">
				<?php if (is_array($menu['quick'])) { $count=count($menu['quick']);foreach ($menu['quick'] as $t) { ?>
				<li>
					<a href="<?php echo $t['url']; ?>"><?php echo $t['icon'];  echo $t['name']; ?></a>
				</li>
				<?php } } ?>
				<li class="divider"> </li>
				<li>
					<a href="javascript:window.location.reload();">
						<i class="icon-refresh"></i> <?php echo fc_lang('刷新页面'); ?></a>
				</li>
			</ul>
		</div>
	</div>
</div>

<div class="mytopsearch">
	<form method="post" action="" name="searchform" id="searchform">
		<input name="search" id="search" type="hidden" value="1" />
		<label><?php echo fc_lang('录入作者'); ?> ：</label>
		<label><input style="height: 22px" type="text" class="form-control" placeholder="<?php echo fc_lang('录入作者'); ?>" value="<?php echo $author; ?>" name="author" /></label>
		<label><button type="submit" class="btn green btn-sm" name="submit"> <i class="fa fa-search"></i> <?php echo fc_lang('搜索'); ?></button></label>
	</form>
</div>


<form action="" method="post" name="myform" id="myform">
	<input name="action" id="action" type="hidden" value="del" />
	<div class="portlet mylistbody">
		<div class="portlet-body">
			<div class="table-scrollable">

				<table class="mytable table table-striped table-bordered table-hover table-checkable dataTable">

		<thead>
		<tr>
			<th width="20" align="right"></th>
			<th><?php echo fc_lang('原文件名'); ?></th>
			<th><?php echo fc_lang('扩展名'); ?></th>
			<th><?php echo fc_lang('文件大小'); ?></th>
			<th><?php echo fc_lang('远程附件'); ?></th>
			<th><?php echo fc_lang('录入作者'); ?></th>
			<th><?php echo fc_lang('上传时间'); ?></th>
		</tr>
		</thead>
		<tbody>
		<?php if (is_array($list)) { $count=count($list);foreach ($list as $t) { ?>
		<tr id="dr_row_<?php echo $t['id']; ?>">
			<td align="right"><input name="ids[]" type="checkbox" class="dr_select toggle md-check" value="<?php echo $t['id']; ?>" /></td>
			<td><a onclick="dr_show_file_info('<?php echo $t['id']; ?>')" href="javascript:;"><?php echo dr_strcut($t['filename'], 60); ?></a></td>
			<td><span class="label label-sm label-info"><?php echo $t['fileext']; ?></span></td>
			<td><?php echo dr_format_file_size($t['filesize']); ?></td>
			<td><?php if ($t['remote']) { ?><span class="label label-sm label-success"><?php echo fc_lang('是'); ?></span><?php } else { ?><span class="label label-sm label-danger"><?php echo fc_lang('否'); ?></span><?php } ?></td>
			<td><a href="javascript:;" onclick="dr_dialog_member('<?php echo $t['uid']; ?>')"><?php echo dr_strcut($t['author'], 10); ?></a></td>
			<td><?php echo dr_date($t['inputtime'], NULL, 'red'); ?></td>

		</tr>
		<?php } } ?>
		<tr class="mtable_bottom">
			<th width="20" ><input class=" toggle md-check" name="dr_select" id="dr_select" type="checkbox" onClick="dr_selected()" /></th>
			<td colspan="7" >
				<?php if ($this->ci->is_auth('admin/attachment/del')) { ?>
				<button data-toggle="confirmation" id="dr_confirm_set_all" data-original-title="<?php echo fc_lang('您确定要这样操作吗？'); ?>" type="button" class="btn red btn-sm" name="option"> <i class="fa fa-trash"></i> <?php echo fc_lang('删除'); ?></button>
				<?php }  if ($this->ci->is_auth('admin/attachment/add')) { ?>
				<button data-toggle="confirmation" id="dr_confirm_order" data-original-title="<?php echo fc_lang('您确定要这样操作吗？'); ?>" type="button" class="btn blue btn-sm" name="option"> <i class="fa fa-plus"></i> <?php echo fc_lang('归档'); ?></button>
				<?php } ?>
			</td>
		</tr>
		</tbody>
		</table>
		</div>
	</div>
</div>
</form>
<div id="pages"><a><?php echo fc_lang('共%s条', $param['total']); ?></a><?php echo $pages; ?></div>
<?php if ($fn_include = $this->_include("nfooter.html")) include($fn_include); ?>