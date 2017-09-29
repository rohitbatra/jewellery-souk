<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
    <?php } ?>
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <div class="row">
                <div class="col-sm-6">
                    <div class="well">
                        <h2><?php echo $text_new_customer; ?></h2>
                        <p><strong><?php echo $text_register; ?></strong></p>
                        <p><?php echo $text_register_account; ?></p>
                        <a href="<?php echo $register; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
                </div>
                <div class="col-sm-6">
                    <div class="well">
                        <h2><?php echo $text_returning_customer; ?></h2>
                        <p><strong><?php echo $text_i_am_returning_customer; ?></strong></p>
                        <p><?php echo $text_returning_account; ?></p>
                        <a href="<?php echo $login; ?>" class="btn btn-primary"><?php echo $button_login; ?></a>
                    </div>
                </div>
            </div>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>