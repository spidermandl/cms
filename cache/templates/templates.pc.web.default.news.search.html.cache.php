<?php if ($fn_include = $this->_include("header.html", "/")) include($fn_include); ?>

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
                        <span>搜索：<?php echo $keyword; ?></span>
                    </li>
                </ul>

                <div class="page-content-inner">
                    <div class="search-page search-content-2">
                        <div class="search-bar ">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <input type="text" onkeypress="if(event.keyCode==13) {searchByClass();return false;}"name='keyword' value='<?php echo $keyword; ?>' id='dr_search_keyword'  class="form-control" placeholder="输入关键字搜索">
                                        <span class="input-group-btn">
                                            <button class="btn blue uppercase bold" onclick="searchByClass()" type="button">搜索</button>
                                        </span>
                                        <script type="text/javascript">
                                            function searchByClass(){
                                                var url="<?php echo dr_search_url($params, 'keyword', 'dayruicom'); ?>";
                                                var value=$("#dr_search_keyword").val();
                                                if (value) {
                                                    location.href=url.replace('dayruicom', value);
                                                } else {
                                                    dr_tips("输入关键字");
                                                }
                                            }
                                        </script>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="search-container ">
                                    <ul class="search-container">
                                        <?php if ($searchid) {  $return = $this->list_tag("action=search module=$dirname id=$searchid total=$sototal catid=$catid page=1 pagesize=10 urlrule=$urlrule"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                                        <li class="search-item clearfix">
                                            <div class="search-content text-left">
                                                <h4 class="search-title">
                                                    <a title="<?php echo $t['title']; ?>" href="<?php echo $t['url']; ?>"><?php echo dr_keyword_highlight($t['title'], $keyword); ?></a>
                                                </h4>
                                                <p class="search-desc"><?php echo dr_keyword_highlight($t['description'], $keyword); ?></p>
                                                <div class="search-post-foot">
                                                    <ul class="search-post-tags">
                                                        <?php $kw=@explode(',', $t['keywords']);  if (is_array($kw)) { $count=count($kw);foreach ($kw as $a) {  if ($a) { ?>
                                                        <li class="uppercase">
                                                            <a href="<?php echo dr_tag_url(APP_DIR, $a); ?>" target="_blank"><?php echo $a; ?></a>
                                                        </li>
                                                        <?php }  } } ?>
                                                    </ul>
                                                    <div class="search-post-meta">
                                                        <i class="icon-calendar font-blue"></i>
                                                        <a href="javascript:;"><?php echo $t['updatetime']; ?></a>
                                                    </div>
                                                    <div class="search-post-meta">
                                                        <i class="icon-fire font-blue"></i>
                                                        <a href="javascript:;"><?php echo $t['hits']; ?>次</a>
                                                    </div>
                                                    <div class="search-post-meta">
                                                        <i class="icon-bubble font-blue"></i>
                                                        <a href="javascript:;"><?php echo $t['comments']; ?></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <?php } }  if (!$total) { ?>
                                        <div class="alert alert-danger"><strong>对不起!</strong> 没有找到任何记录 </div>
                                        <?php }  } else { ?>
                                        <div class="alert alert-danger"><strong>对不起!</strong> 没有找到任何记录 </div>
                                        <?php } ?>
                                    </ul>
                                    <div class="search-pagination">
                                        <ul class="pagination">
                                            <?php echo $pages; ?>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>



<?php if ($fn_include = $this->_include("footer.html", "/")) include($fn_include); ?>