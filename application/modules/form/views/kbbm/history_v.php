<script type="text/javascript">
$(document).ready(function(){
$("#containerLoad").load("<?php echo base_url('kbbmp/load_history/'.date('Y-m-d')); ?>", function(response, status, xhr) {
  // body...
  if(status == "success")
    $('#loading').hide();
  if(status == "error")
    sweetAlert("Oops...", "Terjadi kesalahan!", "error");
    // alert("Error: " + xhr.status + ": " + xhr.statusText);
});

$('#frmpriode').submit(function(){
          
  $('#loading').show();
    $.ajax({
      type:'POST',
      url:$('#frmpriode').attr('action'),
      data:$('#frmpriode').serialize(),
      dataType: 'json',
      success: function(data){
        $('#loading').hide();
        if (data.st === 0) {
            $('#msg-container-priode').html(data.msg);
        } else {
            $('#msg-container-priode').html('');
            
            var jenis = $("#jenis").val();

            $('#loading').show();
            $("#containerLoad").load("<?php echo base_url(''); ?>/"+jenis+'/load_history/'+data.usedDate, function(response, status, xhr) {
              // body...
              if(status == "success")
                $('#loading').hide();
                $('#modal_priode').modal('hide');
              if(status == "error")
                sweetAlert("Oops...", "Terjadi kesalahan!", "error");
            });
        }
      },
      error: function (jqXHR, textStatus, errorThrown){
          alert('Error adding / update data');
      }

    });
  return false;
});

});
</script>

<section class="content">
    <button class="btn btn-primary" data-toggle="modal" data-target="#modal_priode"><i class="fa fa-search"></i> Cari</button>
    <p></p>

    <div id="msg-container"></div>
    <div id="containerLoad">
        Loading data... <i class="fa fa-refresh fa-spin"></i>
    </div>
</section>

<!-- Bootstrap -->
<div class="modal fade" id="modal_priode" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
          <form id="frmpriode" class="form-horizontal" action="<?php echo base_url('kbbmp/search_history/'); ?>" method="POST">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h3 class="modal-title">Cari</h3>
            </div>
            <div class="modal-body form">
                <div id="msg-container-priode"></div>
                <div class="form-group">
                  <label class="control-label col-md-3">Tanggal Digunakan</label>
                  <div class="col-md-9">
                    <input type="text" class="form-control default_datetimepicker" name="usedDate" onfocus="blur();"/>
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-md-3">Jenis</label>
                  <div class="col-md-9">
                    <select class="form-control" name="jenis" id="jenis">
                      <option value="kbbmp">Kebutuhan BB</option>
                      <option value="kbbmobbtl">Kebutuhan BBTL</option>
                      <option value="kbbmobbops">Kebutuhan BBOPS</option>
                    </select>
                  </div>
                </div>
            </div>
            <div class="modal-footer">
              <input type="submit" name="btnSearch" class="btn btn-primary" value="Cari">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
            </div>
          </form>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- End Bootstrap modal -->

<script type="text/javascript">
  $('#modal_priode').on('hidden.bs.modal', function () {
    $('#msg-container-priode').html('');
      $('#frmpriode')[0].reset();
  });

  $('.default_datetimepicker').datetimepicker({
    timepicker:false,
    format:'Y-m-d',
    formatDate:'Y-m-d',
    //maxDate:'+1970/01/02'//tommorow is maximum date calendar
  });
</script>