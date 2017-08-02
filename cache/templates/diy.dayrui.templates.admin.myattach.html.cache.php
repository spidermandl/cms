<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>admin</title>
<link href="<?php echo THEME_PATH; ?>admin/css/index.css" rel="stylesheet" type="text/css" />
<link href="<?php echo THEME_PATH; ?>admin/css/table_form.css" rel="stylesheet" type="text/css" />
<link href="<?php echo THEME_PATH; ?>js/swfupload/swfupload.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">var memberpath = "<?php echo MEMBER_PATH; ?>";</script>
<script type="text/javascript" src="<?php echo THEME_PATH; ?>js/<?php echo SITE_LANGUAGE; ?>.js"></script>
<script type="text/javascript" src="<?php echo THEME_PATH; ?>js/jquery.min.js"></script>
<script type="text/javascript" src="<?php echo THEME_PATH; ?>js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<?php echo THEME_PATH; ?>js/jquery.artDialog.js?skin=default"></script>
<script type="text/javascript" src="<?php echo THEME_PATH; ?>js/validate.js"></script>
<script type="text/javascript" src="<?php echo THEME_PATH; ?>js/admin.js"></script>
<script type="text/javascript" src="<?php echo THEME_PATH; ?>js/dayrui.js"></script>
<script type="text/javascript" src="<?php echo THEME_PATH; ?>js/swfupload/swfupload.js"></script>
<script type="text/javascript" src="<?php echo THEME_PATH; ?>js/swfupload/fileprogress.js"></script>
<script type="text/javascript" src="<?php echo THEME_PATH; ?>js/swfupload/handlers.js"></script>
</head>
<body>
<style type="text/css">
#imgPreview .on td {
    background: none repeat scroll 0 0 #FFD283;
}
#imgPreview .on a {
    background: url("<?php echo THEME_PATH; ?>admin/images/msg_bg.png") no-repeat scroll right -250px transparent;
    display: -moz-inline-stack;
    height: 16px;
    line-height: 16px;
    padding-right: 70px;
    vertical-align: middle;
}
* { font-size: 12px;}
</style>
<div class="subnav">
	<div class="table-list">
		<table width="100%" cellspacing="0" id="imgPreview">
		<tbody>
		<tr><td align="left"><?php echo fc_lang('当前目录'); ?>：<?php echo $path; ?></td></tr>
		<?php if (strlen($parent)>1) { ?>
		<tr>
		<td align="left"><img src="<?php echo THEME_PATH; ?>admin/images/ext/dir.gif">&nbsp;<a href="<?php echo $purl; ?>"><?php echo fc_lang('上一层目录'); ?></a></td>
		</tr>
		<?php }  if (is_array($list)) { $count=count($list);foreach ($list as $k=>$t) { ?>
		<tr>
		<td align="left" onclick="<?php if ($t['type']=='file') { ?>album_cancel(this)<?php } ?>">
		<img src="<?php echo $t['icon']; ?>">
		&nbsp;<a href="<?php if ($t['type']=='dir') {  echo $t['file'];  } else { ?>javascript:;<?php } ?> " rel="<?php echo $t['file']; ?>" path="<?php echo $t['icon']; ?>" src="<?php echo $t['file']; ?>" aid="<?php echo $t['file']; ?>" name="<?php echo $t['name']; ?>" size="<?php echo $t['size']; ?>" title="<?php echo $t['name']; ?>"><?php echo $t['name']; ?></a></td>
		</tr>
		<?php } } ?>
		</tbody>
		</table>
	</div>
</div>
<script type="text/javascript">
(function(c){c.expr[':'].linkingToImage=function(a,g,e){return!!(c(a).attr(e[3])&&c(a).attr(e[3]).match(/\.(gif|jpe?g|png|bmp)$/i))};c.fn.imgPreview=function(j){var b=c.extend({imgCSS:{},distanceFromCursor:{top:10,left:10},preloadImages:true,onShow:function(){},onHide:function(){},onLoad:function(){},containerID:'imgPreviewContainer',containerLoadingClass:'loading',thumbPrefix:'',srcAttr:'href'},j),d=c('<div/>').attr('id',b.containerID).append('<img/>').hide().css('position','absolute').appendTo('body'),f=c('img',d).css(b.imgCSS),h=this.filter(':linkingToImage('+b.srcAttr+')');function i(a){return a.replace(/(\/?)([^\/]+)$/,'$1'+b.thumbPrefix+'$2')}if(b.preloadImages){(function(a){var g=new Image(),e=arguments.callee;g.src=i(c(h[a]).attr(b.srcAttr));g.onload=function(){h[a+1]&&e(a+1)}})(0)}h.mousemove(function(a){d.css({top:a.pageY+b.distanceFromCursor.top+'px',left:a.pageX+b.distanceFromCursor.left+'px'})}).hover(function(){var a=this;d.addClass(b.containerLoadingClass).show();f.load(function(){d.removeClass(b.containerLoadingClass);f.show();b.onLoad.call(f[0],a)}).attr('src',i(c(a).attr(b.srcAttr)));b.onShow.call(d[0],a)},function(){d.hide();f.unbind('load').attr('src','').hide();b.onHide.call(d[0],this)});return this}})(jQuery);
$(function(){
	var obj=$("#imgPreview a[rel]");
	if(obj.length>0) {
		$('#imgPreview a[rel]').imgPreview({
			srcAttr: 'rel',
			imgCSS: { width: 200 }
		});
	}
});	
$(function(){
	set_status_empty();
});	
function set_status_empty(){
	parent.window.$('#att-status').html('');
	parent.window.$('#att-name').html('');
}
function album_cancel(obj){
	var aid = $(obj).children("a").attr("aid");
	if ($(obj).parent().hasClass('on')){
		$(obj).parent().removeClass("on");
		var imgstr = parent.window.$("#att-status").html();
		var length = parent.window.$("a[class='on']").children("img").length;
		var strs = '';
		for (var i=0;i<length;i++){
			strs += '|'+$("a[class='on']").children("a").eq(i).attr('aid')+','+$("a[class='on']").children("a").eq(i).attr('path')+','+$("a[class='on']").children("a").eq(i).attr('size')+','+$("a[class='on']").children("a").eq(i).attr('name');
		}
		parent.window.$('#att-status').html(strs);
	} else {
		var num = parent.window.$('#att-status').html().split('|').length;
		var file_upload_limit = '<?php echo $fcount; ?>';
		if(num > <?php echo $fcount; ?>) {
		    alert("<?php echo fc_lang('不能选择超过 %s 个文件', $fcount); ?>");
			return false;
		}
		$(obj).parent().addClass("on");
		var value = '|'+aid+','+$(obj).children("a").attr("path")+','+$(obj).children("a").attr("size")+','+$(obj).children("a").attr("name");
		parent.window.$('#att-status').append(value);
	}
}
</script>

</body>
</html>