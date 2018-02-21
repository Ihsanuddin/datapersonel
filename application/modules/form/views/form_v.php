<!-- Main content -->
<section class="content">
  <div class="row">

    <?php if (!empty($listmenukacab)): ?>
      <div class="col-xs-12">          
        <div class="box box-cos-ecstasy box-solid">
          <div class="box-header">
              <h3 class="box-title">Kacab</h3>
          </div><!-- /.box-header -->
          <div class="box-body">

            <div class="pop-row">
              <?php foreach ($listmenukacab as $menuKacabKey => $menuKacabVal): ?>
                <div class="col-xs-6 col-sm-6 col-md-3 pd-rl">
                  <a href="<?php echo base_url('form/sub/'.$menuKacabVal['link']); ?>"">
                    <div class="halutbtn">
                      <i class="<?php echo $menuKacabVal['icon']; ?>"></i>
                      <div class="subhalutbtn"><?php echo $menuKacabKey; ?></div>
                    </div>
                  </a>
                </div>
              <?php endforeach ?>

              <div class="sambungfloat"></div>
            </div>
              
          </div><!-- /.box-body -->
        </div><!-- /.box -->
      </div>
    <?php endif ?>

    <?php if (!empty($listmenuproduksi)): ?>
      <div class="col-xs-12">          
        <div class="box box-cos-ecstasy box-solid">
          <div class="box-header">
              <h3 class="box-title">Produksi</h3>
          </div><!-- /.box-header -->
          <div class="box-body">

            <div class="pop-row">
              <?php foreach ($listmenuproduksi as $menuProduksiKey => $menuProduksiVal): ?>
                <div class="col-xs-6 col-sm-6 col-md-3 pd-rl">
                  <a href="<?php echo base_url('form/sub/'.$menuProduksiVal['link']); ?>"">
                    <div class="halutbtn">
                      <i class="<?php echo $menuProduksiVal['icon']; ?>"></i>
                      <div class="subhalutbtn"><?php echo $menuProduksiKey; ?></div>
                    </div>
                  </a>
                </div>
              <?php endforeach ?>

              <div class="sambungfloat"></div>
            </div>
              
          </div><!-- /.box-body -->
        </div><!-- /.box -->
      </div>
    <?php endif ?>

    <?php if (!empty($listmenuoperasional)): ?>
      <div class="col-xs-12">          
        <div class="box box-cos-ecstasy box-solid">
          <div class="box-header">
              <h3 class="box-title">Operasional</h3>
          </div><!-- /.box-header -->
          <div class="box-body">

            <div class="pop-row">
              <?php foreach ($listmenuoperasional as $menuOperasionalKey => $menuOperasionalVal): ?>
                <div class="col-xs-6 col-sm-6 col-md-3 pd-rl">
                  <a href="<?php echo base_url('form/sub/'.$menuOperasionalVal['link']); ?>"">
                    <div class="halutbtn">
                      <i class="<?php echo $menuOperasionalVal['icon']; ?>"></i>
                      <div class="subhalutbtn"><?php echo $menuOperasionalKey; ?></div>
                    </div>
                  </a>
                </div>
              <?php endforeach ?>

              <div class="sambungfloat"></div>
            </div>
              
          </div><!-- /.box-body -->
        </div><!-- /.box -->
      </div>
    <?php endif ?>

    <?php if (!empty($listmenugudang)): ?>
      <div class="col-xs-12">          
        <div class="box box-cos-ecstasy box-solid">
          <div class="box-header">
              <h3 class="box-title">Gudang</h3>
          </div><!-- /.box-header -->
          <div class="box-body">

            <div class="pop-row">
              <?php foreach ($listmenugudang as $menuGudangKey => $menuGudangVal): ?>
                <div class="col-xs-6 col-sm-6 col-md-3 pd-rl">
                  <a href="<?php echo base_url('form/sub/'.$menuGudangVal['link']); ?>"">
                    <div class="halutbtn">
                      <i class="<?php echo $menuGudangVal['icon']; ?>"></i>
                      <div class="subhalutbtn"><?php echo $menuGudangKey; ?></div>
                    </div>
                  </a>
                </div>
              <?php endforeach ?>

              <div class="sambungfloat"></div>
            </div>
              
          </div><!-- /.box-body -->
        </div><!-- /.box -->
      </div>
    <?php endif ?>

    <?php if (!empty($listmenupengadaan)): ?>
      <div class="col-xs-12">          
        <div class="box box-cos-ecstasy box-solid">
          <div class="box-header">
              <h3 class="box-title">Pengadaan</h3>
          </div><!-- /.box-header -->
          <div class="box-body">

            <div class="pop-row">
              <?php foreach ($listmenupengadaan as $menuPengadaanKey => $menuPengadaanVal): ?>
                <div class="col-xs-6 col-sm-6 col-md-3 pd-rl">
                  <a href="<?php echo base_url('form/sub/'.$menuPengadaanVal['link']); ?>"">
                    <div class="halutbtn">
                      <i class="<?php echo $menuPengadaanVal['icon']; ?>"></i>
                      <div class="subhalutbtn"><?php echo $menuPengadaanKey; ?></div>
                    </div>
                  </a>
                </div>
              <?php endforeach ?>

              <div class="sambungfloat"></div>
            </div>
              
          </div><!-- /.box-body -->
        </div><!-- /.box -->
      </div>
    <?php endif ?>

    <?php if (!empty($listmenukeuangan)): ?>
      <div class="col-xs-12">          
        <div class="box box-cos-ecstasy box-solid">
          <div class="box-header">
              <h3 class="box-title">Keuangan</h3>
          </div><!-- /.box-header -->
          <div class="box-body">

            <div class="pop-row">
              <?php foreach ($listmenukeuangan as $menuKeuanganKey => $menuKeuanganVal): ?>
                <div class="col-xs-6 col-sm-6 col-md-3 pd-rl">
                  <a href="<?php echo base_url('form/sub/'.$menuKeuanganVal['link']); ?>"">
                    <div class="halutbtn">
                      <i class="<?php echo $menuKeuanganVal['icon']; ?>"></i>
                      <div class="subhalutbtn"><?php echo $menuKeuanganKey; ?></div>
                    </div>
                  </a>
                </div>
              <?php endforeach ?>

              <div class="sambungfloat"></div>
            </div>
              
          </div><!-- /.box-body -->
        </div><!-- /.box -->
      </div>
    <?php endif ?>

  </div>
</section><!-- /.content -->