<?php
/**
 * Fungsi Semester untuk mendapatkan nilai awal tiap semster.
 * @author Candra Saputra
 * @version 1.0
 */
if (!function_exists('semester')) {
    function foursemester ($semester)
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