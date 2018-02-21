<script type="text/javascript">
$(document).ready(function(){
  $("#containerLoad").load("<?php echo base_url('opbmp/load_add'); ?>", function(response, status, xhr) {
    // body...
    if(status == "success")
      $('#loading').hide();
    if(status == "error")
      sweetAlert("Oops...", "Terjadi kesalahan!", "error");
      // alert("Error: " + xhr.status + ": " + xhr.statusText);
  });

  $("#buttonAddBB").click(function(){
    $('#loading').show();
    $("#containerLoad").load("<?php echo base_url('opbmp/load_add'); ?>", function(response, status, xhr) {
      // body...
      if(status == "success")
        $('#loading').hide();
      if(status == "error")
        sweetAlert("Oops...", "Terjadi kesalahan!", "error");
    });
  });

  $("#buttonAddBBTL").click(function(){
    $('#loading').show();
    $("#containerLoad").load("<?php echo base_url('opbmobbtl/load_add'); ?>", function(response, status, xhr) {
      // body...
      if(status == "success")
        $('#loading').hide();
      if(status == "error")
        sweetAlert("Oops...", "Terjadi kesalahan!", "error");
    });
  });

  $("#buttonAddBBOPS").click(function(){
    $('#loading').show();
    $("#containerLoad").load("<?php echo base_url('opbmobbops/load_add'); ?>", function(response, status, xhr) {
      // body...
      if(status == "success")
        $('#loading').hide();
      if(status == "error")
        sweetAlert("Oops...", "Terjadi kesalahan!", "error");
    });
  });

  $("#buttonDaftarTerpilihBB").click(function(){
    $('#loading').show();
    $("#containerLoad").load("<?php echo base_url('opbmp/load_terpilih'); ?>", function(response, status, xhr) {
      // body...
      if(status == "success")
        $('#loading').hide();
      if(status == "error")
        sweetAlert("Oops...", "Terjadi kesalahan!", "error");
    });
  });

  $("#buttonDaftarTerpilihBBTL").click(function(){
    $('#loading').show();
    $("#containerLoad").load("<?php echo base_url('opbmobbtl/load_terpilih'); ?>", function(response, status, xhr) {
      // body...
      if(status == "success")
        $('#loading').hide();
      if(status == "error")
        sweetAlert("Oops...", "Terjadi kesalahan!", "error");
    });
  });

  $("#buttonDaftarTerpilihBBOPS").click(function(){
    $('#loading').show();
    $("#containerLoad").load("<?php echo base_url('opbmobbops/load_terpilih'); ?>", function(response, status, xhr) {
      // body...
      if(status == "success")
        $('#loading').hide();
      if(status == "error")
        sweetAlert("Oops...", "Terjadi kesalahan!", "error");
    });
  });

});

function add_waktuform()
{
  save_method = 'add';
  $('#form-ud')[0].reset(); // reset form on modals
  $('#modal_ud').modal('show'); // show bootstrap modal
  $('.modal-title').text('Ubah'); // Set Title to Bootstrap modal title
}

function save_ud()
{
  var url;
  if(save_method == 'add')
  {
    url = "<?php echo site_url('fd/process_cd')?>";
  }

  $('#modal_ud').modal('hide');

  $('#loading').show();

  // ajax adding data to database
  $.ajax({
      url : url,
      type: "POST",
      data: $('#form-ud').serialize(),
      dataType: "JSON",
      success: function(json)
      {
        //if success close modal and reload ajax table
        //$('#modal_ud').modal('hide');
        if (json.st === 0) {
            $('#msg-container-ud').html(json.msg);
            $('#modal_ud').modal('show');

            $('#loading').hide();
        } else {
            $('#msg-container-ud').html('');
            //$('#modal_ud').modal('hide');

            $('#loading').hide();

            toastr_sukses('Sukses!', json.msg);

            $('#loading').show();
            $("#containerLoad").load("<?php echo base_url('opbmp/load_add'); ?>", function(response, status, xhr) {
              // body...
              if(status == "success")
                $('#loading').hide();
              if(status == "error")
                sweetAlert("Oops...", "Terjadi kesalahan!", "error");
            });
        }
      },
      error: function (jqXHR, textStatus, errorThrown)
      {
          alert('Error adding / update data');
      }
  });
}

function add_supplier(){
  save_method = 'add';
  $('#form')[0].reset(); // reset form on modals
  $('#modal_form_supplier').modal('show'); // show bootstrap modal
  $('.modal-title').text('Tambah Supplier'); // Set Title to Bootstrap modal title
  $sel.val('').trigger("change");
}

function save_supplier(){
  var url;
  if(save_method == 'add')
  {
    url = "<?php echo site_url('suppliers/ajax_add')?>";
  }
  else
  {
    url = "<?php echo site_url('suppliers/ajax_update')?>";
  }

  $('#modal_form_supplier').modal('hide');
  $('#loading').show();
  setTimeout(function() {
   // ajax adding data to database
    $.ajax({
        url : url,
        type: "POST",
        data: $('#form').serialize(),
        dataType: "JSON",
        success: function(json)
        {
          //if success close modal and reload ajax table
          //$('#modal_form_supplier').modal('hide');
          if (json.st === 0) {
              $('#msg-container-modal').html(json.msg);
              $('#modal_form_supplier').modal('show');
              $('#loading').hide();
          } else {
              $('#msg-container-modal').html('');
              $("#containerLoad").load("<?php echo base_url('opbmp/load_add'); ?>", function(response, status, xhr) {
                // body...
                if(status == "success")
                  $('#loading').hide();
                if(status == "error")
                  sweetAlert("Oops...", "Terjadi kesalahan!", "error");
              });
          }
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error adding / update data');
        }
    });

  },1500);
}

