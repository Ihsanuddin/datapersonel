<?php 
$mpdf = new mPDF('c',  // mode - default ''
                 $format,    // format - A4, for example, default ''
                 $font_size,     // font size - default 0
                 $font_family,    // default font family
                 $margin_left,    // margin_left
                 $margin_right,    // margin right
                 $margin_top,     // margin top
                 $margin_bottom,    // margin bottom
                 $margin_header,     // margin header
                 $margin_footer,     // margin footer
                 'L');  //
$html = '';
$this->load->model('mekanisme/mekanisme_m');

    $this->load->model('proker/proker_m');
    $this->load->model('templateproker/templateproker_m');

    $alphabet = range('A', 'Z');

    $get_parent = $this->templateproker_m->get_where_custom('class', 1, 'order')->result();
$html ='<!DOCTYPE html>
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
            border: 1px solid #000000;
            text-align: left;
            padding: 8px;
        }

        /*tr:nth-child(even) {
            background-color: #dddddd;
        }*/
    </style>
</head>
<body>';
     foreach ($get_parent as $keyparent => $valparent){ 
          $html .='<label><strong style="font-size: 18px;">PROGRAM KERJA BAGIAN '.$valparent->templateName.'</strong></label><br>';
          
          
          $get_childfirst = $this->templateproker_m->get_where_double_custom('class', 2, 'parentID', $valparent->templateID, 'order')->result(); 
          foreach ($get_childfirst as $keychildfirst => $valchildfirst){
            $romanic1 = $this->templateproker_m->romanic_number($valchildfirst->order); 
                $html .='<label><strong>'.$romanic1.'. '.$valchildfirst->templateName.'</strong></label><br>';
                 
                $get_prokercf = $this->proker_m->get_where_custom('templateID', $valchildfirst->templateID,'templateOrder')->result(); 
                $pcf=1; 
                if (!empty($get_prokercf)){ 
                    
                 foreach ($get_prokercf as $keyprokercf => $valprokercf){
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
                
                        $html .='<span>'.$pcf.'. '.$valprokercf->prokerName.'<strong> ['.$valprokercf->prokerCategory.']</strong></span><br>
                        
                            <table class="">
                                <tr>
                                    <td>Jenis Proker</td>
                                    <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                    <td>'.$valprokercf->prokerType.'</td>
                                </tr>
                                <tr>
                                    <td>Nama Program</td>
                                    <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                    <td>'.$valprokercf->prokerName.'</td>
                                </tr>
                                <tr>
                                    <td>Deskripsi Program</td>
                                    <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                    <td>'.$valprokercf->description.'</td>
                                </tr>
                                <tr>
                                    <td>Tujuan</td>
                                    <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                    <td>'.$valprokercf->tujuan.'</td>
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
                            <tbody>';
                             foreach ($mekanisme->result() as $key => $value){ 
                            $html .='<tr>
                                    <td colspan="5"><strong>Pembuat: '.$value->areaName.'</strong></td>   
                                </tr>
                                <tr>
                                    <td>'.$value->mekanisme.'</td>
                                    <td>'.$value->kelengkapan.'</td>
                                    <td>'.$value->pic.'</td>
                                    <td>'.$value->waktu.'</td>
                                    <td>'.$value->target.'</td>
                                </tr>';
                             } 
                            $html .='</tbody>
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
                                <tbody>';
                                 foreach ($get_nominal as $key2 => $val2){ 
                                $html .='<tr>
                                            <td width="60%">'.$val2->areaName.'</td>
                                            <td width="40%" align="right">'.number_format($val2->total, "2", ",", ".").'</td>
                                        </tr>';
                                } 
                                $html .='
                                </tbody>
                            </table>
                            <hr>
                            <br><br>';
                     $pcf++; 
                    } 
                }  
                
                $get_childsecond = $this->templateproker_m->get_where_double_custom('class', 3, 'parentID', $valchildfirst->templateID, 'order')->result(); 
                $i=1; 
                foreach ($get_childsecond as $keychildsecond => $valchildsecond){
                  $number = $romanic1.'.'.$i; 
                
                    $html .='<label><strong>'.$number.' '.$valchildsecond->templateName.'</strong></label><br>';
                    
                      $get_prokercs = $this->proker_m->get_where_custom('templateID', $valchildsecond->templateID,'templateOrder')->result(); 
                      $pcs=1; 
                      if (!empty($get_prokercs)){
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
                        
                            $html .='<span>'.$pcs.'. '.$valprokercs->prokerName.'<strong> ['.$valprokercs->prokerCategory.'] </strong></span><br>
                                <table class="">
                                    <tr>
                                        <td>Jenis Proker</td>
                                        <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                        <td>'.$valprokercs->prokerType.'</td>
                                    </tr>
                                    <tr>
                                        <td>Nama Program</td>
                                        <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                        <td>'.$valprokercs->prokerName.'</td>
                                    </tr>
                                    <tr>
                                        <td>Deskripsi Program</td>
                                        <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                        <td>'.$valprokercs->description.'</td>
                                    </tr>
                                    <tr>
                                        <td>Tujuan</td>
                                        <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                        <td>'.$valprokercs->tujuan.'</td>
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
                                <tbody>';
                                 foreach ($mekanisme2->result() as $key => $value){ 
                                $html .='<tr>
                                        <td colspan="5"><strong>Pembuat: '.$value->areaName.'</strong></td>   
                                    </tr>
                                    <tr>
                                        <td>'.$value->mekanisme.'</td>
                                        <td>'.$value->kelengkapan.'</td>
                                        <td>'.$value->pic.'</td>
                                        <td>'.$value->waktu.'</td>
                                        <td>'.$value->target.'</td>
                                    </tr>';
                                 } 
                                $html .='</tbody>
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
                                    <tbody>';
                                     foreach ($get_nominal2 as $key2 => $val2){ 
                                    $html .='<tr>
                                                <td width="60%">'.$val2->areaName.'</td>
                                                <td width="40%" align="right">'.number_format($val2->total, "2", ",", ".").'</td>
                                            </tr>';
                                     } 
                                    $html .='</tbody>
                                </table>
                                <hr>
                                <br>';
                          $pcs++; 
                          } 
                          
                      } 
                      
                     
                      $get_childthird = $this->templateproker_m->get_where_double_custom('class', 4, 'parentID', $valchildsecond->templateID, 'order')->result(); 
                      $n=1; 
                      foreach ($get_childthird as $keychildthird => $valchildthird){
                    
                                
                            $html .='<label><strong>'.$alphabet[$n-1].'. '.$valchildthird->templateName.'</strong></label><br>';
                                     $get_proker = $this->proker_m->get_where_custom('templateID', $valchildthird->templateID,'templateOrder')->result(); 
                            if (!empty($get_proker)) {
                                $p=1;
                                
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
                            
                                    $html .='<span>'.$p.'. '.$valproker->prokerName.'<strong> ['.$valproker->prokerCategory.']</strong></span><br>
                                    
                                        <table class="">
                                            <tr>
                                                <td>Jenis Proker</td>
                                                <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                                <td>'.$valproker->prokerType.'</td>
                                            </tr>
                                            <tr>
                                                <td>Nama Program</td>
                                                <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                                <td>'.$valproker->prokerName.'</td>
                                            </tr>
                                            <tr>
                                                <td>Deskripsi Program</td>
                                                <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                                <td>'.$valproker->description.'</td>
                                            </tr>
                                            <tr>
                                                <td>Tujuan</td>
                                                <td>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
                                                <td>'.$valproker->tujuan.'</td>
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
                                        <tbody>';
                                            
                                        foreach ($mekanisme3->result() as $key => $value){ 
                                        $html .='<tr>
                                                <td colspan="5"><strong>Pembuat: '.$value->areaName.'</strong></td>   
                                            </tr>
                                            <tr>
                                                <td>'.$value->mekanisme.'</td>
                                                <td>'.$value->kelengkapan.'</td>
                                                <td>'.$value->pic.'</td>
                                                <td>'.$value->waktu.'</td>
                                                <td>'.$value->target.'</td>
                                            </tr>';
                                        } 
                                        $html .='</tbody>
                                        </table>
                                        
                                        <strong>Anggaran : </strong>
                                        <table class="table table-bordered table-striped table-custom">
                                            <thead>
                                                <tr>
                                                    <td class="thstyle" style="vertical-align:middle;">Area kerja</td>
                                                    <td class="thstyle" style="vertical-align:middle;">Nominal</td>
                                                </tr>
                                            </thead>
                                            <tbody>';
                                             foreach ($get_nominal3 as $key2 => $val2){ 
                                            $html .='<tr>
                                                        <td width="60%">'.$val2->areaName.'</td>
                                                        <td width="40%" align="right">'.number_format($val2->total, "2", ",", ".").'</td>
                                                    </tr>';
                                            } 
                                            $html .='</tbody>
                                        </table><br>';
                                $p++; 
                                } 
                            }     
                     $n++; 
                      }            
                $i++; 
                }   
          } 
    }   
$html .='
    </body>
</html>';
$mpdf->setFooter('{PAGENO}');
$mpdf->WriteHTML($html);
$mpdf->Output();
?>
