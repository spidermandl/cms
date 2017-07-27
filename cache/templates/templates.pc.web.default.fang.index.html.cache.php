<?php if ($fn_include = $this->_include("header.html", "/")) include($fn_include); ?>

<div class="page-container">
    <div class="page-content-wrapper">
        <?php if ($fn_include = $this->_include("header.html")) include($fn_include); ?>
        <div class="page-content">
            <div class="container">
                <div class="page-content-inner">

                    <div class="row">
                        <div class="col-md-5">
                            <div class="bg-white">
                                <link href="<?php echo HOME_THEME_PATH; ?>slide/slide.css" type="text/css" rel="stylesheet">
                                <div id="myslide" style="width: auto; height: auto; overflow: hidden">
                                    <table width="100%" cellSpacing="0" cellPadding="0">
                                        <tr>
                                            <td class="pic" id="bimg">
                                                <!--查询推荐位1的内容，field需要用到的字段（不填表示全部），按displayorder（后台指定排序）排序-->
                                                <?php $return = $this->list_tag("action=module flag=1 field=thumb,title,url order=displayorder,updatetime num=5"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                                                <div class="<?php if ($key==0) { ?>dis<?php } else { ?>undis<?php } ?>" name="f">
                                                    <a href="<?php echo $t['url']; ?>" title="<?php echo $t['title']; ?>" <?php if ($t['target']) { ?>target="_blank"<?php } ?>><img alt="<?php echo $t['title']; ?>" style="width: 100%; height: 345px;" src="<?php echo dr_thumb($t['thumb'], 450, 345); ?>" border="0"></a>
                                                </div>
                                                <?php } } ?>
                                                <table id="font_hd" width="100%" cellSpacing="0" cellPadding="0">
                                                    <tr>
                                                        <td class="title" id="info">
                                                            <!--查询推荐位1的内容，field需要用到的字段（不填表示全部），按displayorder（后台指定排序）排序-->
                                                            <?php $return = $this->list_tag("action=module flag=1 field=thumb,title,url order=displayorder,updatetime num=5"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                                                            <div class="<?php if ($key==0) { ?>dis<?php } else { ?>undis<?php } ?>" name="f">
                                                                <a href="<?php echo $t['url']; ?>" title="<?php echo $t['title']; ?>" <?php if ($t['target']) { ?>target="_blank"<?php } ?>><?php echo $t['title']; ?></a>
                                                            </div>
                                                            <?php } } ?>
                                                        </td>
                                                        <td id="simg" nowrap="nowrap" style="text-align:right">
                                                            <!--查询推荐位1的内容，field需要用到的字段（不填表示全部），按displayorder（后台指定排序）排序-->
                                                            <?php $return = $this->list_tag("action=module flag=1 field=thumb,title,url order=displayorder,updatetime num=5"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
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
                        <div class="col-md-7">
                            <div class="portlet light  ">
                                <div class="portlet-body ">
                                    <div class="row">
                                        <!--热门的-->
                                        <?php $return = $this->list_tag("action=module field=title,url,thumb order=hits num=6"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                                        <div class="col-sm-4">
                                            <div class="tile-container">
                                                <div class="tile-thumbnail">
                                                    <a href="javascript:;">
                                                        <a href="<?php echo $t['url']; ?>" ><img src="<?php echo dr_thumb($t['thumb'], 190, 120); ?>" width="190" height="120"></a>
                                                    </a>
                                                </div>
                                                <div class="tile-title">
                                                    <h5><a href="<?php echo $t['url']; ?>" class="title"><?php echo dr_strcut($t['title'], 22); ?></a></h5>
                                                </div>
                                            </div>
                                        </div>
                                        <?php } } ?>
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
                                        <!-- 最新数据 -->
                                        <?php $return = $this->list_tag("action=module catid=$c[id] order=updatetime num=8"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                                        <div class="col-sm-3">
                                            <div class="tile-container">
                                                <div class="tile-thumbnail">
                                                    <a href="javascript:;">
                                                        <a href="<?php echo $t['url']; ?>" ><img src="<?php echo dr_thumb($t['thumb'], 250, 200); ?>" width="250" height="200"></a>
                                                    </a>
                                                </div>
                                                <div class="tile-title">
                                                    <h5><a href="<?php echo $t['url']; ?>" class="title"><?php echo dr_strcut($t['title'], 28); ?></a></h5>
                                                </div>
                                            </div>
                                        </div>
                                        <?php } } ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php } }  echo $error; ?>


                </div>
            </div>
        </div>
    </div>
</div>



<?php if ($fn_include = $this->_include("footer.html", "/")) include($fn_include); ?>