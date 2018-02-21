<!-- Main content -->
<section class="content">
    <a href="<?php echo base_url('form'); ?>" class="btn btn-danger"><i class="fa fa-reply"></i> Kembali</a>
    <p></p>
    <div class="row">        
        <div class="col-xs-12">          
            <div class="box box-cos-ecstasy box-solid">
                <div class="box-header">
                    <h3 class="box-title"><?php echo $title; ?></h3>
                </div><!-- /.box-header -->
                <div class="box-body">

                    <div class="pop-row">
                      <?php foreach ($listmenu as $menuKey => $menuVal): ?>
                        <div class="col-xs-6 col-sm-6 col-md-3 pd-rl">
                          <a href="<?php echo base_url().$menuVal['link']; ?>"">
                            <div class="halutbtn">
                              <i class="<?php echo $menuVal['icon']; ?>"></i>
                              <div class="subhalutbtn"><?php echo $menuKey; ?></div>
                            </div>
                          </a>
                        </div>
                      <?php endforeach ?>

                      <div class="sambungfloat"></div>
                    </div>
                    
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>

</section><!-- /.content -->