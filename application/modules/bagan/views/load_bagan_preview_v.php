<div class="menu-tree slimScroll">
  <?php 
    $this->load->model('bagan/bagan_m');

    $alphabet = range('A', 'Z');

    // echo $alphabet[3]; // returns D

    $get_parent = $this->bagan_m->get_where_custom('class', 1, 'order')->result();
  ?>
  <ul>
  	<?php foreach ($get_parent as $keyparent => $valparent): ?>
      <li>
          <label"><strong style="font-size: 18px;"><?php echo $valparent->baganName; ?></strong></label>
          <?php $get_childfirst = $this->bagan_m->get_where_double_custom('class', 2, 'parentID', $valparent->baganID, 'order')->result(); ?>
          <ul>
          <?php foreach ($get_childfirst as $keychildfirst => $valchildfirst):?>
            <?php $romanic1 = $this->bagan_m->romanic_number($valchildfirst->order); ?>
              <li>
                  <label><?php echo $romanic1.". ".$valchildfirst->baganName; ?></label>
                <?php $get_childsecond = $this->bagan_m->get_where_double_custom('class', 3, 'parentID', $valchildfirst->baganID, 'order')->result(); ?>
                <?php $i=1; ?>
                <ul>
                <?php foreach ($get_childsecond as $keychildsecond => $valchildsecond):?>
                  <?php $number = $romanic1.'.'.$i; ?>
                    <li>
                        <label><?php echo $number.' '.$valchildsecond->baganName; ?></label>
                      <?php $get_childthird = $this->bagan_m->get_where_double_custom('class', 4, 'parentID', $valchildsecond->baganID, 'order')->result(); ?>
                      <?php $n=1; ?>
                      <ul>
                      <?php foreach ($get_childthird as $keychildthird => $valchildthird):?>
                          <li>
                              <label><?php echo $alphabet[$n-1].". ".$valchildthird->baganName; ?></label>
                          </li>
                      <?php $n++; ?>
                      <?php endforeach ?>
                      </ul>
                    </li>
                <?php $i++; ?>
                <?php endforeach ?>
                </ul>
              </li>
          <?php endforeach ?>
          </ul>
      </li>
	<?php endforeach ?>
  </ul>
</div>

<script>
  $(document).ready(function(){
    $('.slimScroll').slimScroll({
      color: '#F45D79',
      size: '10px',
      height: '700px',
      alwaysVisible: true
    });
  });
</script>