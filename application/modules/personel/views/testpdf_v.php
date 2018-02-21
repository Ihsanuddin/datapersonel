<!DOCTYPE html>
<html>
<head>
    <title>proker</title>
    <style>
        .table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        .table td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        /*tr:nth-child(even) {
            background-color: #dddddd;
        }*/
    </style>
</head>
<body>
    
        <?php 
            $this->load->model('mekanisme/mekanisme_m');

    $this->load->model('proker/proker_m');
    $this->load->model('templateproker/templateproker_m');

    $alphabet = range('A', 'Z');

    $get_parent = $this->templateproker_m->get_where_custom('class', 1, 'order')->result();
         ?>
    <?php foreach ($get_parent as $keyparent => $valparent){  ?>
    
      
          <label><strong style="font-size: 18px;">PROGRAM KERJA BAGIAN <?php echo $valparent->templateName; ?></strong></label><br>
          
        <?php  
          $get_childfirst = $this->templateproker_m->get_where_double_custom('class', 2, 'parentID', $valparent->templateID, 'order')->result(); 
          foreach ($get_childfirst as $keychildfirst => $valchildfirst){
            $romanic1 = $this->templateproker_m->romanic_number($valchildfirst->order); 
        ?>
              
                  <label><?php echo $romanic1.'. '.$valchildfirst->templateName; ?></label><br>
                <?php 
                $get_prokercf = $this->proker_m->get_where_custom('templateID', $valchildfirst->templateID,'templateOrder')->result(); 
                $pcf=1; 
                if (!empty($get_prokercf)){ ?>
                    
                <?php foreach ($get_prokercf as $keyprokercf => $valprokercf){
                    $mekanisme = $this->mekanisme_m->get_where_join('prokerID', $valprokercf->prokerID, 'mekanismeID');
                    $sql = "
                            SELECT 
                            `a`.`areaName`, SUM(`r`.`freq` * `r`.`qty` * `r`.`nominal`) AS `total`
                            FROM `rab` `r`
                            JOIN `outlet` `o` ON `o`.`outletID` = `r`.`outletID`
                            JOIN `area` `a` ON `a`.`areaID` = `o`.`areaID`
                            WHERE `r`.`prokerID` = '$valprokercf->prokerID'
                            GROUP BY `r`.`prokerID`, `a`.`areaID`
                        ";
                        $get_nominal = $this->mekanisme_m->_custom_query($sql)->result();
                ?>
                        
                          <span><?php echo $pcf.'. '.$valprokercf->prokerName; ?><strong> [<?php echo $valprokercf->prokerCategory; ?>]</strong></span><br>
                        
                            <table class="">
                                <tr>
                                    <td>Jenis Proker</td>
                                    <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                    <td><?php echo $valprokercf->prokerType; ?></td>
                                </tr>
                                <tr>
                                    <td>Nama Program</td>
                                    <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                    <td><?php echo $valprokercf->prokerName; ?></td>
                                </tr>
                                <tr>
                                    <td>Deskripsi Program</td>
                                    <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                    <td><?php echo $valprokercf->description; ?></td>
                                </tr>
                                <tr>
                                    <td>Tujuan</td>
                                    <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                    <td><?php echo $valprokercf->tujuan; ?></td>
                                </tr>
                            </table>
                        <br/>
                        <table class="table table-bordered table-striped table-custom">
                            <thead>
                                <tr>
                                    <th class="thstyle" style="vertical-align:middle;">Bentuk/Cara/ Mekanisme</th>
                                    <th class="thstyle" style="vertical-align:middle;">Kelengkapan/Material yg dibutuhkan</th>
                                    <th class="thstyle" style="vertical-align:middle;">PJ/PIC</th>
                                    <th class="thstyle" style="vertical-align:middle;">Waktu Pelaksanaan</th>
                                    <th class="thstyle" style="vertical-align:middle;">Target</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($mekanisme->result() as $key => $value){ ?>
                            <tr>
                                    <td colspan="5"><strong>Pembuat: <?php echo $value->areaName; ?></strong></td>   
                                </tr>
                                <tr>
                                    <td><?php echo $value->mekanisme; ?></td>
                                    <td><?php echo $value->kelengkapan; ?></td>
                                    <td><?php echo $value->pic; ?></td>
                                    <td><?php echo $value->waktu; ?></td>
                                    <td><?php echo $value->target; ?></td>
                                </tr>
                            <?php } ?>
                            </tbody>
                            </table>
                            <br>
                            <strong>Anggaran : </strong>
                            <table class="table table-bordered table-striped table-custom">
                                <thead>
                                    <tr>
                                        <td class="thstyle" style="vertical-align:middle;">Area kerja</td>
                                        <td class="thstyle" style="vertical-align:middle;">Nominal</td>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($get_nominal as $key2 => $val2){ ?>
                                <tr>
                                            <td width="60%"><?php echo $val2->areaName; ?></td>
                                            <td width="40%" align="right"><?php echo number_format($val2->total, "2", ",", "."); ?></td>
                                        </tr>
                               <?php } ?>
                                </tbody>
                            </table>
                            <hr>
                            <br><br>
                    <?php $pcf++; 
                    } ?>
                    
               <?php } ?> 
                
                <?php 
                $get_childsecond = $this->templateproker_m->get_where_double_custom('class', 3, 'parentID', $valchildfirst->templateID, 'order')->result(); 
                $i=1; 
                foreach ($get_childsecond as $keychildsecond => $valchildsecond){
                  $number = $romanic1.'.'.$i; 
                ?>
                    
                        <label><?php echo $number.' '.$valchildsecond->templateName; ?></label><br>
                    <?php
                      $get_prokercs = $this->proker_m->get_where_custom('templateID', $valchildsecond->templateID,'templateOrder')->result(); 
                      $pcs=1; 
                      if (!empty($get_prokercs)){
                    ?>
                        
                        <?php
                          foreach ($get_prokercs as $keyprokercs => $valprokercs){
                            $mekanisme2 = $this->mekanisme_m->get_where_join('prokerID', $valprokercs->prokerID, 'mekanismeID');
                            $sql = "
                                    SELECT 
                                    `a`.`areaName`, SUM(`r`.`freq` * `r`.`qty` * `r`.`nominal`) AS `total`
                                    FROM `rab` `r`
                                    JOIN `outlet` `o` ON `o`.`outletID` = `r`.`outletID`
                                    JOIN `area` `a` ON `a`.`areaID` = `o`.`areaID`
                                    WHERE `r`.`prokerID` = '$valprokercs->prokerID'
                                    GROUP BY `r`.`prokerID`, `a`.`areaID`
                                ";
                            $get_nominal2 = $this->mekanisme_m->_custom_query($sql)->result();
                        ?>
                              
                                <span><?php echo $pcs.'. '.$valprokercs->prokerName; ?><strong> [<?php echo $valprokercs->prokerCategory; ?>] </strong></span><br>
                              
                                <table class="">
                                    <tr>
                                        <td>Jenis Proker</td>
                                        <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                        <td><?php echo $valprokercs->prokerType; ?></td>
                                    </tr>
                                    <tr>
                                        <td>Nama Program</td>
                                        <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                        <td><?php echo $valprokercs->prokerName; ?></td>
                                    </tr>
                                    <tr>
                                        <td>Deskripsi Program</td>
                                        <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                        <td><?php echo $valprokercs->description; ?></td>
                                    </tr>
                                    <tr>
                                        <td>Tujuan</td>
                                        <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                        <td><?php echo $valprokercs->tujuan; ?></td>
                                    </tr>
                                </table>
                            <br/>
                            <table class="table table-bordered table-striped table-custom">
                                <thead>
                                    <tr>
                                        <th class="thstyle" style="vertical-align:middle;">Bentuk/Cara/ Mekanisme</th>
                                        <th class="thstyle" style="vertical-align:middle;">Kelengkapan/Material yg dibutuhkan</th>
                                        <th class="thstyle" style="vertical-align:middle;">PJ/PIC</th>
                                        <th class="thstyle" style="vertical-align:middle;">Waktu Pelaksanaan</th>
                                        <th class="thstyle" style="vertical-align:middle;">Target</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($mekanisme2->result() as $key => $value){ ?>
                                <tr>
                                        <td colspan="5"><strong>Pembuat: <?php echo $value->areaName; ?></strong></td>   
                                    </tr>
                                    <tr>
                                        <td><?php echo $value->mekanisme; ?></td>
                                        <td><?php echo $value->kelengkapan; ?></td>
                                        <td><?php echo $value->pic; ?></td>
                                        <td><?php echo $value->waktu; ?></td>
                                        <td><?php echo $value->target; ?></td>
                                    </tr>
                                <?php } ?>
                                </tbody>
                                </table>
                                <br>
                                <strong>Anggaran : </strong>
                                <table class="table table-bordered table-striped table-custom">
                                    <thead>
                                        <tr>
                                            <td class="thstyle" style="vertical-align:middle;">Area kerja</td>
                                            <td class="thstyle" style="vertical-align:middle;">Nominal</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <?php foreach ($get_nominal2 as $key2 => $val2){ ?>
                                    <tr>
                                                <td width="60%"><?php echo $val2->areaName; ?></td>
                                                <td width="40%" align="right"><?php echo number_format($val2->total, "2", ",", "."); ?></td>
                                            </tr>
                                    <?php } ?>
                                    </tbody>
                                </table>
                                <hr>
                                <br>
                        <?php  $pcs++; 
                          } ?>
                          
                    <?php  } ?>
                      
                    <?php 
                      $get_childthird = $this->templateproker_m->get_where_double_custom('class', 4, 'parentID', $valchildsecond->templateID, 'order')->result(); 
                      $n=1; 
                      foreach ($get_childthird as $keychildthird => $valchildthird){
                    ?>
                                
                            <label><?php echo $alphabet[$n-1].'. '.$valchildthird->templateName; ?></label><br>
                                    <?php $get_proker = $this->proker_m->get_where_custom('templateID', $valchildthird->templateID,'templateOrder')->result(); 
                            if (!empty($get_proker)) {
                                $p=1; ?>
                                
                            <?php 
                                foreach ($get_proker as $keyproker => $valproker){
                                    $mekanisme3 = $this->mekanisme_m->get_where_join('prokerID', $valproker->prokerID, 'mekanismeID');
                                    $sql = "
                                            SELECT 
                                            `a`.`areaName`, SUM(`r`.`freq` * `r`.`qty` * `r`.`nominal`) AS `total`
                                            FROM `rab` `r`
                                            JOIN `outlet` `o` ON `o`.`outletID` = `r`.`outletID`
                                            JOIN `area` `a` ON `a`.`areaID` = `o`.`areaID`
                                            WHERE `r`.`prokerID` = '$valproker->prokerID'
                                            GROUP BY `r`.`prokerID`, `a`.`areaID`
                                        ";
                                    $get_nominal3 = $this->mekanisme_m->_custom_query($sql)->result();
                            ?>
                                    
                                      <span><?php echo $p.'. '.$valproker->prokerName; ?><strong> [<?php echo $valproker->prokerCategory; ?>]</strong></span><br>
                                    
                                        <table class="">
                                            <tr>
                                                <td>Jenis Proker</td>
                                                <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                                <td><?php echo $valproker->prokerType; ?></td>
                                            </tr>
                                            <tr>
                                                <td>Nama Program</td>
                                                <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                                <td><?php echo $valproker->prokerName; ?></td>
                                            </tr>
                                            <tr>
                                                <td>Deskripsi Program</td>
                                                <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                                <td><?php echo $valproker->description; ?></td>
                                            </tr>
                                            <tr>
                                                <td>Tujuan</td>
                                                <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                                <td><?php echo $valproker->tujuan; ?></td>
                                            </tr>
                                        </table>
                                    <br>
                                    <table class="table table-bordered table-striped table-custom">
                                        <thead>
                                            <tr>
                                                <th class="thstyle" style="vertical-align:middle;">Bentuk/Cara/ Mekanisme</th>
                                                <th class="thstyle" style="vertical-align:middle;">Kelengkapan/Material yg dibutuhkan</th>
                                                <th class="thstyle" style="vertical-align:middle;">PJ/PIC</th>
                                                <th class="thstyle" style="vertical-align:middle;">Waktu Pelaksanaan</th>
                                                <th class="thstyle" style="vertical-align:middle;">Target</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                        foreach ($mekanisme3->result() as $key => $value){ ?>
                                        <tr>
                                                <td colspan="5"><strong>Pembuat: <?php echo $value->areaName; ?></strong></td>   
                                            </tr>
                                            <tr>
                                                <td><?php echo $value->mekanisme; ?></td>
                                                <td><?php echo $value->kelengkapan; ?></td>
                                                <td><?php echo $value->pic; ?></td>
                                                <td><?php echo $value->waktu; ?></td>
                                                <td><?php echo $value->target; ?></td>
                                            </tr>
                                       <?php } ?>
                                        </tbody>
                                        </table>
                                        
                                        <strong>Anggaran : </strong>
                                        <table class="table table-bordered table-striped table-custom">
                                            <thead>
                                                <tr>
                                                    <td class="thstyle" style="vertical-align:middle;">Area kerja</td>
                                                    <td class="thstyle" style="vertical-align:middle;">Nominal</td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <?php foreach ($get_nominal3 as $key2 => $val2){ ?>
                                            <tr>
                                                        <td width="60%"><?php echo $val2->areaName; ?></td>
                                                        <td width="40%" align="right"><?php echo number_format($val2->total, "2", ",", "."); ?></td>
                                                    </tr>
                                         <?php } ?>
                                            </tbody>
                                        </table><br>
                              <?php  $p++; 
                                } ?>
                          <?php  }  ?>   
                    <?php $n++; 
                      } ?>           
               <?php $i++; 
                } ?>  
         <?php } ?>
   <?php } ?> 
    </body>
</html>