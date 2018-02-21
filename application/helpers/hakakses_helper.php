<?php
/**
 * Fungsi hak akses untuk mempermudah pengecekan yang berhubungan dangan validasi.
 * @author Candra Saputra
 * @version 1.0
 */
if (!function_exists('hakakses')) {
    /**
     * Mengecek apakah pengguna memiliki hak mengakses proker tersebut.
     * int
     */
    function ha_proker ($prokerID)
    {
        switch ($semester) {
          case '1':
            $current = 1;
            break;

          case '2':
            $current = 4;
            break;

          case '3':
            $current = 7;
            break;

          case '4':
            $current = 10;
            break;
          
          default:
            $current = 0;
            break;
        }

        return $current;
    }
}