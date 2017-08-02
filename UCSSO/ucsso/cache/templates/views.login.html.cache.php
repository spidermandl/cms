<!DOCTYPE html>
<html lang="en" class=" ">
<head>  
  <meta charset="utf-8" />
  <title><?php echo $meta_title; ?></title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <link rel="stylesheet" href="static/css/bootstrap.css" type="text/css" />
  <link rel="stylesheet" href="static/css/animate.css" type="text/css" />
  <link rel="stylesheet" href="static/css/font-awesome.min.css" type="text/css" />
  <link rel="stylesheet" href="static/css/icon.css" type="text/css" />
  <link rel="stylesheet" href="static/css/font.css" type="text/css" />
  <link rel="stylesheet" href="static/css/app.css" type="text/css" />
    <!--[if lt IE 9]>
    <script src="static/js/ie/html5shiv.js"></script>
    <script src="static/js/ie/respond.min.js"></script>
    <script src="static/js/ie/excanvas.js"></script>
  <![endif]-->
</head>
<body style="padding-top: 50px" >
  <section id="content" class="m-t-lg wrapper-md animated fadeInUp">    
    <div class="container aside-xl">
      <a class="navbar-brand block" href="#">UCSSO</a>
      <section class="m-b-lg">
        <header class="wrapper text-center">
          <strong>UCSSO管理平台</strong>
        </header>
        <form action="" method="post" id="myform">
          <div class="list-group">
            <div class="list-group-item">
              <input type="text" value="<?php echo $data['username']; ?>" name="data[username]" placeholder="管理员账号" class="form-control no-border">
            </div>
            <div class="list-group-item">
               <input type="password" name="data[password]" value="<?php echo $data['password']; ?>" placeholder="登录密码" class="form-control no-border">
            </div>
          </div>
          <button type="button" onclick="dr_ajax_submit('<?php echo dr_url('login/index'); ?>', 'myform', 2000, '<?php echo dr_url('home/index'); ?>')"  class="btn btn-lg btn-primary btn-block">登录平台</button>

        </form>
      </section>
    </div>
  </section>
  <!-- footer -->
  <footer id="footer">
    <div class="text-center padder">
      <p>
        <small>成都天睿信息技术有限公司<br>&copy; <?php echo date('Y'); ?></small>
      </p>
    </div>
  </footer>
  <!-- / footer -->
  <script src="static/js/jquery.min.js"></script>
  <script src="static/layer/layer.js"></script>
  <!-- Bootstrap -->
  <script src="static/js/bootstrap.js"></script>
  <!-- App -->
  <script src="static/js/app.js"></script>
    <script src="static/js/app.plugin.js"></script>

</body>
</html>