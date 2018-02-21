<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Owntask {

    /*
      * Function updateperkedel
      *
      * Function ini berguna untuk meng update berita acara pembuatan perkedel ke dalam masuk pagi lshp4 beserta tidak layaknya
      * @outletID (int) id outlet
      * @usedDate (date) tanggal berita acara
      * @userID (int) id user
      *
    */

    public function updateperkedel($outletID='', $usedDate='', $userID = 0)
    {
      $CI =& get_instance();
      $CI->load->model('detaillshp4/detaillshp4_m');
      $CI->load->model('lshp4/lshp4_m');

      // Get produklshp4 perkedel
      $sql2 = "
        SELECT * FROM `productrecipeslshp4` pr
          JOIN `outletproductlshp4` op ON `op`.`productRecipeslshp4ID` = `pr`.`productRecipeslshp4ID`
          JOIN `productslshp4` p ON `p`.`productlshp4ID` = `pr`.`productlshp4ID`
          WHERE `p`.`productlshp4Name` = 'Perkedel'
            AND `op`.`outletID` = '$outletID'
      ";

      $get_perkedel = $CI->detaillshp4_m->_custom_query($sql2);

      // Memastikan outlet tersebut memiliki productlshp4 item perkedel
      if ($get_perkedel->num_rows() > 0) {

        // SQL get qty perkedel
        $sql1 = "
          SELECT IFNULL(SUM(`dbnPerkedelQty`), 0) as qtyPerkedel FROM `dbnperkedel_v`
          WHERE `outletID` = '$outletID'
            AND `dbnUsedDate` = '$usedDate'
        ";

        // Qty Perkedel
        $qtyPerkedel = $CI->detaillshp4_m->_custom_query($sql1)->row('qtyPerkedel');

        // SQL get qty perkedel tidak layak
        // Jika satuan perkedel porsi maka akan dikalikan 3
        $sql3 = "
          SELECT IFNULL(SUM(CASE WHEN `dbnUnit` = 'porsi' THEN `dbnQty` * 3 ELSE `dbnQty` END), 0) as totalQtyTdkLayk
          FROM `detailbastlpnew`
          WHERE `outletID` = '$outletID'
            AND `dbnJenis` = 'menu'
            AND `dbnUsedDate` = '$usedDate'
            AND `dbnName` IN('Perkedel Ayam (goreng)','Perkedel Ayam (bakar)')
        ";

        // Qty Perkedel Tidak Layak
        $totalQtyTdkLayk = $CI->detaillshp4_m->_custom_query($sql3)->row('totalQtyTdkLayk');

        // Get Perkedel detaillshp4
        $get_detail_perkedel = $CI->detaillshp4_m->get_triple_where('outletID', $outletID, 'detaillshp4UsedDate', $usedDate, 'detaillshp4Name', 'Perkedel');

        if ($get_detail_perkedel->num_rows() == 0) {
          // Jika perkedel belum ada di detaillshp4

          $num_rows_lshp4 = $CI->lshp4_m->get_where_double_custom('outletID', $outletID, 'lshp4UsedDate', $usedDate, 'outletID')->num_rows();

          // Pengecekan apakah LSHP-4 untuk tanggal guna telah tersedia / telah dibuat atau belum.
          if ($num_rows_lshp4 < 1) {
            $data2 = array(
              'lshp4UsedDate' => $usedDate,
              'outletID' => $outletID,
              'createdDate' => date('Y-m-d H:i:s'),
              'createdUserID' => $userID
            );

            $CI->lshp4_m->_insert($data2);
          }

          // Get lshp4ID
          $lshp4ID = $CI->lshp4_m->get_where_double_custom('outletID', $outletID, 'lshp4UsedDate', $usedDate, 'lshp4ID')->row('lshp4ID');

          // Get product lshp4
          $data = array(
            'lshp4ID' => $lshp4ID,
            'outletID' => $outletID,
            'productRecipeslshp4ID' => $get_perkedel->row('productRecipeslshp4ID'),
            'productlshp4ID' => $get_perkedel->row('productlshp4ID'),
            'detaillshp4Code' => $get_perkedel->row('productlshp4Code'),
            'detaillshp4Name' => $get_perkedel->row('productlshp4Name'),
            'detaillshp4Jenis' => $get_perkedel->row('productlshp4Jenis'),
            'detaillshp4UsedDate' => $usedDate,
            'detaillshp4QtyPgi' => $qtyPerkedel,
            'detaillshp4QtyTmb' => 0,
            'detaillshp4QtyLyk' => 0,
            'detaillshp4QtyTdkLyk' => $totalQtyTdkLayk,
            'detaillshp4QtyUnit' => $get_perkedel->row('productlshp4Unit'),
            'createdDate' => date('Y-m-d H:i:s'),
            'createdUserID' => $userID
          );

          $CI->detaillshp4_m->_insert($data);
        } else {
          // Get detaillshp4ID
          $detaillshp4ID = $CI->detaillshp4_m->get_triple_where('outletID', $outletID, 'detaillshp4UsedDate', $usedDate, 'detaillshp4Name', 'Perkedel')->row('detaillshp4ID');

          $data = array(
            'detaillshp4QtyPgi' => $qtyPerkedel,
            'detaillshp4QtyTdkLyk' => $totalQtyTdkLayk,
            'createdDate' => date('Y-m-d H:i:s'),
            'createdUserID' => $userID
          );

          $CI->detaillshp4_m->_update($detaillshp4ID, $data);
        }
      }
    }

    /*
      * Function updatebarangjadi
      *
      * Function ini berguna untuk meng update berita acara sisa tidak layak Barang Jadi ke dalam tidak layak lshp4
      * @outletID (int) id outlet
      * @usedDate (date) tanggal berita acara
      * @userID (int) id user
      *
    */

    public function updatebarangjadi($outletID='', $usedDate='', $userID = 0)
    {
      $CI =& get_instance();
      $CI->load->model('detailbastlpnew/detailbastlpnew_m');
      $CI->load->model('productrecipeslshp4/productrecipeslshp4_m');
      $CI->load->model('detaillshp4/detaillshp4_m');
      $CI->load->model('lshp4/lshp4_m');

      $num_rows_lshp4 = $CI->lshp4_m->get_where_double_custom('outletID', $outletID, 'lshp4UsedDate', $usedDate, 'outletID')->num_rows();

      // Pengecekan apakah LSHP-4 untuk tanggal guna telah tersedia / telah dibuat atau belum.
      if ($num_rows_lshp4 < 1) {
        $data2 = array(
          'lshp4UsedDate' => $usedDate,
          'outletID' => $outletID,
          'createdDate' => date('Y-m-d H:i:s'),
          'createdUserID' => $userID
        );

        $CI->lshp4_m->_insert($data2);
      }

      // Get lshp4ID
      $lshp4ID = $CI->lshp4_m->get_where_double_custom('outletID', $outletID, 'lshp4UsedDate', $usedDate, 'lshp4ID')->row('lshp4ID');

      // START KOREK
      $nameKorek = 'Sambal Korek Brambang';
      $get_korek = $CI->productrecipeslshp4_m->get_for_task($outletID, $nameKorek);

      // Memastikan outlet tersebut memiliki productlshp4 item
      if ($get_korek->num_rows() > 0) {

        // Sambal Korek Brambang
        $qtyKorek = $CI->detailbastlpnew_m->get_for_task($outletID, $usedDate, $nameKorek, 15)->row('qty');

        // Get Korek detaillshp4
        $get_detail_korek = $CI->detaillshp4_m->get_triple_where('outletID', $outletID, 'detaillshp4UsedDate', $usedDate, 'detaillshp4Name', $nameKorek);

        if ($get_detail_korek->num_rows() == 0) {

          $data = array(
            'lshp4ID' => $lshp4ID,
            'outletID' => $outletID,
            'productRecipeslshp4ID' => $get_korek->row('productRecipeslshp4ID'),
            'productlshp4ID' => $get_korek->row('productlshp4ID'),
            'detaillshp4Code' => $get_korek->row('productlshp4Code'),
            'detaillshp4Name' => $get_korek->row('productlshp4Name'),
            'detaillshp4Jenis' => $get_korek->row('productlshp4Jenis'),
            'detaillshp4UsedDate' => $usedDate,
            'detaillshp4QtyPgi' => 0,
            'detaillshp4QtyTmb' => 0,
            'detaillshp4QtyLyk' => 0,
            'detaillshp4QtyTdkLyk' => $qtyKorek,
            'detaillshp4QtyUnit' => $get_korek->row('productlshp4Unit'),
            'createdDate' => date('Y-m-d H:i:s'),
            'createdUserID' => $userID
          );

          $CI->detaillshp4_m->_insert($data);
        }else{
          // Get detaillshp4ID
          $detaillshp4ID = $CI->detaillshp4_m->get_triple_where('outletID', $outletID, 'detaillshp4UsedDate', $usedDate, 'detaillshp4Name', $nameKorek)->row('detaillshp4ID');

          $data = array(
            'detaillshp4QtyTdkLyk' => $qtyKorek,
            'createdDate' => date('Y-m-d H:i:s'),
            'createdUserID' => $userID
          );

          $CI->detaillshp4_m->_update($detaillshp4ID, $data);
        }
      }
      // END KOREK

      // START TERI
      $nameTeri = 'Sambal Teri';
      $get_teri = $CI->productrecipeslshp4_m->get_for_task($outletID, $nameTeri);

      // Memastikan outlet tersebut memiliki productlshp4 item
      if ($get_teri->num_rows() > 0) {

        // Sambal Teri
        $qtyTeri = $CI->detailbastlpnew_m->get_for_task($outletID, $usedDate, 'Sambal Teri', 30)->row('qty');

        // Get Korek detaillshp4
        $get_detail_korek = $CI->detaillshp4_m->get_triple_where('outletID', $outletID, 'detaillshp4UsedDate', $usedDate, 'detaillshp4Name', $nameTeri);

        if ($get_detail_korek->num_rows() == 0) {

          $data = array(
            'lshp4ID' => $lshp4ID,
            'outletID' => $outletID,
            'productRecipeslshp4ID' => $get_teri->row('productRecipeslshp4ID'),
            'productlshp4ID' => $get_teri->row('productlshp4ID'),
            'detaillshp4Code' => $get_teri->row('productlshp4Code'),
            'detaillshp4Name' => $get_teri->row('productlshp4Name'),
            'detaillshp4Jenis' => $get_teri->row('productlshp4Jenis'),
            'detaillshp4UsedDate' => $usedDate,
            'detaillshp4QtyPgi' => 0,
            'detaillshp4QtyTmb' => 0,
            'detaillshp4QtyLyk' => 0,
            'detaillshp4QtyTdkLyk' => $qtyTeri,
            'detaillshp4QtyUnit' => $get_teri->row('productlshp4Unit'),
            'createdDate' => date('Y-m-d H:i:s'),
            'createdUserID' => $userID
          );

          $CI->detaillshp4_m->_insert($data);
        }else{
          // Get detaillshp4ID
          $detaillshp4ID = $CI->detaillshp4_m->get_triple_where('outletID', $outletID, 'detaillshp4UsedDate', $usedDate, 'detaillshp4Name', $nameTeri)->row('detaillshp4ID');

          $data = array(
            'detaillshp4QtyTdkLyk' => $qtyTeri,
            'createdDate' => date('Y-m-d H:i:s'),
            'createdUserID' => $userID
          );

          $CI->detaillshp4_m->_update($detaillshp4ID, $data);
        }
      }
      // END TERI

      // START BAJAK
      $nameBajak = 'Sambal Bajak';
      $get_bajak = $CI->productrecipeslshp4_m->get_for_task($outletID, $nameBajak);

      // Memastikan outlet tersebut memiliki productlshp4 item
      if ($get_bajak->num_rows() > 0) {

        // Sambal Bajak
        $qtyBajak = $CI->detailbastlpnew_m->get_for_task($outletID, $usedDate, 'Sambal Bajak', 30)->row('qty');

        // Get Korek detaillshp4
        $get_detail_korek = $CI->detaillshp4_m->get_triple_where('outletID', $outletID, 'detaillshp4UsedDate', $usedDate, 'detaillshp4Name', $nameBajak);

        if ($get_detail_korek->num_rows() == 0) {

          $data = array(
            'lshp4ID' => $lshp4ID,
            'outletID' => $outletID,
            'productRecipeslshp4ID' => $get_bajak->row('productRecipeslshp4ID'),
            'productlshp4ID' => $get_bajak->row('productlshp4ID'),
            'detaillshp4Code' => $get_bajak->row('productlshp4Code'),
            'detaillshp4Name' => $get_bajak->row('productlshp4Name'),
            'detaillshp4Jenis' => $get_bajak->row('productlshp4Jenis'),
            'detaillshp4UsedDate' => $usedDate,
            'detaillshp4QtyPgi' => 0,
            'detaillshp4QtyTmb' => 0,
            'detaillshp4QtyLyk' => 0,
            'detaillshp4QtyTdkLyk' => $qtyBajak,
            'detaillshp4QtyUnit' => $get_bajak->row('productlshp4Unit'),
            'createdDate' => date('Y-m-d H:i:s'),
            'createdUserID' => $userID
          );

          $CI->detaillshp4_m->_insert($data);
        }else{
          // Get detaillshp4ID
          $detaillshp4ID = $CI->detaillshp4_m->get_triple_where('outletID', $outletID, 'detaillshp4UsedDate', $usedDate, 'detaillshp4Name', $nameBajak)->row('detaillshp4ID');

          $data = array(
            'detaillshp4QtyTdkLyk' => $qtyBajak,
            'createdDate' => date('Y-m-d H:i:s'),
            'createdUserID' => $userID
          );

          $CI->detaillshp4_m->_update($detaillshp4ID, $data);
        }
      }
      // END BAJAK

      // START GUDANGAN
      $nameGudangan = 'Sambal Gudangan';
      $get_gudangan = $CI->productrecipeslshp4_m->get_for_task($outletID, $nameGudangan);

      // Memastikan outlet tersebut memiliki productlshp4 item
      if ($get_gudangan->num_rows() > 0) {

        // Sambal Gudangan
        $qtyGudangan = $CI->detailbastlpnew_m->get_for_task($outletID, $usedDate, 'Sambal Gudangan', 40)->row('qty');

        // Get Korek detaillshp4
        $get_detail_korek = $CI->detaillshp4_m->get_triple_where('outletID', $outletID, 'detaillshp4UsedDate', $usedDate, 'detaillshp4Name', $nameGudangan);

        if ($get_detail_korek->num_rows() == 0) {

          $data = array(
            'lshp4ID' => $lshp4ID,
            'outletID' => $outletID,
            'productRecipeslshp4ID' => $get_gudangan->row('productRecipeslshp4ID'),
            'productlshp4ID' => $get_gudangan->row('productlshp4ID'),
            'detaillshp4Code' => $get_gudangan->row('productlshp4Code'),
            'detaillshp4Name' => $get_gudangan->row('productlshp4Name'),
            'detaillshp4Jenis' => $get_gudangan->row('productlshp4Jenis'),
            'detaillshp4UsedDate' => $usedDate,
            'detaillshp4QtyPgi' => 0,
            'detaillshp4QtyTmb' => 0,
            'detaillshp4QtyLyk' => 0,
            'detaillshp4QtyTdkLyk' => $qtyGudangan,
            'detaillshp4QtyUnit' => $get_gudangan->row('productlshp4Unit'),
            'createdDate' => date('Y-m-d H:i:s'),
            'createdUserID' => $userID
          );

          $CI->detaillshp4_m->_insert($data);
        }else{
          // Get detaillshp4ID
          $detaillshp4ID = $CI->detaillshp4_m->get_triple_where('outletID', $outletID, 'detaillshp4UsedDate', $usedDate, 'detaillshp4Name', $nameGudangan)->row('detaillshp4ID');

          $data = array(
            'detaillshp4QtyTdkLyk' => $qtyGudangan,
            'createdDate' => date('Y-m-d H:i:s'),
            'createdUserID' => $userID
          );

          $CI->detaillshp4_m->_update($detaillshp4ID, $data);
        }
      }
      // END GUDANGAN

      // START PLENCING
      $namePlencing = 'Sambal Plencing';
      $get_plencing = $CI->productrecipeslshp4_m->get_for_task($outletID, $namePlencing);

      // Memastikan outlet tersebut memiliki productlshp4 item
      if ($get_plencing->num_rows() > 0) {

        // Sambal Plencing
        $qtyPlencing = $CI->detailbastlpnew_m->get_for_task($outletID, $usedDate, 'Sambal Plencing', 30)->row('qty');

        // Get Korek detaillshp4
        $get_detail_korek = $CI->detaillshp4_m->get_triple_where('outletID', $outletID, 'detaillshp4UsedDate', $usedDate, 'detaillshp4Name', $namePlencing);

        if ($get_detail_korek->num_rows() == 0) {

          $data = array(
            'lshp4ID' => $lshp4ID,
            'outletID' => $outletID,
            'productRecipeslshp4ID' => $get_plencing->row('productRecipeslshp4ID'),
            'productlshp4ID' => $get_plencing->row('productlshp4ID'),
            'detaillshp4Code' => $get_plencing->row('productlshp4Code'),
            'detaillshp4Name' => $get_plencing->row('productlshp4Name'),
            'detaillshp4Jenis' => $get_plencing->row('productlshp4Jenis'),
            'detaillshp4UsedDate' => $usedDate,
            'detaillshp4QtyPgi' => 0,
            'detaillshp4QtyTmb' => 0,
            'detaillshp4QtyLyk' => 0,
            'detaillshp4QtyTdkLyk' => $qtyPlencing,
            'detaillshp4QtyUnit' => $get_plencing->row('productlshp4Unit'),
            'createdDate' => date('Y-m-d H:i:s'),
            'createdUserID' => $userID
          );

          $CI->detaillshp4_m->_insert($data);
        }else{
          // Get detaillshp4ID
          $detaillshp4ID = $CI->detaillshp4_m->get_triple_where('outletID', $outletID, 'detaillshp4UsedDate', $usedDate, 'detaillshp4Name', $namePlencing)->row('detaillshp4ID');

          $data = array(
            'detaillshp4QtyTdkLyk' => $qtyPlencing,
            'createdDate' => date('Y-m-d H:i:s'),
            'createdUserID' => $userID
          );

          $CI->detaillshp4_m->_update($detaillshp4ID, $data);
        }
      }
      // END PLENCING


      // START ASEM
      $nameAsem = 'Sayur Asem';
      $get_asem = $CI->productrecipeslshp4_m->get_for_task($outletID, $nameAsem);

      // Memastikan outlet tersebut memiliki productlshp4 item
      if ($get_asem->num_rows() > 0) {

        // Sayur Asem
        $qtyAsem = $CI->detailbastlpnew_m->get_for_task($outletID, $usedDate, 'Sayur Asem', 30)->row('qty');

        // Get Korek detaillshp4
        $get_detail_korek = $CI->detaillshp4_m->get_triple_where('outletID', $outletID, 'detaillshp4UsedDate', $usedDate, 'detaillshp4Name', $nameAsem);

        if ($get_detail_korek->num_rows() == 0) {

          $data = array(
            'lshp4ID' => $lshp4ID,
            'outletID' => $outletID,
            'productRecipeslshp4ID' => $get_asem->row('productRecipeslshp4ID'),
            'productlshp4ID' => $get_asem->row('productlshp4ID'),
            'detaillshp4Code' => $get_asem->row('productlshp4Code'),
            'detaillshp4Name' => $get_asem->row('productlshp4Name'),
            'detaillshp4Jenis' => $get_asem->row('productlshp4Jenis'),
            'detaillshp4UsedDate' => $usedDate,
            'detaillshp4QtyPgi' => 0,
            'detaillshp4QtyTmb' => 0,
            'detaillshp4QtyLyk' => 0,
            'detaillshp4QtyTdkLyk' => $qtyAsem,
            'detaillshp4QtyUnit' => $get_asem->row('productlshp4Unit'),
            'createdDate' => date('Y-m-d H:i:s'),
            'createdUserID' => $userID
          );

          $CI->detaillshp4_m->_insert($data);
        }else{
          // Get detaillshp4ID
          $detaillshp4ID = $CI->detaillshp4_m->get_triple_where('outletID', $outletID, 'detaillshp4UsedDate', $usedDate, 'detaillshp4Name', $nameAsem)->row('detaillshp4ID');

          $data = array(
            'detaillshp4QtyTdkLyk' => $qtyAsem,
            'createdDate' => date('Y-m-d H:i:s'),
            'createdUserID' => $userID
          );

          $CI->detaillshp4_m->_update($detaillshp4ID, $data);
        }
      }
      // END ASEM
    }

    /*
      * Function rekapharga
      * Fungsi ini berguna untuk merekap harga dari laporan belanja
      * @outletID (int) id outlet
      * @usedDate (date) tanggal laporan belanja
      * @userID (int) id user
      * @jenis (varchar) jenis belanja harian, mingguan_produksi, mingguan_operasional, ecer_otbg dan ecer_otbh
    */

    public function rekapharga($outletID='', $usedDate='', $jenis='')
    {
      $CI =& get_instance();
      $CI->load->model('rekapharga/rekapharga_m');
      $CI->load->model('ingredients/ingredients_m');

      switch ($jenis) {
          case 'harian':
              $sql = "
                SELECT `ings`.`ingredientID`, `ings`.`ingCode`, `ings`.`ingName`,
                       IFNULL(`detaillttbbh_v`.`detaillttbbhChtQtyQty`, 0) qtyQty,
                       `detaillttbbh_v`.`detaillttbbhChtQtyUnit` qtyUnit,
                       IFNULL(`detaillttbbh_v`.`detaillttbbhChtPorsiQty`, 0) porsiQty,
                       `detaillttbbh_v`.`detaillttbbhChtPorsiUnit` porsiUnit,
                       (IFNULL(`groupbydetailbelanja_v`.`sumCash`, 0) + IFNULL(`groupbydetailbelanja_v`.`sumDebit`, 0)) / (IFNULL(`detaillttbbh_v`.`detaillttbbhChtQtyQty`, 0)) harga,
                       IFNULL(`groupbydetailbelanja_v`.`sumCash`, 0) tunai,
                       IFNULL(`groupbydetailbelanja_v`.`sumDebit`, 0) hutang,
                       IFNULL(`groupbydetailbelanja_v`.`sumCash`, 0) + IFNULL(`groupbydetailbelanja_v`.`sumDebit`, 0) subtotal
                  FROM
                  (
                    SELECT `ingredientID`, `detailbelanjaCode` AS ingCode, `detailbelanjaName` AS ingName
                      FROM `groupbydetailbelanja_v`
                      WHERE `outletID` = '$outletID'
                      AND `detailbelanjaUsedDate` = '$usedDate'
                      AND `detailbelanjaType` = 'harian'
                    UNION
                    SELECT `ingredientID`, `detaillttbbhCode`AS ingCode, `detaillttbbhName`AS ingName
                      FROM `detaillttbbh_v`
                      WHERE `outletID` = '$outletID'
                      AND `detaillttbbhUsedDate` = '$usedDate'
                  ) ings
                  LEFT JOIN `groupbydetailbelanja_v`
                    ON `ings`.`ingredientID` = `groupbydetailbelanja_v`.`ingredientID`
                    AND `groupbydetailbelanja_v`.`outletID` = '$outletID'
                    AND `groupbydetailbelanja_v`.`detailbelanjaUsedDate` = '$usedDate'
                    AND `groupbydetailbelanja_v`.`detailbelanjaType` = 'harian'
                  LEFT JOIN `detaillttbbh_v`
                    ON `ings`.`ingredientID` = `detaillttbbh_v`.`ingredientID`
                    AND `detaillttbbh_v`.`outletID` = '$outletID'
                    AND `detaillttbbh_v`.`detaillttbbhUsedDate` = '$usedDate'
                ORDER BY `ings`.`ingCode`
              ";

              $get_history = $CI->rekapharga_m->_custom_query($sql);

              $rekap = $CI->rekapharga_m->get_triple_where('outletID', $outletID, 'usedDate', $usedDate, 'jenis', $jenis);

              if ($rekap->num_rows() > 0) {
                $CI->rekapharga_m->_delete_triple_where('outletID', $outletID, 'usedDate', $usedDate, 'jenis', $jenis);
              }

              if ($get_history->num_rows() > 0) {
                foreach ($get_history->result() as $key => $val) {
                  $ing = $CI->ingredients_m->get_where($val->ingredientID);

                  $data[] = array(
                    'outletID' => $outletID,
                    'usedDate' => $usedDate,
                    'jenis' => $jenis,
                    'ingredientID' => $val->ingredientID,
                    'ingredientCode' => $val->ingCode,
                    'ingredientName' => $val->ingName,
                    'ingredientCategory' => $ing->row('ingredientCategory'),
                    'qtyQtyBersih' => $val->qtyQty,
                    'qtyUnit' => $val->qtyUnit,
                    'porsiQty' => $val->porsiQty,
                    'porsiUnit' => $val->porsiUnit,
                    'tunai' => $val->tunai,
                    'hutang' => $val->hutang,
                    'subtotal' => $val->subtotal,
                    'lastUpdate' => date('Y-m-d H:i:s'),
                  );
                }

                $CI->rekapharga_m->_insert_batch($data);
              }

              // dump($CI->rekapharga_m->get_triple_where('outletID', $outletID, 'usedDate', $usedDate, 'jenis', $jenis)->result());
              break;

          case 'mingguan_produksi':
              $sql = "
                SELECT `ings`.`ingredientID`, `ings`.`ingCode`, `ings`.`ingName`,
                       IFNULL(`groupbydetaillttbbmpforlb_v`.`sumTerima`, 0) qtyTerima,
                       IFNULL(`groupbydetaillttbbmpforlb_v`.`sumRetur`, 0) qtyRetur,
                       IFNULL(`groupbydetaillttbbmpforlb_v`.`sumTerima`, 0) - IFNULL(`groupbydetaillttbbmpforlb_v`.`sumRetur`, 0) qtyCht,
                       `groupbydetaillttbbmpforlb_v`.`detailLttbbmpQtyUnit` unitCht,
                       (IFNULL(`groupbydetailbelanja_v`.`sumCash`, 0) + IFNULL(`groupbydetailbelanja_v`.`sumDebit`, 0)) / (IFNULL(`groupbydetaillttbbmpforlb_v`.`sumTerima`, 0) - IFNULL(`groupbydetaillttbbmpforlb_v`.`sumRetur`, 0)) harga,
                       IFNULL(`groupbydetailbelanja_v`.`sumCash`, 0) tunai,
                       IFNULL(`groupbydetailbelanja_v`.`sumDebit`, 0) hutang,
                       IFNULL(`groupbydetailbelanja_v`.`sumCash`, 0) + IFNULL(`groupbydetailbelanja_v`.`sumDebit`, 0) subtotal
                  FROM
                  (
                    SELECT `ingredientID`, `detailbelanjaCode` AS ingCode, `detailbelanjaName` AS ingName
                      FROM `groupbydetailbelanja_v`
                      WHERE `outletID` = '$outletID'
                      AND `detailbelanjaUsedDate` = '$usedDate'
                      AND `detailbelanjaType` = 'mingguan_produksi'
                    UNION
                    SELECT `ingredientID`, `detailLttbbmpCode` AS ingCode, `detailLttbbmpName` AS ingName
                      FROM `groupbydetaillttbbmpforlb_v`
                      WHERE `outletID` = '$outletID'
                      AND `detailLttbbmpLaporanDate` = '$usedDate'
                  ) ings
                  LEFT JOIN `groupbydetailbelanja_v`
                    ON `ings`.`ingredientID` = `groupbydetailbelanja_v`.`ingredientID`
                    AND `groupbydetailbelanja_v`.`outletID` = '$outletID'
                    AND `groupbydetailbelanja_v`.`detailbelanjaUsedDate` = '$usedDate'
                    AND `groupbydetailbelanja_v`.`detailbelanjaType` = 'mingguan_produksi'
                  LEFT JOIN `groupbydetaillttbbmpforlb_v`
                    ON `ings`.`ingredientID` = `groupbydetaillttbbmpforlb_v`.`ingredientID`
                    AND `groupbydetaillttbbmpforlb_v`.`outletID` = '$outletID'
                    AND `groupbydetaillttbbmpforlb_v`.`detailLttbbmpLaporanDate` = '$usedDate'
              ";

              $get_history = $CI->rekapharga_m->_custom_query($sql);

              $rekap = $CI->rekapharga_m->get_triple_where('outletID', $outletID, 'usedDate', $usedDate, 'jenis', $jenis);

              if ($rekap->num_rows() > 0) {
                $CI->rekapharga_m->_delete_triple_where('outletID', $outletID, 'usedDate', $usedDate, 'jenis', $jenis);
              }

              if ($get_history->num_rows() > 0) {
                foreach ($get_history->result() as $key => $val) {
                  $ing = $CI->ingredients_m->get_where($val->ingredientID);

                  $data[] = array(
                    'outletID' => $outletID,
                    'usedDate' => $usedDate,
                    'jenis' => $jenis,
                    'ingredientID' => $val->ingredientID,
                    'ingredientCode' => $val->ingCode,
                    'ingredientName' => $val->ingName,
                    'ingredientCategory' => $ing->row('ingredientCategory'),
                    'qtyQtyBersih' => $val->qtyCht,
                    'qtyUnit' => $val->unitCht,
                    'tunai' => $val->tunai,
                    'hutang' => $val->hutang,
                    'subtotal' => $val->subtotal,
                    'lastUpdate' => date('Y-m-d H:i:s'),
                  );
                }

                $CI->rekapharga_m->_insert_batch($data);
              }

              dump($CI->rekapharga_m->get_triple_where('outletID', $outletID, 'usedDate', $usedDate, 'jenis', $jenis)->result());
              break;

          case 'mingguan_operasional':
              $sql = "
                SELECT `ings`.`ingredientID`, `ings`.`ingCode`, `ings`.`ingName`,
                       IFNULL(`groupbydetaillttbbmobbtlforlb_v`.`sumTerima`, 0) + IFNULL(`groupbydetaillttbbmobbopsforlb_v`.`sumTerima`, 0) qtyTerima,
                       IFNULL(`groupbydetaillttbbmobbtlforlb_v`.`sumRetur`, 0) + IFNULL(`groupbydetaillttbbmobbopsforlb_v`.`sumRetur`, 0) qtyRetur,

                       (IFNULL(`groupbydetaillttbbmobbtlforlb_v`.`sumTerima`, 0) + IFNULL(`groupbydetaillttbbmobbopsforlb_v`.`sumTerima`, 0)) - (IFNULL(`groupbydetaillttbbmobbtlforlb_v`.`sumRetur`, 0) + IFNULL(`groupbydetaillttbbmobbopsforlb_v`.`sumRetur`, 0)) qtyCht,
                       IFNULL(`groupbydetaillttbbmobbtlforlb_v`.`detailLttbbmobbtlQtyUnit`, `groupbydetaillttbbmobbopsforlb_v`.`detailLttbbmobbopsQtyUnit`) unitCht,

                       (IFNULL(`groupbydetailbelanja_v`.`sumCash`, 0) + IFNULL(`groupbydetailbelanja_v`.`sumDebit`, 0)) / ((IFNULL(`groupbydetaillttbbmobbtlforlb_v`.`sumTerima`, 0) + IFNULL(`groupbydetaillttbbmobbopsforlb_v`.`sumTerima`, 0)) - (IFNULL(`groupbydetaillttbbmobbtlforlb_v`.`sumRetur`, 0) + IFNULL(`groupbydetaillttbbmobbopsforlb_v`.`sumRetur`, 0))) harga,

                       IFNULL(`groupbydetailbelanja_v`.`sumCash`, 0) tunai,
                       IFNULL(`groupbydetailbelanja_v`.`sumDebit`, 0) hutang,
                       IFNULL(`groupbydetailbelanja_v`.`sumCash`, 0) + IFNULL(`groupbydetailbelanja_v`.`sumDebit`, 0) subtotal
                  FROM
                  (
                    SELECT `ingredientID`, `detailbelanjaCode` AS ingCode, `detailbelanjaName` AS ingName
                      FROM `groupbydetailbelanja_v`
                      WHERE `outletID` = '$outletID'
                      AND `detailbelanjaUsedDate` = '$usedDate'
                      AND `detailbelanjaType` = 'mingguan_operasional'
                    UNION
                    SELECT `ingredientID`, `detailLttbbmobbtlCode` AS ingCode, `detailLttbbmobbtlName` AS ingName
                      FROM `groupbydetaillttbbmobbtlforlb_v`
                      WHERE `outletID` = '$outletID'
                      AND `detailLttbbmobbtlLaporanDate` = '$usedDate'
                    UNION
                    SELECT `ingredientID`, `detailLttbbmobbopsCode` AS ingCode, `detailLttbbmobbopsName` AS ingName
                      FROM `groupbydetaillttbbmobbopsforlb_v`
                      WHERE `outletID` = '$outletID'
                      AND `detailLttbbmobbopsLaporanDate` = '$usedDate'
                  ) ings
                  LEFT JOIN `groupbydetailbelanja_v`
                    ON `ings`.`ingredientID` = `groupbydetailbelanja_v`.`ingredientID`
                    AND `groupbydetailbelanja_v`.`outletID` = '$outletID'
                    AND `groupbydetailbelanja_v`.`detailbelanjaUsedDate` = '$usedDate'
                    AND `groupbydetailbelanja_v`.`detailbelanjaType` = 'mingguan_operasional'
                  LEFT JOIN `groupbydetaillttbbmobbtlforlb_v`
                    ON `ings`.`ingredientID` = `groupbydetaillttbbmobbtlforlb_v`.`ingredientID`
                    AND `groupbydetaillttbbmobbtlforlb_v`.`outletID` = '$outletID'
                    AND `groupbydetaillttbbmobbtlforlb_v`.`detailLttbbmobbtlLaporanDate` = '$usedDate'
                  LEFT JOIN `groupbydetaillttbbmobbopsforlb_v`
                    ON `ings`.`ingredientID` = `groupbydetaillttbbmobbopsforlb_v`.`ingredientID`
                    AND `groupbydetaillttbbmobbopsforlb_v`.`outletID` = '$outletID'
                    AND `groupbydetaillttbbmobbopsforlb_v`.`detailLttbbmobbopsLaporanDate` = '$usedDate'
              ";

              $get_history = $CI->rekapharga_m->_custom_query($sql);

              $rekap = $CI->rekapharga_m->get_triple_where('outletID', $outletID, 'usedDate', $usedDate, 'jenis', $jenis);

              if ($rekap->num_rows() > 0) {
                $CI->rekapharga_m->_delete_triple_where('outletID', $outletID, 'usedDate', $usedDate, 'jenis', $jenis);
              }

              if ($get_history->num_rows() > 0) {
                foreach ($get_history->result() as $key => $val) {
                  $ing = $CI->ingredients_m->get_where($val->ingredientID);

                  $data[] = array(
                    'outletID' => $outletID,
                    'usedDate' => $usedDate,
                    'jenis' => $jenis,
                    'ingredientID' => $val->ingredientID,
                    'ingredientCode' => $val->ingCode,
                    'ingredientName' => $val->ingName,
                    'ingredientCategory' => $ing->row('ingredientCategory'),
                    'qtyQtyBersih' => $val->qtyCht,
                    'qtyUnit' => $val->unitCht,
                    'tunai' => $val->tunai,
                    'hutang' => $val->hutang,
                    'subtotal' => $val->subtotal,
                    'lastUpdate' => date('Y-m-d H:i:s'),
                  );
                }

                $CI->rekapharga_m->_insert_batch($data);
              }

              dump($CI->rekapharga_m->get_triple_where('outletID', $outletID, 'usedDate', $usedDate, 'jenis', $jenis)->result());
              break;

          case 'ecer_otbh':
              $sql = "
                SELECT `ings`.`ingredientID`, `ings`.`ingCode`, `ings`.`ingName`,
                     IFNULL(`groupbydetailotbh_v`.`qtyQtyCht`, 0) qtyCht,
                     `groupbydetailotbh_v`.`detailotbhChtQtyUnit` unitCht,
                     (IFNULL(`groupbydetailbelanja_v`.`sumCash`, 0) + IFNULL(`groupbydetailbelanja_v`.`sumDebit`, 0)) / (IFNULL(`groupbydetailotbh_v`.`qtyQtyCht`, 0)) harga,
                     IFNULL(`groupbydetailbelanja_v`.`sumCash`, 0) tunai,
                     IFNULL(`groupbydetailbelanja_v`.`sumDebit`, 0) hutang,
                     IFNULL(`groupbydetailbelanja_v`.`sumCash`, 0) + IFNULL(`groupbydetailbelanja_v`.`sumDebit`, 0) subtotal
                FROM
                (
                  SELECT `ingredientID`, `detailbelanjaCode` AS ingCode, `detailbelanjaName` AS ingName
                    FROM `groupbydetailbelanja_v`
                    WHERE `outletID` = '$outletID'
                    AND `detailbelanjaUsedDate` = '$usedDate'
                    AND (`ingredientCategory` = 'Produksi' OR `ingredientCategory` = 'Bahan Bakar')
                    AND `groupbydetailbelanja_v`.`detailbelanjaType` = 'ecer'
                  UNION
                  SELECT `ingredientID`, `detailotbhCode`AS ingCode, `detailotbhName`AS ingName
                    FROM `groupbydetailotbh_v`
                    WHERE `outletID` = '$outletID'
                    AND `detailotbhUsedDate` = '$usedDate'
                ) ings
                LEFT JOIN `groupbydetailbelanja_v`
                  ON `ings`.`ingredientID` = `groupbydetailbelanja_v`.`ingredientID`
                  AND `groupbydetailbelanja_v`.`outletID` = '$outletID'
                  AND `groupbydetailbelanja_v`.`detailbelanjaUsedDate` = '$usedDate'
                  AND (`ingredientCategory` = 'Produksi' OR `ingredientCategory` = 'Bahan Bakar')
                  AND `groupbydetailbelanja_v`.`detailbelanjaType` = 'ecer'
                LEFT JOIN `groupbydetailotbh_v`
                  ON `ings`.`ingredientID` = `groupbydetailotbh_v`.`ingredientID`
                  AND `groupbydetailotbh_v`.`outletID` = '$outletID'
                  AND `groupbydetailotbh_v`.`detailotbhUsedDate` = '$usedDate'
                ORDER BY `ings`.`ingCode`
              ";

              $get_history = $CI->rekapharga_m->_custom_query($sql);

              $rekap = $CI->rekapharga_m->get_triple_where('outletID', $outletID, 'usedDate', $usedDate, 'jenis', $jenis);

              if ($rekap->num_rows() > 0) {
                $CI->rekapharga_m->_delete_triple_where('outletID', $outletID, 'usedDate', $usedDate, 'jenis', $jenis);
              }

              if ($get_history->num_rows() > 0) {
                foreach ($get_history->result() as $key => $val) {
                  $ing = $CI->ingredients_m->get_where($val->ingredientID);

                  $data[] = array(
                    'outletID' => $outletID,
                    'usedDate' => $usedDate,
                    'jenis' => $jenis,
                    'ingredientID' => $val->ingredientID,
                    'ingredientCode' => $val->ingCode,
                    'ingredientName' => $val->ingName,
                    'ingredientCategory' => $ing->row('ingredientCategory'),
                    'qtyQtyBersih' => $val->qtyCht,
                    'qtyUnit' => $val->unitCht,
                    'tunai' => $val->tunai,
                    'hutang' => $val->hutang,
                    'subtotal' => $val->subtotal,
                    'lastUpdate' => date('Y-m-d H:i:s'),
                  );
                }

                $CI->rekapharga_m->_insert_batch($data);
              }

              dump($CI->rekapharga_m->get_triple_where('outletID', $outletID, 'usedDate', $usedDate, 'jenis', $jenis)->result());
              break;

          case 'ecer_otbg':
              $sql = "
                SELECT `ings`.`ingredientID`, `ings`.`ingCode`, `ings`.`ingName`,
                     IFNULL(`groupbydetailotbg_v`.`qtyCht`, 0) qtyCht,
                     `groupbydetailotbg_v`.`detailotbgChtQtyUnit` unitCht,
                     (IFNULL(`groupbydetailbelanja_v`.`sumCash`, 0) + IFNULL(`groupbydetailbelanja_v`.`sumDebit`, 0)) / (IFNULL(`groupbydetailotbg_v`.`qtyCht`, 0)) harga,
                     IFNULL(`groupbydetailbelanja_v`.`sumCash`, 0) tunai,
                     IFNULL(`groupbydetailbelanja_v`.`sumDebit`, 0) hutang,
                     IFNULL(`groupbydetailbelanja_v`.`sumCash`, 0) + IFNULL(`groupbydetailbelanja_v`.`sumDebit`, 0) subtotal
                FROM
                (
                  SELECT `ingredientID`, `detailbelanjaCode` AS ingCode, `detailbelanjaName` AS ingName
                    FROM `groupbydetailbelanja_v`
                    WHERE `outletID` = '$outletID'
                    AND `detailbelanjaUsedDate` = '$usedDate'
                    AND (`ingredientCategory` = 'Gudang Produksi' OR `ingredientCategory` = 'Gudang Operasional BBTL' OR `ingredientCategory` = 'Gudang Operasional BBOPS')
                    AND `groupbydetailbelanja_v`.`detailbelanjaType` = 'ecer'
                  UNION
                  SELECT `ingredientID`, `detailotbgCode`AS ingCode, `detailotbgName`AS ingName
                    FROM `groupbydetailotbg_v`
                    WHERE `outletID` = '$outletID'
                    AND `detailotbgUsedDate` = '$usedDate'
                ) ings
                LEFT JOIN `groupbydetailbelanja_v`
                  ON `ings`.`ingredientID` = `groupbydetailbelanja_v`.`ingredientID`
                  AND `groupbydetailbelanja_v`.`outletID` = '$outletID'
                  AND `groupbydetailbelanja_v`.`detailbelanjaUsedDate` = '$usedDate'
                  AND (`ingredientCategory` = 'Gudang Produksi' OR `ingredientCategory` = 'Gudang Operasional BBTL' OR `ingredientCategory` = 'Gudang Operasional BBOPS')
                  AND `groupbydetailbelanja_v`.`detailbelanjaType` = 'ecer'
                LEFT JOIN `groupbydetailotbg_v`
                  ON `ings`.`ingredientID` = `groupbydetailotbg_v`.`ingredientID`
                  AND `groupbydetailotbg_v`.`outletID` = '$outletID'
                  AND `groupbydetailotbg_v`.`detailotbgUsedDate` = '$usedDate'
                ORDER BY `ings`.`ingCode`
              ";

              $get_history = $CI->rekapharga_m->_custom_query($sql);

              $rekap = $CI->rekapharga_m->get_triple_where('outletID', $outletID, 'usedDate', $usedDate, 'jenis', $jenis);

              if ($rekap->num_rows() > 0) {
                $CI->rekapharga_m->_delete_triple_where('outletID', $outletID, 'usedDate', $usedDate, 'jenis', $jenis);
              }

              if ($get_history->num_rows() > 0) {
                foreach ($get_history->result() as $key => $val) {
                  $ing = $CI->ingredients_m->get_where($val->ingredientID);

                  $data[] = array(
                    'outletID' => $outletID,
                    'usedDate' => $usedDate,
                    'jenis' => $jenis,
                    'ingredientID' => $val->ingredientID,
                    'ingredientCode' => $val->ingCode,
                    'ingredientName' => $val->ingName,
                    'ingredientCategory' => $ing->row('ingredientCategory'),
                    'qtyQtyBersih' => $val->qtyCht,
                    'qtyUnit' => $val->unitCht,
                    'tunai' => $val->tunai,
                    'hutang' => $val->hutang,
                    'subtotal' => $val->subtotal,
                    'lastUpdate' => date('Y-m-d H:i:s'),
                  );
                }

                $CI->rekapharga_m->_insert_batch($data);
              }

              dump($CI->rekapharga_m->get_triple_where('outletID', $outletID, 'usedDate', $usedDate, 'jenis', $jenis)->result());
              break;

          default:
              show_404();
              break;
      }
    }
}