<?php
  $get_uri = $this->uri->uri_string();
  $get_uri = explode('/', $get_uri)
?>

<!-- Search for small screen -->
<div class="header-search-wrapper grey lighten-2 hide-on-large-only">
  <input type="text" name="Search" class="header-search-input z-depth-2" placeholder="Explore Materialize">
</div>
<div class="container">
  <div class="row">
    <div class="col s10 m6 l6">
      <h5 class="breadcrumbs-title"><?php echo $title; ?></h5>
      <ol class="breadcrumbs">
        <?php foreach ($get_uri as $key): ?>
          <?php $aktiv = (end($get_uri) == $key) ? 'active' : ''; ?>
          <li><a href="#" class="<?php echo $aktiv; ?>"><?php echo $key; ?></a></li>
        <?php endforeach ?>
      </ol>
    </div>
  </div>
</div>