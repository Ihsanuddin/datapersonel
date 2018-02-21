<?php 
$user = $this->ion_auth->user()->row();

$menu = array();

// Menu Dashboard
$menu['Dashboard'] = array('icon' => 'fa fa-dashboard', 'link' => 'dashboard', );

$menu['Data Personel'] = array('icon' => 'fa fa-list-ul', 'link' => "personel", );

// Menu Master Data
$groupmd = array(3, 4, 5, 6, 7,8);
if ($this->ion_auth->in_role($groupmd)) {
$menu['Master Data'] = array('icon' => 'fa fa-database', 'link' => '#', );
}

if ($this->ion_auth->in_role(7)) {
$menu['Master Data']['sub']['Level'] = array(
                  'icon' => 'fa fa-circle-o',
                  'link' => 'level'
                );
}

if ($this->ion_auth->in_role(8)) {
$menu['Master Data']['sub']['Wilayah Kerja'] = array(
                  'icon' => 'fa fa-circle-o',
                  'link' => 'wilayahkerja'
                );
}
if ($this->ion_auth->in_role(6)) {
$menu['Master Data']['sub']['Bagian'] = array(
                  'icon' => 'fa fa-circle-o',
                  'link' => 'bagan'
                );
}

if ($this->ion_auth->in_role(4)) {
$menu['Master Data']['sub']['Area'] = array(
                  'icon' => 'fa fa-circle-o',
                  'link' => 'area'
                );
}

if ($this->ion_auth->in_role(5)) {
$menu['Master Data']['sub']['Outlet'] = array(
                  'icon' => 'fa fa-circle-o',
                  'link' => 'outlet'
                );
}
if ($this->ion_auth->in_role(3)) {
$menu['Master Data']['sub']['User'] = array(
                  'icon' => 'fa fa-circle-o',
                  'link' => 'users'
                );
}
 ?>

<aside class="main-sidebar">
  <!-- sidebar: style can be found in sidebar.less -->
  <section class="sidebar">
    <!-- Sidebar user panel -->
    <div class="user-panel">
      <div class="pull-left image">
        <img src="<?php echo base_url('assets/img/usr/default.jpg'); ?>" class="img-circle" alt="User Image" />
      </div>
      <div class="pull-left info">
        <p><?php echo $user->first_name; ?></p>
        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
      </div>
    </div>

    <ul class="sidebar-menu">
      <li class="header">MAIN NAVIGATION</li>

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
              echo "<li class='treeview ";
              $ur1 = $this->uri->segment(2);
              if (empty($ur1)) {
                $acLink = $this->uri->segment(1);
               }else{
                $acLink = $this->uri->segment(1)."/".$this->uri->segment(2);
               }

              // if (in_array($acLink, $value['sub'])) {echo "active";}else{echo '';}
              if (in_array_r($acLink, $valsub)) {echo "active";}else{echo '';}
              echo "'>
                  ".anchor('#', "<i class='$value[icon]'></i>"."<span>".$key."</span>".' <i class="fa fa-angle-left pull-right"></i>')."
                      <ul class='treeview-menu'>";
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
       </ul>
  </section>
  <!-- /.sidebar -->
</aside>