<form action="<?php echo base_url('import/prosess_import'); ?>" method="POST" id="form-import-items" enctype="multipart/form-data">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <h3 class="modal-title">Import</h3>
    </div>
    <div class="modal-body form">
      <div id="msg-container-import"></div>

        <div class="form-body">
          <div class="form-group">
            <label class="control-label col-md-3">Pilih</label>
            <div class="col-md-9">
              <input name="importFile" type="file" accept=".xls">
            </div>
          </div>
        </div>

    </div>

    <div class="modal-footer">
      <button type="submit" id="btnSave" class="btn btn-primary">Simpan</button>
      <button type="button" class="btn btn-danger" data-dismiss="modal">Batal</button>
    </div>
  </div><!-- /.modal-content -->
</form>