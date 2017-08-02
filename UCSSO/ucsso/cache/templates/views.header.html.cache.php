<!DOCTYPE html>
<html lang="en" class="app-fluid">
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
<body class="" >
<section class="vbox">
    <header class="bg-white-only navbar-fixed-top header header-md navbar navbar-fixed-top-xs box-shadow">
        <div class="navbar-header bg-primary aside-md">
            <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen,open" data-target="#nav,html">
                <i class="fa fa-bars"></i>
            </a>
            <a href="index.php" class="navbar-brand">
                <img src="static/images/logo_white.png" class="m-r-sm" alt="scale">
                <span class="hidden-nav-xs">UCSSO</span>
            </a>
            <a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".user">
                <i class="fa fa-cog"></i>
            </a>
        </div>
        <ul class="nav navbar-nav navbar-right m-n hidden-xs nav-user user">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <?php echo $admin['username']; ?> <b class="caret"></b>
                </a>
                <ul class="dropdown-menu animated fadeInRight">
                    <li>
                        <a href="<?php echo dr_url('logout/index'); ?>" data-toggle="ajaxModal">退出平台</a>
                    </li>
                </ul>
            </li>
        </ul>
    </header>
    <section>
        <section class="hbox stretch">
            <!-- .aside -->
            <aside class="bg-black aside-md hidden-print hidden-xs" id="nav">
                <section class="vbox">
                    <section class="w-f scrollable">
                        <div class=" " data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="10px" data-railOpacity="0.2">



                            <!-- nav -->
                            <nav class="nav-primary hidden-xs" style="margin-top: 50px">
                                <ul class="nav nav-main" data-ride="collapse">
                                    <?php if (is_array($menu)) { $count=count($menu);foreach ($menu as $mid=>$t) { ?>
                                    <li class="<?php if ($mid==$myclass) { ?>active<?php } ?>">
                                        <a href="<?php echo dr_url($mid.'/index'); ?>" class="auto">
                                            <i class="<?php echo $t[1]; ?> icon">
                                            </i>
                                            <span class="font-bold"><?php echo $t[0]; ?></span>
                                        </a>
                                    </li>
                                    <?php } } ?>
                                </ul>
                            </nav>
                            <!-- / nav -->
                        </div>
                    </section>


                </section>
            </aside>
            <!-- /.aside -->
            <section id="content">