</script>

<!-- Menampung Add LTTB-BH -->
<section class="content">
    <button id="buttonAddBB" class="btn btn-primary">Input BB <i class="fa fa-plus"></i></button>
    <button id="buttonAddBBTL" class="btn btn-primary">Input BBTL <i class="fa fa-plus"></i></button>
    <button id="buttonAddBBOPS" class="btn btn-primary">Input BBOPS <i class="fa fa-plus"></i></button>

    <div class="btn-group">
      <button type="button" class="btn btn-success">Lihat Terpilih</button>
      <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
        <span class="caret"></span>
        <span class="sr-only">Toggle Dropdown</span>
      </button>
      <ul class="dropdown-menu" role="menu">
        <li><a href="#"><button type="button" id="buttonDaftarTerpilihBB" class="btn btn-default">Daftar BB Terpilih</button></a></li>
        <li><a href="#"><button type="button" id="buttonDaftarTerpilihBBTL" class="btn btn-default">Daftar BBTL Terpilih</button></a></li>
        <li><a href="#"><button type="button" id="buttonDaftarTerpilihBBOPS" class="btn btn-default">Daftar BBOPS Terpilih</button></a></li>
      </ul>
    </div>

    <button class="btn btn-warning" onclick="add_supplier()"><i class="glyphicon glyphicon-plus"></i>  Supplier</button>

    <button type="button" class="btn btn-primary" onclick="add_waktuform()"><i class="fa fa-calendar" aria-hidden="true"></i></button>

    <p></p>
    <div id="msg-container"></div>
    <div id="containerLoad">
      <?php echo Modules::run('opbmp/load_add'); ?>
    </div>
</section>

<!-- Bootstrap modal -->
<div class="modal fade" id="modal_ud" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title">Waktu Form</h3>
      </div>
      <div class="modal-body">
          <div id="msg-container-ud"></div>

          <form action="#" id="form-ud" class="form-horizontal">
          <input type="hidden" name="form" value="opbm"/>
          <input type="hidden" name="outlet" value="<?php echo $user->outletID; ?>"/>
          <div class="form-body">
            <div class="form-group">
              <label class="control-label col-md-3">Tanggal</label>
              <div class="col-md-9">
                <input class="form-control default_datetimepicker" name="tanggal" type="text" onfocus="blur();">
              </div>
            </div>
          </div>
        </form>
      </div>

      <div class="modal-footer">
        <button type="button" id="btnSave" onclick="save_ud()" class="btn btn-primary">Simpan</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Batal</button>
      </div>
    </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- End Bootstrap modal -->

<!-- Bootstrap modal -->
<div class="modal fade" id="modal_form_supplier" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title">Supplier Form</h3>
      </div>
      <div class="modal-body form">
          <div id="msg-container-modal"></div>

          <form action="#" id="form" class="form-horizontal">
          <input type="hidden" value="" name="id"/>
          <div class="form-body">
            <div class="form-group">
              <label class="control-label col-md-3">Nama Supplier</label>
              <div class="col-md-9">
                <input name="supplierName" class="form-control" type="text">
              </div>
            </div>
          </div>
          <div class="form-body">
            <div class="form-group">
              <label class="control-label col-md-3">Nama Toko</label>
              <div class="col-md-9">
                <input name="supplierOutlet" class="form-control" type="text">
              </div>
            </div>
          </div>
          <div class="form-body">
            <div class="form-group">
              <label class="control-label col-md-3">Alamat Supplier</label>
              <div class="col-md-9">
                <input name="supplierAddreess" class="form-control" type="text">
              </div>
            </div>
          </div>
          <div class="form-body">
            <div class="form-group">
              <label class="control-label col-md-3">No Telepon</label>
              <div class="col-md-9">
                <input name="supplierHP" class="form-control" type="text">
              </div>
            </div>
          </div>
          <div class="form-body">
            <div class="form-group">
              <label class="control-label col-md-3">Tanggal Mulai</label>
              <div class="col-md-9">
                <input name="startDate" class="form-control default_datetimepicker" type="text" onfocus="blur();">
              </div>
            </div>
          </div>
          <div class="form-body">
            <div class="form-group">
              <label class="control-label col-md-3">Tanggal Berakhir</label>
              <div class="col-md-9">
                <input name="endDate" class="form-control default_datetimepicker" type="text" onfocus="blur();">
              </div>
            </div>
          </div>
          <div class="form-body">
            <div class="form-group">
              <label class="control-label col-md-3">Status</label>
              <div class="col-md-9">
                <select name="supplierStatus" class="form-control" style="width: 100%;">
                  <option value="">-- Pilih Status --</option>
                  <option value="Tetap">Tetap</option>
                  <option value="Tidak Tetap">Tidak Tetap</option>
                  <option value="Blacklist">Blacklist</option>
                  <option value="Tidak Aktif">Tidak Aktif</option>
                </select>
              </div>
            </div>
          </div>
          <div class="form-body">
            <div class="form-group">
              <label class="control-label col-md-3">Keterangan</label>
              <div class="col-md-9">
                <input name="supplierNote" class="form-control" type="text">
              </div>
            </div>
          </div>
        </form>
      </div>

      <div class="modal-footer">
        <button type="button" id="btnSave" onclick="save_supplier()" class="btn btn-primary">Save</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
      </div>
    </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- End Bootstrap modal -->

<script type="text/javascript">
  $('#modal_ud').on('hidden.bs.modal', function () {
    //location.reload();
    $('#msg-container-ud').html('');
  });

  $('.default_datetimepicker').datetimepicker({
    timepicker:false,
    format:'Y-m-d',
    formatDate:'Y-m-d'
  });
</script>
