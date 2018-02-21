<script type="text/javascript">
$(document).ready(function(){
$("#containerLoad").load("<?php echo base_url('sobbgp/add'); ?>", function(response, status, xhr) {
  // body...
  if(status == "success")
    $('#loadingAdd').hide();
    $('#loadingTerpilih').hide();
  if(status == "error")
    sweetAlert("Oops...", "Terjadi kesalahan!", "error");
    // alert("Error: " + xhr.status + ": " + xhr.statusText);
});

$("#buttonAddBB").click(function(){
  $('#loadingAdd').show();
  $('#loadingTerpilih').show();
  $("#containerLoad").load("<?php echo base_url('sobbgp/add'); ?>", function(response, status, xhr) {
    // body...
    if(status == "success")
      $('#loadingAdd').hide();
      $('#loadingTerpilih').hide();
    if(status == "error")
      sweetAlert("Oops...", "Terjadi kesalahan!", "error");
  });
});

$("#buttonAddBBTL").click(function(){
  $('#loadingAdd').show();
  $('#loadingTerpilih').show();
  $("#containerLoad").load("<?php echo base_url('sobbbbtl/add'); ?>", function(response, status, xhr) {
    // body...
    if(status == "success")
      $('#loadingAdd').hide();
      $('#loadingTerpilih').hide();
    if(status == "error")
      sweetAlert("Oops...", "Terjadi kesalahan!", "error");
  });
});

$("#buttonAddBBOPS").click(function(){
  $('#loadingAdd').show();
  $('#loadingTerpilih').show();
  $("#containerLoad").load("<?php echo base_url('sobbbbops/add'); ?>", function(response, status, xhr) {
    // body...
    if(status == "success")
      $('#loadingAdd').hide();
      $('#loadingTerpilih').hide();
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

  $('#loadingAdd').show();
  $('#loadingTerpilih').show();

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

            $('#loadingAdd').hide();
            $('#loadingTerpilih').hide();
        } else {
            $('#msg-container-ud').html('');
            //$('#modal_ud').modal('hide');

            $('#loadingAdd').hide();
            $('#loadingTerpilih').hide();

            toastr_sukses('Sukses!', json.msg);

            $('#loadingAdd').show();
            $('#loadingTerpilih').show();
            $("#containerLoad").load("<?php echo base_url('sobbgp/add'); ?>", function(response, status, xhr) {
              // body...
              if(status == "success")
                $('#loadingAdd').hide();
              $('#loadingTerpilih').hide();
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
</script>

<!-- Menampung Add LTTB-BH -->
<section class="content">
    <button id="buttonAddBB" class="btn btn-primary">Input BB <i class="fa fa-plus"></i></button>
    <button id="buttonAddBBTL" class="btn btn-primary">Input BBTL <i class="fa fa-plus"></i></button>
    <button id="buttonAddBBOPS" class="btn btn-primary">Input BBOPS <i class="fa fa-plus"></i></button>

    <button type="button" class="btn btn-primary" onclick="add_waktuform()"><i class="fa fa-calendar" aria-hidden="true"></i></button>

    <p></p>
    <div id="containerLoad">
      Loading data... <i class="fa fa-refresh fa-spin"></i>
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
          <input type="hidden" name="form" value="sogpo"/>
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
