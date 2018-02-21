<script type="text/javascript">
    $(document).ready(function() {
      $("#refreshPreview").click(function(){
        $('#loadingPreview').show();
        $("#loadPreview").load("<?php echo base_url('templateproker/load_daftarproker'); ?>", function(response, status, xhr) {
          // body...
          if(status == "success")
            $('#loadingPreview').hide();
          if(status == "error")
            sweetAlert("Oops...", "Terjadi kesalahan!", "error");
        });
      });
    });
</script>

<!-- Main content -->
<section class="content">
    <div class="row">
      <div class="col-md-12">
          <div class="box box-solid box-primary">
              <div class="box-header">
                  <h3 class="box-title"><?php echo $title; ?></h3>
                  <div class="box-tools pull-right">
                    <a title="Word" class="btn btn-box-tool tool-success" href="<?php echo base_url('templateproker/word_template'); ?>" target="_blank"><i class="fa fa-file-word-o"></i> List Proker</a>
                    <a title="PDF" class="btn btn-box-tool tool-danger" href="<?php echo base_url('templateproker/pdf_proker'); ?>" target="_blank"><i class="fa fa-file-pdf-o"></i> Proker</a>
                    <button id="refreshPreview" class="btn btn-box-tool"><i class="fa fa-refresh"></i></button>

                  </div>
              </div><!-- /.box-header -->
              <div class="box-body row-horizon">

              <div id="loadPreview">
                <!-- Loading data... <i class="fa fa-refresh fa-spin"></i> -->
                <?php echo Modules::run('templateproker/load_daftarproker'); ?>
              </div>

              </div><!-- /.box-body -->
              <div id="loadingPreview" style="display:none" class="overlay">
                  <i class="fa fa-refresh fa-spin"></i>
              </div>
          </div><!-- /.box -->
      </div>
    </div>
</section><!-- /.content -->
