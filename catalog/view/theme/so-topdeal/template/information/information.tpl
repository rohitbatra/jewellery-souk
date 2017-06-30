<?php echo $header; ?>
<div class="breadcrumbs">
  <div class="container">
      <div class="title-breadcrumb">
        <?php $count = count($breadcrumbs);?>
        <?php $i=0; ?>
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php if( $i == $count-1){ ?>
               <?php echo '<b>'.$breadcrumb['text'].'</b>'; ?>
            <?php }else{ ?>
              <a href="<?php echo $breadcrumb['href']; ?>"></a>
            <?php } ?>      
          <?php $i++; ?> 
        <?php } ?>
      </div>
      <ul class="breadcrumb-cate">
          <?php foreach ($breadcrumbs as $breadcrumb) { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
          <?php } ?>
      </ul>
  </div>
</div>
<div class="container">
  <div class="<?php echo ($column_left || $column_right ? 'row' : ''); ?>">
      <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = ''; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
		
        <div class="<?php echo ($column_left || $column_right ? '' : 'container'); ?>">
			
			<?php echo $content_top; ?>
			<?php echo $description; ?>
        </div>
        <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>
<?php echo $footer; ?>
