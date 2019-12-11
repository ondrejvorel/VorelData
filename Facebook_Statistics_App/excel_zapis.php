<?php
ini_set('memory_limit', '1576M');
set_time_limit(0);

/** Include PHPExcel **/
require_once 'libs/excel_classes/PHPExcel.php';

$objReader = new PHPExcel_Reader_Excel5();
$filename = dirname(__FILE__) . '/Excel_vystup.xls';
$objPHPExcel = $objReader->load( $filename );





$objPHPExcel->setActiveSheetIndex(0);

$objWorksheet = $objPHPExcel->getActiveSheet();
$highestRow = $objWorksheet->getHighestRow();              
$zapis=$highestRow + 1;

$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A' . $zapis, $user_uid)
            ->setCellValue('B' . $zapis, $user_name)
            ->setCellValue('C' . $zapis, $birthday_date)
            ->setCellValue('D' . $zapis, $city)
            ->setCellValue('E' . $zapis, $country);

$objPHPExcel->setActiveSheetIndex(1)
            ->setCellValue('A' . $zapis, $r2010_1)
            ->setCellValue('B' . $zapis, $r2010_2)
            ->setCellValue('C' . $zapis, $r2010_3)
            ->setCellValue('D' . $zapis, $r2010_4)
            ->setCellValue('E' . $zapis, $r2010_5)
            ->setCellValue('F' . $zapis, $r2010_6)
            ->setCellValue('G' . $zapis, $r2010_7)
            ->setCellValue('H' . $zapis, $r2010_8)
            ->setCellValue('I' . $zapis, $r2010_9)
            ->setCellValue('J' . $zapis, $r2010_10)
            ->setCellValue('K' . $zapis, $r2010_11)
            ->setCellValue('L' . $zapis, $r2010_12)
            ->setCellValue('M' . $zapis, $r2011_1)
            ->setCellValue('N' . $zapis, $r2011_2)
            ->setCellValue('O' . $zapis, $r2011_3)
            ->setCellValue('P' . $zapis, $r2011_4)
            ->setCellValue('Q' . $zapis, $r2011_5)
            ->setCellValue('R' . $zapis, $r2011_6)
            ->setCellValue('S' . $zapis, $r2011_7)
            ->setCellValue('T' . $zapis, $r2011_8)
            ->setCellValue('U' . $zapis, $r2011_9)
            ->setCellValue('V' . $zapis, $r2011_10)
            ->setCellValue('W' . $zapis, $r2011_11)
            ->setCellValue('X' . $zapis, $r2011_12)
            ->setCellValue('Y' . $zapis, $r2012_1)
            ->setCellValue('Z' . $zapis, $r2012_2)
            ->setCellValue('AA' . $zapis, $r2012_3)
            ->setCellValue('AB' . $zapis, $r2012_4)
            ->setCellValue('AC' . $zapis, $r2012_5)
            ->setCellValue('AD' . $zapis, $r2012_6)
            ->setCellValue('AE' . $zapis, $r2012_7)
            ->setCellValue('AF' . $zapis, $r2012_8)
            ->setCellValue('AG' . $zapis, $r2012_9)
            ->setCellValue('AH' . $zapis, $r2012_10); 
            
$objPHPExcel->setActiveSheetIndex(2)
            ->setCellValue('A' . $zapis, $post_r2010_1)
            ->setCellValue('B' . $zapis, $post_r2010_2)
            ->setCellValue('C' . $zapis, $post_r2010_3)
            ->setCellValue('D' . $zapis, $post_r2010_4)
            ->setCellValue('E' . $zapis, $post_r2010_5)
            ->setCellValue('F' . $zapis, $post_r2010_6)
            ->setCellValue('G' . $zapis, $post_r2010_7)
            ->setCellValue('H' . $zapis, $post_r2010_8)
            ->setCellValue('I' . $zapis, $post_r2010_9)
            ->setCellValue('J' . $zapis, $post_r2010_10)
            ->setCellValue('K' . $zapis, $post_r2010_11)
            ->setCellValue('L' . $zapis, $post_r2010_12)
            ->setCellValue('M' . $zapis, $post_r2011_1)
            ->setCellValue('N' . $zapis, $post_r2011_2)
            ->setCellValue('O' . $zapis, $post_r2011_3)
            ->setCellValue('P' . $zapis, $post_r2011_4)
            ->setCellValue('Q' . $zapis, $post_r2011_5)
            ->setCellValue('R' . $zapis, $post_r2011_6)
            ->setCellValue('S' . $zapis, $post_r2011_7)
            ->setCellValue('T' . $zapis, $post_r2011_8)
            ->setCellValue('U' . $zapis, $post_r2011_9)
            ->setCellValue('V' . $zapis, $post_r2011_10)
            ->setCellValue('W' . $zapis, $post_r2011_11)
            ->setCellValue('X' . $zapis, $post_r2011_12)
            ->setCellValue('Y' . $zapis, $post_r2012_1)
            ->setCellValue('Z' . $zapis, $post_r2012_2)
            ->setCellValue('AA' . $zapis, $post_r2012_3)
            ->setCellValue('AB' . $zapis, $post_r2012_4)
            ->setCellValue('AC' . $zapis, $post_r2012_5)
            ->setCellValue('AD' . $zapis, $post_r2012_6)
            ->setCellValue('AE' . $zapis, $post_r2012_7)
            ->setCellValue('AF' . $zapis, $post_r2012_8)
            ->setCellValue('AG' . $zapis, $post_r2012_9)
            ->setCellValue('AH' . $zapis, $post_r2012_10);
            
