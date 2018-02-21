<div class="menu-tree slimScroll">
  <?php 
    $this->load->model('proker/proker_m');
    $this->load->model('templateproker/templateproker_m');

    $alphabet = range('A', 'Z');

    // echo $alphabet[3]; // returns D

    $get_parent = $this->templateproker_m->get_where_custom('class', 1, 'order')->result();
  ?>
  <ul>
  	<?php foreach ($get_parent as $keyparent => $valparent): ?>
      <li>
          <label"><strong style="font-size: 18px;">PROGRAM KERJA BAGIAN <?php echo $valparent->templateName; ?></strong></label>
          <?php $get_childfirst = $this->templateproker_m->get_where_double_custom('class', 2, 'parentID', $valparent->templateID, 'order')->result(); ?>
          <ul>
          <?php foreach ($get_childfirst as $keychildfirst => $valchildfirst):?>
            <?php $romanic1 = $this->templateproker_m->romanic_number($valchildfirst->order); ?>
              <li>
                  <label><?php echo $romanic1.". ".$valchildfirst->templateName; ?></label>
                <?php $get_prokercf = $this->proker_m->get_where_custom('templateID', $valchildfirst->templateID,'templateOrder')->result(); ?>
                <?php $pcf=1; ?>
                <?php if (!empty($get_prokercf)):?>
                <?php foreach ($get_prokercf as $keyprokercf => $valprokercf):?>
                  <?php 
                    if ($valprokercf->prokerType == "rutin"){
                      $tf = '[R]';
                      $cf = '#16E22E';
                    }else{
                      $tf = '[NR]';
                      $cf = '#DBE213';
                    }
                  ?>
                  <ul>
                    <li>
                      <p><a type="button" title="lihat" href="<?php echo site_url('proker/detail/').$valprokercf->prokerID; ?>" class="btn btn-xs btn-primary"><i class="fa fa-eye"></i></a><?php echo $pcf.". ";?><strong style="background: <?php echo $cf; ?>"><?php echo $tf; ?></strong> <?php echo $valprokercf->prokerName; ?><strong><?php echo '['.$valprokercf->prokerCategory.']'; ?></strong></p>
                    </li>
                  </ul>
                <?php $pcf++; ?>
                <?php endforeach ?>
                <?php endif ?>
                <?php $get_childsecond = $this->templateproker_m->get_where_double_custom('class', 3, 'parentID', $valchildfirst->templateID, 'order')->result(); ?>
                <?php $i=1; ?>
                <ul>
                <?php foreach ($get_childsecond as $keychildsecond => $valchildsecond):?>
                  <?php $number = $romanic1.'.'.$i; ?>
                    <li>
                        <label><?php echo $number.' '.$valchildsecond->templateName; ?></label>
                      <?php $get_prokercs = $this->proker_m->get_where_custom('templateID', $valchildsecond->templateID,'templateOrder')->result(); ?>
                      <?php $pcs=1; ?>
                      <?php if (!empty($get_prokercs)):?>
                        <ul>
                      <?php foreach ($get_prokercs as $keyprokercs => $valprokercs):?>
                        <?php 
                          if ($valprokercs->prokerType == "rutin"){
                            $ts = '[R]';
                            $cs = '#16E22E';
                          }else{
                            $ts = '[NR]';
                            $cs = '#DBE213';
                          }
                        ?>
                          <li>
                            <p>
                              <a type="button" title="lihat" href="<?php echo site_url('proker/detail/').$valprokercs->prokerID; ?>" class="btn btn-xs btn-primary"><i class="fa fa-eye"></i></a> <?php echo $pcs.". ";?><strong style="background: <?php echo $cs; ?>"><?php echo $ts; ?></strong> <?php echo $valprokercs->prokerName; ?><strong><?php echo '['.$valprokercs->prokerCategory.']'; ?></strong>
                            </p>
                          </li>
                      <?php $pcs++; ?>
                      <?php endforeach ?>
                        </ul>
                      <?php endif ?>
                      <?php $get_childthird = $this->templateproker_m->get_where_double_custom('class', 4, 'parentID', $valchildsecond->templateID, 'order')->result(); ?>
                      <?php $n=1; ?>
                      <ul>
                      <?php foreach ($get_childthird as $keychildthird => $valchildthird):?>
                          <li>
                              <label><?php echo $alphabet[$n-1].". ".$valchildthird->templateName; ?></label>
                            <?php $get_proker = $this->proker_m->get_where_custom('templateID', $valchildthird->templateID,'templateOrder')->result(); ?>
                            <?php $p=1; ?>
                            <?php if(!empty($get_proker)): ?>
                            <ul>
                            <?php foreach ($get_proker as $keyproker => $valproker):?>
                              <?php 
                                if ($valproker->prokerType == "rutin"){
                                  $t = '[R]';
                                  $c = '#16E22E';
                                }else{
                                  $t = '[NR]';
                                  $c = '#DBE213';
                                }
                              ?>
                                <li>
                                  <p>
                                    <a type="button" title="lihat" href="<?php echo site_url('proker/detail/').$valproker->prokerID; ?>" class="btn btn-xs btn-primary"><i class="fa fa-eye"></i></a> <?php echo $p.". ";?><strong style="background: <?php echo $c; ?>"><?php echo $t; ?></strong> <?php echo $valproker->prokerName; ?><strong><?php echo '['.$valproker->prokerCategory.']'; ?></strong>
                                  </p>
                                </li>
                            <?php $p++; ?>
                            <?php endforeach ?>
                            </ul>
                            <?php endif ?>
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