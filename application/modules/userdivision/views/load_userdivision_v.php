<script type="text/javascript">
$(function(){
    $('#frm').submit(function(){

        $('#loading').show();

        $('html, body').animate({scrollTop : 450},800);
          $.ajax({
              type:'POST',
              url:$('#frm').attr('action'),
              data:$('#frm').serialize(),
              timeout: 10000,
              dataType: 'json',
              success: function(json){
                if (json.st === 0) {
                    $('#msg-container').html("<div class='alert alert-danger alert-dismissible bts-bwh' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><center>"+json.msg+"</center></div>");
                    $('#loading').hide();
                
                } else {
                  $('#msg-container').html("");
                    toastr_sukses('Sukses!', json.msg);
                    $('#loading').hide();
                }
              },
              error: function(){
                toastr_pringatan('Masalah Jaringan!', 'Pastikan jaringan normal dan coba lagi.');
                $('#loading').hide();
            
              },
           });
        return false;
    });
});
</script>        
<div class="col-md-12">
    <div id="msg-container"></div>
</div>

<div class="col-md-12">
    <div class="box box-primary box-solid">
        <div class="box-header with-border">
            <h3 class="box-title">Pengaturan akses user: <?php echo $detail_user->username; ?></h3>
        </div><!-- /.box-header -->
        <div class="box-body">
            <form action="<?php echo base_url('userdivision/process_edit'); ?>" id="frm" method="post">
            <input type="hidden" name="validation">
            <input type="hidden" name="validation2">
            <input type="hidden" name="userid" value="<?php echo $detail_user->id; ?>">
        <div class="col-md-6">
            <div class="form-group">
              <label>Area Kerja</label>
                <div class="menu-tree slimScroll">
                  <ul>
                    <li>
                      <input id="cek-all-area" type="checkbox" name="cek-all-area" class="icheckbox_flat-red" />
                      <label for="cek-all-area"><strong style="font-size: 18px;"> Pilih Semua Area</strong></label>
                  	<?php foreach ($get_area as $key => $val): ?>
                  <ul>
                    <li>
                        <input id="area<?php echo $val->areaID; ?>" class="area" name="area[<?php echo $val->areaID; ?>]" type="checkbox" value="<?php echo $val->areaID; ?>" />
                        <label for="area<?php echo $val->areaID;; ?>"><?php echo $val->areaName; ?></label>
                    </li>
                  </ul>
              		<?php endforeach ?>
                    </li>
                  </ul>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
              <label>Bagian</label>
                <div class="menu-tree slimScroll">
                  <ul>
                    <li>
                      <input id="cek-all-divisi" type="checkbox" name="cek-all-divisi" class="icheckbox_flat-red" />
                      <label for="cek-all-divisi"><strong style="font-size: 18px;"> Pilih Semua Bagian</strong></label>
                  	<?php foreach ($get_divisi as $key2 => $val2): ?>
                  <ul>
                    <li>
                        <input id="divisi<?php echo $val2->divisionID; ?>" class="divisi" name="divisi[<?php echo $val2->divisionID; ?>]" type="checkbox" value="<?php echo $val2->divisionID; ?>" />
                        <label for="divisi<?php echo $val2->divisionID;; ?>"><?php echo $val2->divisionName; ?></label>
                    </li>
                  </ul>
              		<?php endforeach ?>
                    </li>
                  </ul>
                </div>
            </div>
        </div>
            <button type="submit" class="btn btn-primary pull-right"><i class="fa fa-save"></i> Simpan</button>
          </form>
        </div><!-- /.box-body -->
        <div id="loading" style="display:none" class="overlay loading">
            <i class="fa fa-refresh fa-spin"></i>
        </div>
    </div><!-- /.box -->
</div>
<script>
  $(document).ready(function(){
    $('input').iCheck({
      checkboxClass: 'icheckbox_flat-green',
    });

    // Cheked All area
    $('#cek-all-area').on('ifChecked', function(event){
        $('.area').iCheck('check');
        triggeredByChild = false;
    });

    $('#cek-all-area').on('ifUnchecked', function (event) {
        if (!triggeredByChild) {
            $('.area').iCheck('uncheck');
        }
        triggeredByChild = false;
    });

    // Cheked All divisi
    $('#cek-all-divisi').on('ifChecked', function(event){
        $('.divisi').iCheck('check');
        triggeredByChild = false;
    });

    $('#cek-all-divisi').on('ifUnchecked', function (event) {
        if (!triggeredByChild) {
            $('.divisi').iCheck('uncheck');
        }
        triggeredByChild = false;
    });


    // Chcked Selected area
    <?php if(!empty($selected_area)): ?>
      <?php foreach ($selected_area as $key => $value): ?>
          $("#area<?php echo $value->areaID; ?>").iCheck('check');
          triggeredByChild = false;
      <?php endforeach ?>
    <?php endif ?>

    // Chcked Selected divisi
    <?php if(!empty($selected_divisi)): ?>
      <?php foreach ($selected_divisi as $key => $value): ?>
          $("#divisi<?php echo $value->divisionID; ?>").iCheck('check');
          triggeredByChild = false;
      <?php endforeach ?>
    <?php endif ?>

    $('.slimScroll').slimScroll({
      color: '#F45D79',
      size: '10px',
      height: '400px',
      alwaysVisible: true
    });
  });
</script>
