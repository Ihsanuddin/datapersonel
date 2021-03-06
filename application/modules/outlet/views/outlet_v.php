<script type="text/javascript">
    var save_method; //for save method string
    var table;
    $(document).ready(function() {
      table = $('#table').DataTable({ 
        
        "processing": true, //Feature control the processing indicator.
        "serverSide": true, //Feature control DataTables' server-side processing mode.
        "responsive": true,
        
        // Load data for the table's content from an Ajax source
        "ajax": {
            "url": "<?php echo site_url('outlet/ajax_list')?>",
            "type": "POST"
        },

        //Set column definition initialisation properties.
        "columnDefs": [
        { 
          "targets": [ -1 ], //last column
          "orderable": false, //set not orderable
        },
        ],

      });
    });

    function add_outlet()
    {
      save_method = 'add';
      //$('#form')[0].reset(); // reset form on modals
      //Alternative Rest Form

      $('[name="id"]').val('');
      $('[name="outletName"]').val('');
      $('[name="outletAddress"]').val('');
      $('[name="areaID"]').val('');
      $('[name="outletStatus"]').val('');
      $sel.val('').trigger("change");
      $sel2.val('').trigger("change");

      $('#modal_form').modal('show'); // show bootstrap modal
      $('.modal-title').text('Tambah'); // Set Title to Bootstrap modal title
    }

    function edit_outlet(id)
    {
      save_method = 'update';
      $('#form')[0].reset(); // reset form on modals

      //Ajax Load data from ajax
      $.ajax({
        url : "<?php echo site_url('outlet/ajax_edit/')?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
           
            $('[name="id"]').val(data.outletID);
            $('[name="outletName"]').val(data.outletName);
            $('[name="outletAddress"]').val(data.outletAddress);
            $('[name="areaID"]').val(data.areaID);
            $('[name="outletStatus"]').val(data.outletStatus);
            $sel2.val(data.areaID).trigger("change");

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Outlet'); // Set title to Bootstrap modal title
            
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
    }

    function reload_table()
    {
      table.ajax.reload(null,false); //reload datatable ajax 
    }

    function save()
    {
      var url;
      if(save_method == 'add') 
      {
        url = "<?php echo site_url('outlet/ajax_add')?>";
      }
      else
      {
        url = "<?php echo site_url('outlet/ajax_update')?>";
      }

      $('#modal_form').modal('hide');
      $('#loading').show();
      setTimeout(function() {
       // ajax adding data to database
        $.ajax({
            url : url,
            type: "POST",
            data: $('#form').serialize(),
            dataType: "JSON",
            success: function(data)
            {
              //if success close modal and reload ajax table
              //$('#modal_form').modal('hide');
              reload_table();
              if (data.st === 0) {
                  $('#msg-container').html(data.msg);
                  $('#modal_form').modal('show');
                  $('#loading').hide();
              } else {
                  $('#msg-container').html('');
                  //$('#modal_form').modal('hide');
                  reload_table();
                  $('#loading').hide();

                  swal("Data berhasil disimpan!", "Tekan tombol!", "success");
              }
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error adding / update data');
            }
        });

      },1500);
    }

    function delete_outlet(id)
    {
      if(confirm('Are you sure delete this data?'))
      {
        // ajax delete data to database
        $('#loading').show();
        setTimeout(function() {
          $.ajax({
            url : "<?php echo site_url('outlet/ajax_delete')?>/"+id,
            type: "POST",
            dataType: "JSON",
            success: function(data)
            {
               //if success reload ajax table
               $('#modal_form').modal('hide');
               reload_table();
               $('#loading').hide();

               swal("Data berhasil dihapus!", "Tekan tombol!", "success");
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error adding / update data');
            }
         });
       },1100)
      }
    }
</script>

<!-- Main content -->
<section class="content">
	<button class="btn btn-primary" onclick="add_outlet()"><i class="glyphicon glyphicon-plus"></i> Tambah</button>
	<p></p>

    <div class="row">
        <div class="col-xs-12">
            <div class="box box-warning box-solid">
                <div class="box-header">
                    <h3 class="box-title"><?php echo $title ?></h3>
                </div><!-- /.box-header -->
                <div class="box-body row-horizon">
                    
	                <!-- Mulai -->
	                <table id="table" class="table table-bordered table-striped display" cellspacing="0" width="100%">
      				      <thead>
      				        <tr>
      				        	<th>Nama</th>
                        <th>Area</th>
                        <th>Status</th>
      							    <th>Aksi</th>
      				        </tr>
      				      </thead>
                    
      				      <tbody align="left">
      				      </tbody>

      				      <tfoot>
      				        <tr>
      					        <th>Nama</th>
                        <th>Area</th>
                        <th>Status</th>
      				        	<th>Aksi</th>
      				        </tr>
      				      </tfoot>
      				    </table>

                </div><!-- /.box-body -->
                <div id="loading" style="display:none" class="overlay">
                    <i class="fa fa-refresh fa-spin"></i>
                </div>
            </div><!-- /.box -->
        </div>
    </div>
</section><!-- /.content -->

<!-- Bootstrap modal -->
<div class="modal fade" id="modal_form" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h3 class="modal-title">Form</h3>
			</div>
			<div class="modal-body form">
          <div id="msg-container"></div>
			    <form action="#" id="form" class="form-horizontal">
					<input type="hidden" value="" name="id"/> 
					<div class="form-body">
						<div class="form-group">
						  <label class="control-label col-md-3">Nama</label>
						  <div class="col-md-9">
						    <input name="outletName" class="form-control" type="text">
						  </div>
						</div>
            <div class="form-group">
              <label class="control-label col-md-3">Alamat</label>
              <div class="col-md-9">
                <input name="outletAddress" class="form-control" type="text">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Area</label>
              <div class="col-md-9">
                <select name="areaID" class="form-control select2-area" style="width: 100%;">
                  <option value="">-- Pilih Area --</option>
                  <?php foreach ($area as $areaKey => $areaVal): ?>
                    <option value="<?php echo $areaVal->areaID; ?>"><?php echo $areaVal->areaName; ?></option>
                  <?php endforeach ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Status</label>
              <div class="col-md-9">
                <select name="outletStatus" class="form-control" style="width: 100%;">
                  <option value="">-- Pilih Status --</option>
                  <option value="1">Aktif</option>
                  <option value="0">Tidak Aktif</option>
                </select>
              </div>
            </div>
					</div>
				</form>
			</div>

			<div class="modal-footer">
				<button type="button" id="btnSave" onclick="save()" class="btn btn-primary">Save</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
			</div>
		</div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- End Bootstrap modal -->

<script>
  $('#modal_form').on('hidden.bs.modal', function () {
    //location.reload();
    $('#msg-container').html('');

  });
</script>