<?php if ($fn_include = $this->_include("header.html")) include($fn_include); ?>



<div class="row" style="margin-top: 150px">
    <div class="col-lg-3">&nbsp;</div>
    <div class="col-lg-6">
        <section class="panel panel-default">
            <div class="panel-body"><h3><i class="fa <?php if ($code) { ?>fa-check-circle<?php } else { ?>fa-times-circle<?php } ?>"></i> <?php echo $msg; ?></h3></div>
        </section>
    </div>
</div>

<?php if ($fn_include = $this->_include("footer.html")) include($fn_include); ?>