<?php

$user = $this->ion_auth->user()->row();

$menu = array();

// Menu Dashboard
$menu['Dashboard'] = array('icon' => 'fa fa-dashboard', 'link' => 'dashboard', );

$menu['Buku'] = array('icon' => 'fa fa-wpforms', 'link' => 'books', );

$menu['Form'] = array('icon' => 'fa fa-wpforms', 'link' => 'form', );

$menu['Laporan'] = array('icon' => 'fa fa-file-text-o', 'link' => 'laporan', );

$kontrol = array(115, 123);
if ($this->ion_auth->in_role($kontrol)) {
  $menu['Kontrol'] = array('icon' => 'fa fa-eye', 'link' => '#', );
  if ($this->ion_auth->in_role(154)) {
    $menu['Kontrol']['sub']['Log Keamanan'] = array(
                'icon' => 'fa fa-circle-o',
                'link' => 'logsecurity'
              );
  }
}

// Menu Master
$groupmd = array(3, 4, 5, 6, 7, 141, 8, 9, 150, 153);
if ($this->ion_auth->in_role($groupmd)) {
  $menu['Master'] = array('icon' => 'fa fa-database', 'link' => '#', );

  if ($this->ion_auth->in_role(4)) {
    $menu['Master']['sub']['Produk'] = array(
                  'icon' => 'fa fa-circle-o',
                  'link' => 'products'
                );
  }

  if ($this->ion_auth->in_role(150)) {
    $menu['Master']['sub']['Produk LSHP4'] = array(
                  'icon' => 'fa fa-circle-o',
                  'link' => 'productslshp4'
                );
  }

  if ($this->ion_auth->in_role(3)) {
    $menu['Master']['sub']['Kategori'] = array(
                  'icon' => 'fa fa-circle-o',
                  'link' => 'categories'
                );
  }

  if ($this->ion_auth->in_role(153)) {
    $menu['Master']['sub']['Stock Pasti'] = array(
                  'icon' => 'fa fa-circle-o',
                  'link' => 'stockpasti'
                );
  }

  if ($this->ion_auth->in_role(7)) {
    $menu['Master']['sub']['Bahan Baku'] = array(
                  'icon' => 'fa fa-circle-o',
                  'link' => 'ingredients'
                );
  }

  if ($this->ion_auth->in_role(141)) {
  $menu['Master']['sub']['Konversi'] = array(
                  'icon' => 'fa fa-circle-o',
                  'link' => 'conversion'
                );
  }

  if ($this->ion_auth->in_role(9)) {
    $menu['Master']['sub']['Suppliers'] = array(
                  'icon' => 'fa fa-circle-o',
                  'link' => 'suppliers'
                );
  }

  if ($this->ion_auth->in_role(5)) {
    $menu['Master']['sub']['Area'] = array(
                  'icon' => 'fa fa-circle-o',
                  'link' => 'area'
                );
  }

  if ($this->ion_auth->in_role(6)) {
    $menu['Master']['sub']['Outlet'] = array(
                  'icon' => 'fa fa-circle-o',
                  'link' => 'outlet'
                );
  }
  
  if ($this->ion_auth->in_role(159)) {
    $menu['Master']['sub']['Saldo Awal'] = array(
                  'icon' => 'fa fa-circle-o',
                  'link' => 'openingblance'
                );
  }

  // Menu Users
  if ($this->ion_auth->in_role(8)) {
    $menu['Master']['sub']['Users'] = array(
                  'icon' => 'fa fa-circle-o',
                  'link' => 'users'
                );
  }
}


// Pengaturan
$grouppengaturan = array(115, 123, 136);
if ($this->ion_auth->in_role($grouppengaturan)) {
  $menu['Pengaturan'] = array('icon' => 'fa fa-cog', 'link' => '#', );
  if ($this->ion_auth->in_role(115)) {
    $menu['Pengaturan']['sub']['Instruksi'] = array(
                'icon' => 'fa fa-circle-o',
                'link' => 'instruction'
              );
  }
}

 ?>

<header class="main-header">
  <nav class="navbar navbar-static-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <a href="#" class="navbar-brand">
          <div class="visible-md visible-lg">Waroeng <b>SS</b></div>
          <div class="visible-xs visible-sm"><b>SS</b></div>
        </a>
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
          <i class="fa fa-bars"></i>
        </button>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
        <ul class="nav navbar-nav">
          <?php
            function in_array_r($needle, $haystack, $strict = false) {
              foreach ($haystack as $item) {
                if (($strict ? $item === $needle : $item == $needle) || (is_array($item) && in_array_r($needle, $item, $strict))) {
                  return true;
                }
              }
              return false;
            }

            foreach ($menu as $key=>$value) {
              if (isset($value['sub'])) {
                $valsub = $value['sub'];
              }else{
                $valsub = "";
              }

              if (empty($valsub)) {
                echo "<li class='";
                  if ($value['link'] == $this->uri->segment(1)) {echo "active";}else{echo '';}
                echo "'>" . anchor($value['link'], "<i class='$value[icon]'></i> <span>" . $key) . "</span></li>";
              }else{
                echo "<li class='dropdown ";
                $ur1 = $this->uri->segment(2);
                if (empty($ur1)) {
                  $acLink = $this->uri->segment(1);
                 }else{
                  $acLink = $this->uri->segment(1)."/".$this->uri->segment(2);
                 }

                // if (in_array($acLink, $value['sub'])) {echo "active";}else{echo '';}
                if (in_array_r($acLink, $valsub)) {echo "active";}else{echo '';}
                echo "'>
                    ".anchor('#', "<i class='$value[icon]'></i> ".$key."<span class='caret'></span>", array('class' => 'dropdown-toggle', 'data-toggle' => 'dropdown'))."
                        <ul class='dropdown-menu' role='menu'>";
                foreach ($valsub as $key2 => $value2){

                     echo "<li class='";
                     $ur2 = $this->uri->segment(2);
                     if (empty($ur2)) {
                      if ($value2['link'] == $this->uri->segment(1)) {echo "active";}else{echo '';}
                     }else{
                      if ($value2['link'] == $this->uri->segment(1)."/".$this->uri->segment(2)) {echo "active";}else{echo '';}
                     }
                     echo "'>" . anchor($value2['link'], "<i class='$value2[icon]'></i> <span>" . $key2) . "</span></li>";
                }
                   echo"</ul>
                    </li>";
              }
            }
          ?>

          <li class="visible-xs visible-sm"><a href="<?php echo base_url('logout'); ?>"><i class="fa fa-sign-out" aria-hidden="true"></i> Keluar</a></li>
        </ul>
      </div>
    </div><!-- /.container-fluid -->
  </nav>
</header>

<script type="text/javascript">
  $(function () {
      $("#dtbls_head").DataTable({
        // "ordering": false
        "searching": true,
        "lengthChange": true,
      });
  });
</script>
