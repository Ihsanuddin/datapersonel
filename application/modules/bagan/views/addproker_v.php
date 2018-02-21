<script type="text/javascript">
    $(function(){
        $('#frm').submit(function(){

            $('#loading').show();
            $('html, body').animate({scrollTop : 0},800);
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
                        toastr_sukses('Sukses!', json.msg);

                        setTimeout(function() {
                            window.location = "<?php echo base_url('templateproker/addproker/') ?>"+json.templateID;

                            $('#loading').hide();
                        },1500);
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

    function ajax_delete(id,row){
        if(confirm('Yakin Hapus Data Ini!?')){
          $('#loading').show();
            $.ajax({
              url : "<?php echo site_url('templateproker/ajax_delete_proker_from_template')?>/"+id+"/"+row,
              type: "GET",
              dataType: "json",
              success: function(json)
              {
                //if success reload ajax table
                $('#loading').hide();
                if (json.st == 0) {
                    toastr_gagal('Gagal!', json.msg);
                } else {
                    toastr_sukses('Sukses!', json.msg);
                    var row = document.getElementById('rowsaved'+json.row);
                    row.parentNode.removeChild(row);
                    $('#loading').hide();
                }
              },
              error: function (jqXHR, textStatus, errorThrown)
              {
                  alert('Error adding / update data');
              }
           });
        }
      }
</script>

<!-- Main content -->
<section class="content">
    <div class="row">
      <div class="col-md-12">
        <a href="<?php echo base_url('templateproker'); ?>" class="btn btn-danger"><i class="fa fa-reply"></i> Kembali</a>
      </div>
        <div class="col-md-12">
            <div id="msg-container"></div>
        </div>
        <div class="col-md-12">
            <div class="box box-warning box-solid">
                <div class="box-header">
                    <h3 class="box-title"><?php echo $title ?></h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <form action="<?php echo base_url('templateproker/process_edit_template_proker'); ?>" id="frm" method="post">
                    <input type="hidden" name="validation">
                    <input type="hidden" name="templateID" value="<?php echo $templateID; ?>">
                   <div class="form-group">
                      <table class="table table-bordered" id="dynamic_field">
                          <tr>
                              <th width="85%" class="thstyle" style="vertical-align:middle;">Nama Proker</th>
                              <th width="10%" class="thstyle" style="vertical-align:middle;">Urutan</th>
                              <th width="5%" class="thstyle" style="vertical-align:middle;">Aksi</th>
                          </tr>
                          <?php if (!empty($get_proker)):?>
                            <?php $i=0; ?>
                          <?php foreach ($get_proker->result() as $key => $val): ?>
                              <tr id="rowsaved<?php echo $i; ?>">
                                  <td>
                                    <input type="hidden" name="prokerID[<?php echo $i; ?>]" value="<?php echo $val->prokerID; ?>">
                                    <?php echo $val->prokerName; ?>
                                    <!-- <select id="prokerID<?php echo $i; ?>" name="prokerID[<?php echo $i; ?>]" class="form-control select2">
                                      <option value=""> -- PILIH PROKER --</option>
                                      <?php foreach ($getAll_proker as $key2 => $val2): ?>
                                      <option value="<?php echo $val2->prokerID; ?>"><?php echo "$val2->prokerName"; ?></option>
                                      <?php endforeach ?>
                                    </select> -->
                                  </td>
                                  <td>
                                    <input type="text" class="form-control" name="order[<?php echo $i; ?>]" value="<?php echo $val->templateOrder; ?>"/>
                                  </td>
                                  <td>
                                    <button type="button" onclick="ajax_delete(<?php echo $val->prokerID.','.$i; ?>)" class="btn btn-xs btn-danger" title="hapus"><i class="glyphicon glyphicon-trash"></i></button>
                                  </td>
                              </tr>
                          <?php $i++; ?>
                          <?php endforeach ?>
                          <?php endif ?>
                      </table>
                      
                      <table class="table">
                          <tr>
                              <td align="right"><button type="button" name="add" id="add" class="btn btn-success pull-right">Tambah</button></td>
                          </tr>
                      </table>
                      
                    </div>
                    <div>
                        <button class="btn btn-primary pull-right"><i class="fa fa-save"></i> Simpan</button>
                    </div>
                  </form>
                </div><!-- /.box-body -->
                <div id="loading" style="display:none" class="overlay">
                    <i class="fa fa-refresh fa-spin"></i>
                </div>
            </div><!-- /.box -->
        </div>
    </div>
</section><!-- /.content -->
<?php //dump($getAll_proker) ?>

<script>

  $(document).ready(function(){
    <?php //if (!empty($get_proker)):?>
      <?php //$p=0; ?>
      <?php //foreach ($get_proker->result() as $key => $value):?>
        // $('#prokerID'+<?php //echo $p; ?>).val("<?php //echo $value->prokerID; ?>").trigger("change");
      <?php //$p++; ?>
      <?php //endforeach ?>
    <?php //endif ?>


    var i=<?php echo $get_proker->num_rows(); ?>;
    $('#add').click(function(){
        i++;
        $('#dynamic_field').append('<tr id="row'+i+'"><td><select id="prokerID'+i+'" name="prokerID['+i+']" class="form-control select2'+i+'"><option value=""> -- PILIH PROKER --</option><?php foreach ($get_unselectproker->result() as $key2 => $val2): ?><option value="<?php echo $val2->prokerID; ?>"><?php echo '['.$val2->prokerID.']'.preg_replace('/[^A-Za-z0-9\  ]/', '', $val2->prokerName); ?></option><?php endforeach ?></select></td><td><input type="text" class="form-control" name="order['+i+']"/></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove">X</button></td></tr>');

        $(".select2"+i).select2();
    });

    $(document).on('click', '.btn_remove', function(){
        var button_id = $(this).attr("id");
        $('#row'+button_id+'').remove();
    });

  });
  $('#modal_form').on('hidden.bs.modal', function () {
    //location.reload();
    $('#msg-container').html('');

  });
</script>