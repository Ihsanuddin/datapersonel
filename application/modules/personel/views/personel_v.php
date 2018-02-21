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
            "url": "<?php echo site_url('personel/ajax_list')?>",
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

    function add_personel()
    {
      save_method = 'add';
      //$('#form')[0].reset(); // reset form on modals
      //Alternative Rest Form

      $('[name="id"]').val('');
      $('[name="personelNIK"]').val('');
      $('[name="personelName"]').val('');
      $('[name="personelStatus"]').val('');
      $('[name="alamatKTP"]').val('');
      $('[name="alamatDomisili"]').val('');
      $('[name="personelBank"]').val('');
      $('[name="personelRekening"]').val('');
      $('[name="wilayahKerjaID"]').val('');
      $('[name="levelID"]').val('');
      $('[name="baganID"]').val('');
      $('[name="outletID"]').val('');

      $sel.val('').trigger("change");
      $sel2.val('').trigger("change");

      $('#modal_form').modal('show'); // show bootstrap modal
      $('.modal-title').text('Tambah'); // Set Title to Bootstrap modal title
    }

    function edit_personel(id)
    {
      save_method = 'update';
      $('#form')[0].reset(); // reset form on modals

      //Ajax Load data from ajax
      $.ajax({
        url : "<?php echo site_url('personel/ajax_edit/')?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
          $('[name="id"]').val(data.personelID);
          $('[name="personelNIK"]').val(data.personelNIK);
          $('[name="personelName"]').val(data.personelName);
          $('[name="personelStatus"]').val(data.personelStatus).trigger("change");
          $('[name="alamatKTP"]').val(data.alamatKTP);
          $('[name="alamatDomisili"]').val(data.alamatDomisili);
          $('[name="personelBank"]').val(data.personelBank);
          $('[name="personelRekening"]').val(data.personelRekening);
          $('[name="wilayahKerjaID"]').val(data.wilayahKerjaID).trigger("change");
          $('[name="levelID"]').val(data.levelID).trigger("change");
          $('[name="baganID"]').val(data.baganID).trigger("change");
          $('[name="outletID"]').val(data.outletID).trigger("change");

            // $('[name="id"]').val(data.baganID);
            // $('[name="baganName"]').val(data.baganName);
            // $('[name="parentID"]').val(data.parentID);
            // $('[name="class"]').val(data.class);
            // $('[name="order"]').val(data.order);
            // $sel2.val(data.parentID).trigger("change");

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Personel'); // Set title to Bootstrap modal title
            
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
        url = "<?php echo site_url('personel/ajax_add')?>";
      }
      else
      {
        url = "<?php echo site_url('personel/ajax_update')?>";
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
                  // location.reload(); 
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

    function delete_personel(id)
    {
      if(confirm('Are you sure delete this data?'))
      {
        // ajax delete data to database
        $('#loading').show();
        setTimeout(function() {
          $.ajax({
            url : "<?php echo site_url('personel/ajax_delete')?>/"+id,
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
	<button class="btn btn-primary" onclick="add_personel()"><i class="glyphicon glyphicon-plus"></i> Tambah</button>
  <a href="<?php echo base_url('personel/excelPersonel'); ?>" class="btn btn-success"><i class="fa fa-cloud-download"></i> Download</a>
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
      				        	<th>NIK</th>
                        <th>Nama</th>
                        <th>Wilayah</th>
                        <th>Level</th>
      							    <th>Bagian</th>
                        <th>Penempatan</th>
                        <th>Aksi</th>
      				        </tr>
      				      </thead>
                    
      				      <tbody align="left">
      				      </tbody>

      				      <tfoot>
      				        <tr>
      					        <th>NIK</th>
                        <th>Nama</th>
                        <th>Wilayah</th>
                        <th>Level</th>
      				        	<th>Bagian</th>
                        <th>Penempatan</th>
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
              <label class="control-label col-md-3">No.KTP</label>
              <div class="col-md-9">
                <input name="personelNIK" class="form-control" type="text">
              </div>
            </div>
						<div class="form-group">
						  <label class="control-label col-md-3">Nama</label>
						  <div class="col-md-9">
						    <input name="personelName" class="form-control" type="text">
						  </div>
						</div>
            <div class="form-group">
              <label class="control-label col-md-3">Status</label>
              <div class="col-md-9">
                <select name="personelStatus" class="form-control select2" style="width: 100%;">
                  <option value="">-- Pilih Status --</option>
                    <option value="lajang">Lajang</option>
                    <option value="menikah">Menikah</option>
                    <option value="janda">Janda</option>
                    <option value="duda">Duda</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Alamat KTP</label>
              <div class="col-md-9">
                <textarea name="alamatKTP" class="form-control" style="width: 100%;"></textarea>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Domisili</label>
              <div class="col-md-9">
                <textarea name="alamatDomisili" class="form-control" style="width: 100%;"></textarea>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Nama Bank</label>
              <div class="col-md-9">
                <input name="personelBank" class="form-control" type="text">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">No.Rek</label>
              <div class="col-md-9">
                <input name="personelRekening" class="form-control" type="text">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Wilayah</label>
              <div class="col-md-9">
                <select name="wilayahKerjaID" class="form-control select2" style="width: 100%;">
                  <option value="">-- Pilih Wilayah --</option>
                  <?php foreach ($wilayah as $key => $val): ?>
                    <option value="<?php echo $val->wilayahKerjaID; ?>"><?php echo $val->wilayahKerjaName; ?></option>
                  <?php endforeach ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Level</label>
              <div class="col-md-9">
                <select name="levelID" class="form-control select2" style="width: 100%;">
                  <option value="">-- Pilih Level --</option>
                  <?php foreach ($level as $key => $val): ?>
                    <option value="<?php echo $val->levelID; ?>"><?php echo $val->levelName; ?></option>
                  <?php endforeach ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Bagian</label>
              <div class="col-md-9">
                <select name="baganID" class="form-control select2" style="width: 100%;">
                  <option value="">-- Pilih Bagian --</option>
                  <?php foreach ($baganGroup as $keyg => $valg):?>
                    <?php 
                      $this->load->model('bagan/bagan_m');
                      $option =  $this->bagan_m->get_where_custom('parentID', $valg->baganID, 'baganID')->result();
                    ?>
                    <optgroup label="<?php echo $valg->baganName; ?>">
                      <option value="<?php echo $valg->baganID; ?>"><?php echo $valg->baganName; ?></option>
                      <?php foreach ($option as $key => $val):?>
                        <option value="<?php echo $val->baganID; ?>"><?php  echo $val->baganName; ?></option>
                      <?php endforeach ?>
                    </optgroup>
                  <?php endforeach ?>
                 
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Penempatan</label>
              <div class="col-md-9">
                <select name="outletID" class="form-control select2" style="width: 100%;">
                  <option value="">-- Pilih Outlet --</option>
                  <?php foreach ($outlet as $key => $val): ?>
                    <option value="<?php echo $val->outletID; ?>"><?php echo $val->outletName; ?></option>
                  <?php endforeach ?>
                </select>
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

  // $(function() {
  //   $sel = $(".select2").select2({
  //     dropdownParent: $("#modal_form")
  //   });
  // });
</script>