$objPHPExcel->setActiveSheetIndex(3)
            ->setCellValue('A' . $zapis, $chiLoc_r2010_1)
            ->setCellValue('B' . $zapis, $chiLoc_r2010_2)
            ->setCellValue('C' . $zapis, $chiLoc_r2010_3)
            ->setCellValue('D' . $zapis, $chiLoc_r2010_4)
            ->setCellValue('E' . $zapis, $chiLoc_r2010_5)
            ->setCellValue('F' . $zapis, $chiLoc_r2010_6)
            ->setCellValue('G' . $zapis, $chiLoc_r2010_7)
            ->setCellValue('H' . $zapis, $chiLoc_r2010_8)
            ->setCellValue('I' . $zapis, $chiLoc_r2010_9)
            ->setCellValue('J' . $zapis, $chiLoc_r2010_10)
            ->setCellValue('K' . $zapis, $chiLoc_r2010_11)
            ->setCellValue('L' . $zapis, $chiLoc_r2010_12)
            ->setCellValue('M' . $zapis, $chiLoc_r2011_1)
            ->setCellValue('N' . $zapis, $chiLoc_r2011_2)
            ->setCellValue('O' . $zapis, $chiLoc_r2011_3)
            ->setCellValue('P' . $zapis, $chiLoc_r2011_4)
            ->setCellValue('Q' . $zapis, $chiLoc_r2011_5)
            ->setCellValue('R' . $zapis, $chiLoc_r2011_6)
            ->setCellValue('S' . $zapis, $chiLoc_r2011_7)
            ->setCellValue('T' . $zapis, $chiLoc_r2011_8)
            ->setCellValue('U' . $zapis, $chiLoc_r2011_9)
            ->setCellValue('V' . $zapis, $chiLoc_r2011_10)
            ->setCellValue('W' . $zapis, $chiLoc_r2011_11)
            ->setCellValue('X' . $zapis, $chiLoc_r2011_12)
            ->setCellValue('Y' . $zapis, $chiLoc_r2012_1)
            ->setCellValue('Z' . $zapis, $chiLoc_r2012_2)
            ->setCellValue('AA' . $zapis, $chiLoc_r2012_3)
            ->setCellValue('AB' . $zapis, $chiLoc_r2012_4)
            ->setCellValue('AC' . $zapis, $chiLoc_r2012_5)
            ->setCellValue('AD' . $zapis, $chiLoc_r2012_6)
            ->setCellValue('AE' . $zapis, $chiLoc_r2012_7)
            ->setCellValue('AF' . $zapis, $chiLoc_r2012_8)
            ->setCellValue('AG' . $zapis, $chiLoc_r2012_9)
            ->setCellValue('AH' . $zapis, $chiLoc_r2012_10); 
            
$objPHPExcel->setActiveSheetIndex(4)
            ->setCellValue('A' . $zapis, $link_r2010_1)
            ->setCellValue('B' . $zapis, $link_r2010_2)
            ->setCellValue('C' . $zapis, $link_r2010_3)
            ->setCellValue('D' . $zapis, $link_r2010_4)
            ->setCellValue('E' . $zapis, $link_r2010_5)
            ->setCellValue('F' . $zapis, $link_r2010_6)
            ->setCellValue('G' . $zapis, $link_r2010_7)
            ->setCellValue('H' . $zapis, $link_r2010_8)
            ->setCellValue('I' . $zapis, $link_r2010_9)
            ->setCellValue('J' . $zapis, $link_r2010_10)
            ->setCellValue('K' . $zapis, $link_r2010_11)
            ->setCellValue('L' . $zapis, $link_r2010_12)
            ->setCellValue('M' . $zapis, $link_r2011_1)
            ->setCellValue('N' . $zapis, $link_r2011_2)
            ->setCellValue('O' . $zapis, $link_r2011_3)
            ->setCellValue('P' . $zapis, $link_r2011_4)
            ->setCellValue('Q' . $zapis, $link_r2011_5)
            ->setCellValue('R' . $zapis, $link_r2011_6)
            ->setCellValue('S' . $zapis, $link_r2011_7)
            ->setCellValue('T' . $zapis, $link_r2011_8)
            ->setCellValue('U' . $zapis, $link_r2011_9)
            ->setCellValue('V' . $zapis, $link_r2011_10)
            ->setCellValue('W' . $zapis, $link_r2011_11)
            ->setCellValue('X' . $zapis, $link_r2011_12)
            ->setCellValue('Y' . $zapis, $link_r2012_1)
            ->setCellValue('Z' . $zapis, $link_r2012_2)
            ->setCellValue('AA' . $zapis, $link_r2012_3)
            ->setCellValue('AB' . $zapis, $link_r2012_4)
            ->setCellValue('AC' . $zapis, $link_r2012_5)
            ->setCellValue('AD' . $zapis, $link_r2012_6)
            ->setCellValue('AE' . $zapis, $link_r2012_7)
            ->setCellValue('AF' . $zapis, $link_r2012_8)
            ->setCellValue('AG' . $zapis, $link_r2012_9)
            ->setCellValue('AH' . $zapis, $link_r2012_10);     
// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$objPHPExcel->setActiveSheetIndex(0);


// Save Excel5 file

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save(str_replace(__FILE__,'Excel_vystup.xls',__FILE__));      


?>