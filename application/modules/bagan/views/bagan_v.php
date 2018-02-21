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
            "url": "<?php echo site_url('bagan/ajax_list')?>",
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

      $("#refreshPreview").click(function(){
        $('#loadingPreview').show();
        $("#loadPreview").load("<?php echo base_url('bagan/load_preview_bagan/'); ?>", function(response, status, xhr) {
          // body...
          if(status == "success")
            $('#loadingPreview').hide();
          if(status == "error")
            sweetAlert("Oops...", "Terjadi kesalahan!", "error");
        });
      });
    });

    function add_bagan()
    {
      save_method = 'add';
      //$('#form')[0].reset(); // reset form on modals
      //Alternative Rest Form

      $('[name="id"]').val('');
      $('[name="baganName"]').val('');
      $('[name="parentID"]').val('');
      $('[name="class"]').val('');
      $('[name="order"]').val('');
      $sel.val('').trigger("change");
      $sel2.val('').trigger("change");

      $('#modal_form').modal('show'); // show bootstrap modal
      $('.modal-title').text('Tambah'); // Set Title to Bootstrap modal title
    }

    function edit_bagan(id)
    {
      save_method = 'update';
      $('#form')[0].reset(); // reset form on modals

      //Ajax Load data from ajax
      $.ajax({
        url : "<?php echo site_url('bagan/ajax_edit/')?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
           
            $('[name="id"]').val(data.baganID);
            $('[name="baganName"]').val(data.baganName);
            $('[name="parentID"]').val(data.parentID);
            $('[name="class"]').val(data.class);
            $('[name="order"]').val(data.order);
            $sel2.val(data.parentID).trigger("change");

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit bagan'); // Set title to Bootstrap modal title
            
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
        url = "<?php echo site_url('bagan/ajax_add')?>";
      }
      else
      {
        url = "<?php echo site_url('bagan/ajax_update')?>";
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
                  location.reload(); 
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

    function delete_bagan(id)
    {
      if(confirm('Are you sure delete this data?'))
      {
        // ajax delete data to database
        $('#loading').show();
        setTimeout(function() {
          $.ajax({
            url : "<?php echo site_url('bagan/ajax_delete')?>/"+id,
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
	<button class="btn btn-primary" onclick="add_bagan()"><i class="glyphicon glyphicon-plus"></i> Tambah</button>
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
                        <th>ID</th>
      				        	<th>Nama Bagian</th>
                        <th>Induk</th>
                        <th>Class</th>
                        <th>Order</th>
      							    <th>Aksi</th>
      				        </tr>
      				      </thead>
                    
      				      <tbody align="left">
      				      </tbody>

      				      <tfoot>
      				        <tr>
                        <th>ID</th>
      					        <th>Nama Bagian</th>
                        <th>Induk</th>
                        <th>Class</th>
                        <th>Order</th>
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

    <div class="row">
      <div class="col-md-12">
          <div class="box box-solid box-primary">
              <div class="box-header">
                  <h3 class="box-title"><?php echo "Preview Struktur Organisasi"; ?></h3>
                  <div class="box-tools pull-right">
                    <!-- <a title="Word" class="btn btn-box-tool tool-success" href="<?php echo base_url('bagan/word_bagan'); ?>" target="_blank"><i class="fa fa-file-word-o"></i> List Proker</a>
                    <a title="PDF" class="btn btn-box-tool tool-danger" href="<?php echo base_url('bagan/pdf_proker'); ?>" target="_blank"><i class="fa fa-file-pdf-o"></i> Proker</a> -->
                    <button id="refreshPreview" class="btn btn-box-tool"><i class="fa fa-refresh"></i></button>

                  </div>
              </div><!-- /.box-header -->
              <div class="box-body row-horizon">

              <div id="loadPreview">
                <!-- Loading data... <i class="fa fa-refresh fa-spin"></i> -->
                <?php echo Modules::run('bagan/load_preview_bagan'); ?>
              </div>

              </div><!-- /.box-body -->
              <div id="loadingPreview" style="display:none" class="overlay">
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
						    <input name="baganName" class="form-control" type="text">
						  </div>
						</div>
            <div class="form-group">
              <label class="control-label col-md-3">Induk</label>
              <div class="col-md-9">
                <select name="parentID" class="form-control select2-area" style="width: 100%;">
                  <option value="">-- Pilih Induk --</option>
                  <?php foreach ($parent as $parentKey => $parentVal): ?>
                    <option value="<?php echo $parentVal->baganID; ?>"><?php echo $parentVal->baganName; ?></option>
                  <?php endforeach ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Class</label>
              <div class="col-md-9">
                <input name="class" class="form-control" type="text">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Order</label>
              <div class="col-md-9">
                <input name="order" class="form-control" type="text">
              </div>
            </div>
					</div>
				</form>
			</div>

			<div class="modal-footer">
				<button type="button" id="btnSave" onclick="save()" class="btn btn-primary">Simpan</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Batal</button>
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