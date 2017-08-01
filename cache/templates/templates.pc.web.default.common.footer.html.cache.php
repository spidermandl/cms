<!-- BEGIN FOOTER -->
<!-- BEGIN PRE-FOOTER -->
<div class="page-prefooter">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12 footer-block">
                <h2>POSCMS</h2>
                <p> 采用PHP5+MYSQL做为技术基础、以CI3.0框架为核心，提供“PC网站＋手机网站”一体化网站技术解决方案。</p>
            </div>
            <div class="col-md-3 col-sm-6 col-xs12 footer-block">
                <h2>全站搜索</h2>
                <div class="subscribe-form">
                    <form class="search-form" method="get" target="_blank" action="<?php echo SITE_URL; ?>index.php">
                        <input name="c" type="hidden" value="so">
                        <input name="module" type="hidden" value="<?php echo MOD_DIR; ?>">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="输入搜索关键字" name="keyword">
                            <span class="input-group-btn">
                                        <button class="btn" type="submit">搜索</button>
                                    </span>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12 footer-block">
                <h2>分享我们</h2>
                <div class="social-icons">
                    <div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a><a href="#" class="bds_copy" data-cmd="copy" title="分享到复制网址"></a><a href="#" class="bds_mail" data-cmd="mail" title="分享到邮件分享"></a></div>
                    <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12 footer-block">
                <h2>联系我们</h2>
                <address class="margin-bottom-40"> 电话: 028-62562781
                    <br> 邮箱:
                    <a href="mailto:q@dayrui.com">q@dayrui.com</a>
                </address>
            </div>
        </div>
    </div>
</div>
<!-- END PRE-FOOTER -->
<!-- BEGIN INNER FOOTER -->
<div class="page-footer">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <?php echo DR_NAME; ?> v<?php echo DR_VERSION; ?>

            </div>
            <?php if (IS_PC) { ?>
            <div class="col-md-9 text-right">
                <?php $return = $this->list_tag("action=navigator type=3"); if ($return) extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
                <a <?php if ($key>=$count-1) { ?>style="border:none"<?php } ?> href="<?php echo $t['url']; ?>" title="<?php echo $t['title']; ?>" <?php if ($t['target']) { ?>target="_blank"<?php } ?>><?php echo $t['name']; ?></a>
                <?php } } ?>
            </div>
            <?php } ?>
        </div>

    </div>
</div>
<div class="scroll-to-top">
    <i class="icon-arrow-up"></i>
</div>
<!-- END INNER FOOTER -->
<!-- END FOOTER -->
</body>

</html>