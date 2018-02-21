<script type="text/javascript">
$(document).ready(function(){
$("#containerLoad").load("<?php echo base_url('pbbhp'); ?>", function(response, status, xhr) {
  // body...
  if(status == "success")
    $('#loading').hide();
  if(status == "error")
    sweetAlert("Oops...", "Terjadi kesalahan!", "error");
    // alert("Error: " + xhr.status + ": " + xhr.statusText);
});

$("#buttonHistoryBB").click(function(){
  $('#loading').show();
  $("#containerLoad").load("<?php echo base_url('pbbhp'); ?>", function(response, status, xhr) {
    // body...
    if(status == "success")
      $('#loading').hide();
    if(status == "error")
      sweetAlert("Oops...", "Terjadi kesalahan!", "error");
  });
});

$("#buttonHistoryBBTL").click(function(){
  $('#loading').show();
  $("#containerLoad").load("<?php echo base_url('pbbtlhp'); ?>", function(response, status, xhr) {
    // body...
    if(status == "success")
      $('#loading').hide();
    if(status == "error")
      sweetAlert("Oops...", "Terjadi kesalahan!", "error");
  });
});

});
</script>

<!-- Menampung Add LTTB-BH -->
<section class="content">
    <button id="buttonHistoryBB" class="btn btn-primary">History BB <i class="fa fa-plus"></i></button>
    <button id="buttonHistoryBBTL" class="btn btn-primary">History BBTL <i class="fa fa-plus"></i></button>

    <p></p>
    <div id="msg-container"></div>
    <div id="containerLoad">
      Loading data... <i class="fa fa-refresh fa-spin"></i>
    </div>
</section>