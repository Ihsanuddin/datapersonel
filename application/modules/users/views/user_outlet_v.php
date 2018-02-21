<script type="text/javascript">
    $(function(){
        $('#frm').submit(function(){

            $('#loading').show();
            $('html, body').animate({scrollTop : 0},800);
            setTimeout(function() {
                $.ajax({
                    type:'POST',
                    url:$('#frm').attr('action'),
                    data:$('#frm').serialize(),
                    dataType: 'json',
                    success: function(json){
                      $('#loading').hide();
                      if (json.st === 0) {
                          $('#msg-container').html("<div class='alert alert-danger alert-dismissible bts-bwh' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button><center>"+json.msg+"</center></div>");
                      } else {
                          $('#msg-container').html('');

                          swal({
                              title: json.msg,
                              text: "Data Berhasil di Simpan!",
                              type: "success",
                              showCancelButton: false,
                              confirmButtonColor: "#DD6B55",
                              confirmButtonText: "OK",
                              cancelButtonText: "No, cancel plx!",
                              closeOnConfirm: false,
                              closeOnCancel: false
                            },
                            function(isConfirm){
                              if (isConfirm) {
                                // location.reload();
                                window.location="<?php echo base_url('users/auth/user_outlet/'.$this->uri->segment(4)); ?>";
                              } else {
                                  swal("Cancelled", "Your imaginary file is safe :)", "error");
                              }
                            });

                      }
                    },
               });
            }, 200)
            return false;
        });
    });
    function onClick(userID, outletID){
  				$.ajax({
  					url : "<?php echo site_url('users/auth/ajax_activate_outletuser')?>/"+userID+"/"+outletID,
  					type: "POST",
  					dataType: "json",
  					success: function(json)
  					{
  						//if success reload ajax table
  						if (json.st === 0) {
  								toastr_gagal('Gagal!', json.msg);
  						} else {
  								$('#msg-container').html('');
  								toastr_sukses('Sukses!', json.msg);
  						}
  					},
  					error: function (jqXHR, textStatus, errorThrown)
  					{
  							alert('Error adding / update data');
  					}
  			 });

  				$("#cek_uo"+outletID).attr('onClick', "unClick("+userID+','+outletID+")");
          $("#ket_uo"+outletID).text('Aktif');
  			}

  	function unClick(userID, outletID) {
  		$.ajax({
  			url : "<?php echo site_url('users/auth/ajax_deactivate_outletuser')?>/"+userID+"/"+outletID,
  			type: "POST",
  			dataType: "json",
  			success: function(json)
  			{
  				//if success reload ajax table
  				if (json.st === 0) {
  						toastr_gagal('Gagal!', json.msg);
  				} else {
  						$('#msg-container').html('');
  						toastr_sukses('Sukses!', json.msg);
  				}
  			},
  			error: function (jqXHR, textStatus, errorThrown)
  			{
  					alert('Error adding / update data');
  			}
  	 });

  		$("#cek_uo"+outletID).attr('onClick', 'onClick('+userID+','+outletID+')');
      $("#ket_uo"+outletID).text('Tdk Aktif');
  	}
</script>

<!-- Main content -->
<section class="content">
    <!-- Pesan Kesalahan -->
    <div id="msg-container"></div>
    <div class="row">
        <div class="col-xs-6">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title"><?php echo $title ?> </h3>
                </div><!-- /.box-header -->
                <div class="box-body">
	                <!-- Mulai -->
	                <table id="table" class="table table-bordered table-striped">
      				      <thead>
      				        <tr>
                          <th class="thstyle" style="vertical-align:middle;">No</th>
      				            <th class="thstyle" style="vertical-align:middle;">Nama Outlet</th>
                          <th class="thstyle" style="vertical-align:middle;">Alamat</th>
      							     <th class="thstyle" style="vertical-align:middle;">Status</th>
                         <th class="thstyle" style="vertical-align:middle;">Keterangan</th>
      				        </tr>
      				      </thead>
      				      <tbody>
                    <?php
                      $this->load->model('outlet/outlet_m');

                     ?>
                     <?php $i = 1; ?>
                    <?php foreach ($get_area as $gaKey): ?>
                      <tr>
                        <td class="info" colspan="5"><?php echo $gaKey->areaName; ?></td>
                      </tr>
                      <?php $no = 1; ?>
                      <?php $get_outlet = $this->outlet_m->get_where_custom('areaID', $gaKey->areaID, 'outletName')->result(); ?>
                      <?php foreach ($get_outlet as $goKey): ?>
                        <tr>
                          <td><label style="font-weight: normal !important;" for="uo<?php echo $i; ?>"><?php echo "$no"; ?></label></td>
                          <td><label style="font-weight: normal !important;" for="uo<?php echo $i; ?>"><?php echo $goKey->outletName; ?></label></td>
                          <td><label style="font-weight: normal !important;" for="uo<?php echo $i; ?>"><?php echo $goKey->outletAddress; ?></label></td>
                          <td>
          									<label class="switch">
          										<input id="cek_uo<?php echo $goKey->outletID; ?>" value="<?php echo $goKey->outletName; ?>" type="checkbox"
                                <?php
                                  if (!empty($datauo[$goKey->outletID])) {
                                    $onklik = "unClick(".$userID.','.$goKey->outletID.")";
                                    echo("checked ");
                                    echo "onClick=".'"'.$onklik.'"';
                                  }else{
                                    $onklik = "onClick(".$userID.','.$goKey->outletID.")";
                                    echo "onClick=".'"'.$onklik.'"';
                                  }
                                ?>>
          										<div class="slider"></div>
          									</label>
                          </td>
                          <td>
                            <strong id="ket_uo<?php echo $goKey->outletID; ?>">
                                <?php
                                  if (!empty($datauo[$goKey->outletID])) {
                                    echo "Aktif";
                                  }else{
                                    echo "Tdk Aktif";
                                  }
                                ?>
                            </strong>
                          </td>
                        </tr>
                      <?php $i++;$no++; ?>
                      <?php endforeach ?>
                    <?php endforeach ?>
                    
                    </tbody>
      				    </table>
                  <br/>
                </div><!-- /.box-body -->
                <div id="loading" style="display:none" class="overlay">
                    <i class="fa fa-refresh fa-spin"></i>
                </div>
            </div><!-- /.box -->
        </div>
    </div>
</section><!-- /.content -->
