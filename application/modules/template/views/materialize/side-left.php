<?php 
$user = $this->ion_auth->user()->row();

$menu = array();

// Menu Dashboard
$menu['Dashboard'] = array('icon' => 'dashboard', 'link' => 'dashboard', );

// Book
$menu['Rencana'] = array('icon' => 'import_contacts', 'link' => 'books', );

$menu['Cashbond'] = array('icon' => 'announcement', 'link' => 'cashbond', );

$menu['Penjualan'] = array('icon' => 'attach_money', 'link' => 'sales', );

// Hutang
// $menu['Hutang'] = array('icon' => 'announcement', 'link' => 'hutang', );

// Piutang
// $menu['Piutang'] = array('icon' => 'assignment_late', 'link' => 'piutang', );

// Menu Master Data
$menu['Master Data'] = array('icon' => 'folder', 'link' => '#', );
$menu['Master Data']['sub']['Area'] = array(
                  'icon' => 'keyboard_arrow_right',
                  'link' => 'area'
                );
$menu['Master Data']['sub']['Waroeng'] = array(
                  'icon' => 'keyboard_arrow_right',
                  'link' => 'outlet'
                );
$menu['Master Data']['sub']['Departemen'] = array(
                  'icon' => 'keyboard_arrow_right',
                  'link' => 'departments'
                );
$menu['Master Data']['sub']['User'] = array(
                  'icon' => 'keyboard_arrow_right',
                  'link' => 'users'
                );
 ?>

<ul id="slide-out" class="side-nav fixed leftside-navigation">
  <li class="user-details cyan darken-2">
    <div class="row">
      <div class="col col s4 m4 l4">
        <img src="<?php echo base_url('assets/img/usr/').$user->image; ?>" alt="" class="circle responsive-img valign profile-image cyan">
      </div>
      <div class="col col s8 m8 l8">
        <ul id="profile-dropdown-nav" class="dropdown-content">
          <li>
            <a href="#" class="grey-text text-darken-1">
              <i class="material-icons">face</i> Profile</a>
          </li>
          <li>
            <a href="#" class="grey-text text-darken-1">
              <i class="material-icons">settings</i> Settings</a>
          </li>
          <li>
            <a href="#" class="grey-text text-darken-1">
              <i class="material-icons">live_help</i> Help</a>
          </li>
          <li class="divider"></li>
          <li>
            <a href="#" class="grey-text text-darken-1">
              <i class="material-icons">lock_outline</i> Lock</a>
          </li>
          <li>
            <a href="#" class="grey-text text-darken-1">
              <i class="material-icons">keyboard_tab</i> Logout</a>
          </li>
        </ul>
        <a class="btn-flat dropdown-button waves-effect waves-light white-text profile-btn" href="#" data-activates="profile-dropdown-nav"><?php echo $user->first_name; ?><i class="mdi-navigation-arrow-drop-down right"></i></a>
        <p class="user-roal"><?php echo $user->company; ?></p>
      </div>
    </div>
  </li>
          <li class="li-hover">
            <p class="ultra-small margin more-text">Menu Utama</p>
          </li>
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
                echo "<li class='bold ";
                if ($value['link'] == $this->uri->segment(1)) {echo "active";}else{echo '';}
                echo "'>";
                echo "<a href='".base_url($value['link'])."'>";
                  echo "<i class='material-icons'>".$value['icon']."</i>";
                  echo "<span class='nav-text'>".$key."</span>";
                echo "</a>";
              }else{

                $ur1 = $this->uri->segment(2);
                if (empty($ur1)) {
                  $acLink = $this->uri->segment(1);
                 }else{
                  $acLink = $this->uri->segment(1)."/".$this->uri->segment(2);
                 }

                $aktiv1 = (in_array_r($acLink, $valsub)) ? "active" : "";

                echo "
                <li class='no-padding'>
                  <ul class='collapsible' data-collapsible='accordion'>
                    <li class='bold'>
                      <a class='collapsible-header waves-effect waves-cyan ".$aktiv1."'>
                        <i class='material-icons'>".$value['icon']."</i>
                        <span class='nav-text'>".$key."</span>
                      </a>
                      <div class='collapsible-body'>
                        <ul>";

                        foreach ($valsub as $key2 => $value2){
                          $ur2 = $this->uri->segment(2);
                           if (empty($ur2)) {
                            if ($value2['link'] == $this->uri->segment(1)) {$aktiv2 = "active";}else{$aktiv2 = '';}
                           }else{
                            if ($value2['link'] == $this->uri->segment(1)."/".$this->uri->segment(2)) {$aktiv2 = "active";}else{$aktiv2 = '';}
                           }

                          echo "<li class='".$aktiv2."'>
                            <a href='".base_url($value2['link'])."'>
                              <i class='material-icons'>".$value2['icon']."</i>
                              <span>".$key2."</span>
                            </a>
                          </li>";
                        }

                echo "
                        </ul>
                      </div>
                    </li>
                  </ul>
                </li>";
              }
            }
          ?>
</ul>
<a href="#" data-activates="slide-out" class="sidebar-collapse btn-floating btn-medium waves-effect waves-light hide-on-large-only">
  <i class="material-icons">menu</i>
</a>