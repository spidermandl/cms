<?php if ($fn_include = $this->_include("header.html", "/")) include($fn_include); ?>

<div class="page-container">
    <div class="page-content-wrapper">
        <?php if ($fn_include = $this->_include("header.html")) include($fn_include); ?>
        <div class="page-content">
            <div class="container">
                <div class="page-content-inner">

                    <div class="row">
                        <div class="col-md-4">
                            <div class="bg-white">
                                <link href="<?php echo HOME_THEME_PATH; ?>slide/slide.css" type="text/css" rel="stylesheet">
                                <div id="myslide" style="width: auto; height: auto; overflow: hidden">
                                    <table width="100%" cellSpacing="0" cellPadding="0">
                                        <tr>
                                            <td class="pic" id="bimg">
                                                <!--查询推荐位2（首页幻灯）的内容，field需要用到的字段（不填表示全部），按displayorder（后台指定排序）排序-->
                                                <?php $return = $this->list_tag("action=module flag=2 field=thumb,title,url order=displayorder,updatetime num=5"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                                                <div class="<?php if ($key==0) { ?>dis<?php } else { ?>undis<?php } ?>" name="f">
                                                    <a href="<?php echo $t['url']; ?>" title="<?php echo $t['title']; ?>" <?php if ($t['target']) { ?>target="_blank"<?php } ?>><img alt="<?php echo $t['title']; ?>" style="width: 100%; height: 274px;" src="<?php echo dr_thumb($t['thumb'], 350, 270); ?>" border="0"></a>
                                                </div>
                                                <?php } } ?>
                                                <table id="font_hd" width="100%" cellSpacing="0" cellPadding="0">
                                                    <tr>
                                                        <td class="title" id="info">
                                                            <!--查询推荐位2（首页幻灯）的内容，field需要用到的字段（不填表示全部），按displayorder（后台指定排序）排序-->
                                                            <?php $return = $this->list_tag("action=module flag=2 field=thumb,title,url order=displayorder,updatetime num=5"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                                                            <div class="<?php if ($key==0) { ?>dis<?php } else { ?>undis<?php } ?>" name="f">
                                                                <a href="<?php echo $t['url']; ?>" title="<?php echo $t['title']; ?>" <?php if ($t['target']) { ?>target="_blank"<?php } ?>><?php echo $t['title']; ?></a>
                                                            </div>
                                                            <?php } } ?>
                                                        </td>
                                                        <td id="simg" nowrap="nowrap" style="text-align:right">
                                                            <!--查询推荐位2（首页幻灯）的内容，field需要用到的字段（不填表示全部），按displayorder（后台指定排序）排序-->
                                                            <?php $return = $this->list_tag("action=module flag=2 field=thumb,title,url order=displayorder,updatetime num=5"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                                                            <div class="<?php if ($key==0) {  } else { ?>f1<?php } ?>" onclick=play(x[<?php echo $key; ?>],<?php echo $key; ?>) name="f"><?php echo $key+1; ?></div>
                                                            <?php } } ?>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <script src="<?php echo HOME_THEME_PATH; ?>slide/slide.js"></script>
                                            </td>
                                        </tr>
                                    </table>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="portlet light  ">
                                <div class="portlet-body ">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <ul class="list-unstyled">
                                                <!--调用新闻模块的“首页中间”属性的最新10条-->
                                                <?php $return = $this->list_tag("action=module flag=1 order=updatetime num=10"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                                                <li style="line-height: 23px"><span class="badge badge-empty badge-success"></span>&nbsp;<a href="<?php echo $t['url']; ?>" class="title"><?php echo dr_strcut($t['title'], 40); ?></a></li>
                                                <?php } } ?>
                                            </ul>
                                        </div>
                                        <div class="col-md-6">
                                            <ul class="list-unstyled">
                                                <!--调用新闻模块最新10条-->
                                                <?php $return = $this->list_tag("action=module order=updatetime num=10"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                                                <li style="line-height: 23px"><span class="badge badge-empty badge-success"></span>&nbsp;<a href="<?php echo $t['url']; ?>" class="title"><?php echo dr_strcut($t['title'], 40); ?></a></li>
                                                <?php } } ?>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="portlet light" style="height: 90px; text-align: center;">
                                <h2>POSCMS全能网站管理系统</h2>
                            </div>
                        </div>
                    </div>

                    <!--循环输出顶级栏目下面的子栏目及其内容，运用到了双list循环标签因此需要定义返回值return=c（都懂得）-->
                    <?php $return_c = $this->list_tag("action=category pid=0 num=5  return=c"); if ($return_c) extract($return_c); $count_c=count($return_c); if (is_array($return_c)) { foreach ($return_c as $key_c=>$c) { ?>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="portlet light">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <span class="caption-subject bold uppercase"><a class=" font-green" href="<?php echo $c['url']; ?>"><?php echo $c['name']; ?></a></span>
                                    </div>
                                    <ul class="nav nav-tabs">
                                        <!-- 调用其子栏目 -->
                                        <?php $return = $this->list_tag("action=category pid=$c[id]"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                                        <li><a href="<?php echo $t['url']; ?>"><?php echo $t['name']; ?></a></li>
                                        <?php } } ?>
                                    </ul>
                                </div>
                                <div class="portlet-body">
                                    <div class="row">
                                        <div class="col-lg-7">
                                            <div class="row">
                                                <div class="col-md-12 media">
                                                    <!-- 调用模块的属性的第一条 -->
                                                    <?php $return = $this->list_tag("action=module catid=$c[id] flag=1 order=updatetime num=1"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                                                    <a class="pull-left" href="javascript:;">
                                                        <img class="media-object" src="<?php echo dr_thumb($t['thumb'], 80, 80); ?>" style="width:80px; height:80px;"> </a>
                                                    <div class="media-body">
                                                        <h5 class="media-heading"><a href="<?php echo $t['url']; ?>" class="title"><?php echo $t['title']; ?></a></h5>
                                                        <p> <?php echo dr_strcut($t['description'],120); ?></p>
                                                    </div>
                                                    <?php } } ?>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-top: 10px">
                                                <div class="col-md-6">
                                                    <ul class="list-unstyled">
                                                        <!-- 调用模块最新的数据 -->
                                                        <?php $return = $this->list_tag("action=module catid=$c[id] order=updatetime num=10"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                                                        <li style="line-height: 23px"><span class="badge badge-empty badge-success"></span>&nbsp;<a href="<?php echo $t['url']; ?>" class="title"><?php echo dr_strcut($t['title'], 35); ?></a></li>
                                                        <?php } } ?>
                                                    </ul>
                                                </div>
                                                <div class="col-md-6">
                                                    <ul class="list-unstyled">
                                                        <!-- 调用模块最新的数据 -->
                                                        <?php $return = $this->list_tag("action=module catid=$c[id] order=updatetime num=10,10"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                                                        <li style="line-height: 23px"><span class="badge badge-empty badge-success"></span>&nbsp;<a href="<?php echo $t['url']; ?>" class="title"><?php echo dr_strcut($t['title'], 35); ?></a></li>
                                                        <?php } } ?>
                                                    </ul>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-lg-5">
                                            <div class="row">
                                                <!-- 调用模块带“图片”的数据 -->
                                                <?php $return = $this->list_tag("action=module thumb=1 catid=$c[id] order=updatetime num=9"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                                                <div class="col-sm-4">
                                                    <div class="tile-container">
                                                        <div class="tile-thumbnail">
                                                            <a href="javascript:;">
                                                                <a href="<?php echo $t['url']; ?>" ><img src="<?php echo dr_thumb($t['thumb'], 120, 75); ?>" width="120" height="75"></a>
                                                            </a>
                                                        </div>
                                                        <div class="tile-title">
                                                            <h5><a href="<?php echo $t['url']; ?>" class="title"><?php echo dr_strcut($t['title'], 15); ?></a></h5>
                                                        </div>
                                                    </div>
                                                </div>
                                                <?php } } ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php } } ?>


                </div>
            </div>
        </div>
    </div>
</div>



<?php if ($fn_include = $this->_include("footer.html")) include($fn_include); ?>