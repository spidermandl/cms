<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title><?php echo $meta_title; ?></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="www.dayrui.com" name="author" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="<?php echo THEME_PATH; ?>admin/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo THEME_PATH; ?>admin/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo THEME_PATH; ?>admin/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo THEME_PATH; ?>admin/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo THEME_PATH; ?>admin/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN THEME GLOBAL STYLES -->
    <link href="<?php echo THEME_PATH; ?>admin/global/css/components-rounded.min.css" rel="stylesheet" id="style_components" type="text/css" />
    <link href="<?php echo THEME_PATH; ?>admin/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <!-- END THEME GLOBAL STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="<?php echo THEME_PATH; ?>admin/pages/css/login.min.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->

    <!--[if lt IE 9]>
    <script src="<?php echo THEME_PATH; ?>admin/global/plugins/respond.min.js"></script>
    <script src="<?php echo THEME_PATH; ?>admin/global/plugins/excanvas.min.js"></script>
    <![endif]-->
    <!-- BEGIN CORE PLUGINS -->
    <script src="<?php echo THEME_PATH; ?>admin/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>admin/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>admin/global/plugins/js.cookie.min.js" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>admin/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>admin/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>admin/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>admin/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <script src="<?php echo THEME_PATH; ?>admin/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="<?php echo THEME_PATH; ?>admin/global/scripts/app.min.js" type="text/javascript"></script>
    <!--关键JS开始-->
    <script type="text/javascript">var memberpath = "<?php echo MEMBER_PATH; ?>";</script>
    <script type="text/javascript" src="<?php echo THEME_PATH; ?>js/<?php echo SITE_LANGUAGE; ?>.js"></script>
    <link rel="stylesheet" href="<?php echo THEME_PATH; ?>js/ui-dialog.css">
    <script type="text/javascript"t src="<?php echo THEME_PATH; ?>js/dialog-plus.js"></script>
    <script type="text/javascript" src="<?php echo THEME_PATH; ?>js/jquery.artDialog.js?skin=default"></script>
    <script type="text/javascript" src="<?php echo THEME_PATH; ?>js/dayrui.js"></script>
    <!--关键js结束-->
</head>
<!-- END HEAD -->

<body class=" login">
<div class="menu-toggler sidebar-toggler"></div>
<!-- END SIDEBAR TOGGLER BUTTON -->
<!-- BEGIN LOGO -->
<div class="logo">
    <a href="<?php echo SITE_URL; ?>">
        <img src="<?php echo MEMBER_THEME_PATH; ?>logo.png" /> </a>
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<div class="content" style="margin-top: 10px">
    <!-- BEGIN LOGIN FORM -->
    <form class="login-form" id="myform" action="" method="post">
        <input type="hidden" name="back" value="<?php echo $back_url; ?>">
        <h3 class="form-title font-green">会员登录</h3>

        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">会员名称</label>
            <input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="Username" name="data[username]" />
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">登录密码</label>
            <input class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off" placeholder="Password" name="data[password]" />
        </div>
        <?php if ($code) { ?>
        <div class="form-group">
            <?php if (strlen(SYS_GEE_CAPTCHA_ID) > 10) {  echo dr_geetest();  } else { ?>
            <div class="col-sm-6" style="padding-left:0;padding-right:0">
                <input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="验证码" name="code" />
            </div>
            <div class="col-sm-6">
                <img align="absmiddle" id="dr_code_img" style="cursor:pointer;" onclick="this.src='<?php echo dr_member_url('api/captcha', array('width' => 120, 'height' => 40)); ?>&'+Math.random();" src="<?php echo dr_member_url('api/captcha', array('width' => 120, 'height' => 40)); ?>" />
            </div>
            <?php } ?>
        </div>
        <?php } ?>
        <div class="form-actions">
            <button type="button" onclick="dr_submit()" class="btn green uppercase">登录</button>
            <label class="rememberme check">
                <input type="checkbox" name="data[auto]" value="1" checked="checked" />免登录 </label>
            <a href="<?php echo dr_member_url('login/find'); ?>" class="forget-password">找回密码</a>
        </div>
        <div class="login-options" style="margin-bottom: 10px">
            <ul class="social-icons">
                <?php $return = $this->list_tag("action=cache name=oauth"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                <li>
                    <a class="social-icon-color facebook" style="border-radius:0!important;background-position:0 0!important;background: url(<?php echo THEME_PATH; ?>oauth/<?php echo $t['id']; ?>.png) no-repeat" href="javascript:;" onclick="window.location.href='<?php echo dr_member_url('api/oauth'); ?>&id=<?php echo $t['id']; ?>'">

                    </a>
                </li>
                <?php } } ?>
            </ul>
        </div>
        <div class="create-account">
            <p>
                <a href="<?php echo dr_member_url('register/index'); ?>" id="register-btn" class="uppercase">注册账号</a>
            </p>
        </div>
    </form>
    <!-- END LOGIN FORM -->
</div>
<div class="copyright"> <?php echo date('Y'); ?> © <?php echo DR_NAME; ?> v<?php echo DR_VERSION; ?> </div>
</body>
<script type="text/javascript">
    function dr_submit() {
        var post = $("#myform").serialize();
        $.ajax({type: "POST",dataType:"json", url: "<?php echo dr_now_url(); ?>", data: post,
            success: function(data) {
                if (data.status) {
                    dr_tips('登录成功，即将为您跳转....', 3, 1);
                    setTimeout('window.location.href="'+data.backurl+'"', <?php echo $_GET['debug'] ? 999999: 2000;?>);
                    var sync_url = data.syncurl;
                    // 发送同步登录信息
                    for(var i in sync_url){
                        $.ajax({
                            type: "GET",
                            async: false,
                            url:sync_url[i],
                            dataType: "jsonp",
                            success: function(json){ },
                            error: function(){ }
                        });
                    }
                } else {
                    $('#dr_code_img').click();
                    dr_tips(data.code);
                }
            },
            error: function(HttpRequest, ajaxOptions, thrownError) {
                alert(HttpRequest.responseText);
            }
        });
    }
</script>
</html>
