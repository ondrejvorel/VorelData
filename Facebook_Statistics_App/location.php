<?php

 $loc_p = 0;              
 $loc_curOffset = 1351728000;

  do  {
       $loc_url = 'https://graph.facebook.com/'
        . '/me/locations?fields=created_time&limit=40&until='.$loc_curOffset.''
        . '&access_token=' . $params['access_token']; 
       $loc_result = file_get_contents($loc_url);
       $loc_obj= json_decode($loc_result, true); 
       $loc_test=$loc_obj['data'];
if (!empty($loc_test)) {
       
       $loc_array[$loc_p]=$loc_obj['data'];  
       $loc_p=$loc_p+1;  
                                             
  foreach ($loc_test as $loc_value_check) 
   { $loc_created_check[] = $loc_value_check["created_time"]; }
   
  foreach ($loc_created_check as $loc_timestamp1_check) 
   { $loc_timestamp_check[] = strtotime($loc_timestamp1_check); }  
  
  $loc_curOffset=min($loc_timestamp_check);     
  
  foreach ($loc_timestamp_check as $loc_before_2010)
   { if ($loc_before_2010 < 1262304000)
         $loc_lastBatch=1; else{$loc_lastBatch = 0;}}             
    
    if(empty($loc_test[39]))
         $loc_lastBatch=1;    
    else{$loc_lastBatch = 0;}     

} 
else {$loc_lastBatch=1;}          
         
     } while($loc_lastBatch<1);
     
if (!empty($loc_array)) { 

   
  foreach ($loc_array as $loc_value) {
  foreach ($loc_value as $loc_value1) 
   { $loc_created[] = $loc_value1["created_time"]; }}
  foreach ($loc_created as $loc_timestamp1) 
   { $loc_timestamp[] = strtotime($loc_timestamp1); }
 
} 
else {$loc_timestamp=array('0'=>'0');}  
           
//------------------------------------------------------------------------------   
   

  $chIn_p = 0;              
  $chIn_curOffset = 1351728000;

    do  
    {
       $chIn_url = 'https://graph.facebook.com/'
        . '/me/checkins?fields=created_time&limit=40&until='.$chIn_curOffset.''
        . '&access_token=' . $params['access_token']; 
       $chIn_result = file_get_contents($chIn_url);
       $chIn_obj= json_decode($chIn_result, true); 
       $chIn_test=$chIn_obj['data'];
if (!empty($chIn_test)) {

       $chIn_array[$chIn_p]=$chIn_obj['data'];  
       $chIn_p=$chIn_p+1;  
                                             
      foreach ($chIn_test as $chIn_value_check){ 
               $chIn_created_check[] = $chIn_value_check["created_time"]; }
   
      foreach ($chIn_created_check as $chIn_timestamp1_check) { 
               $chIn_timestamp_check[] = strtotime($chIn_timestamp1_check); }  
      $chIn_curOffset=min($chIn_timestamp_check);     
  
      foreach ($chIn_timestamp_check as $chIn_before_2010){
           if ($chIn_before_2010 < 1262304000)
               $chIn_lastBatch=1; else{$chInc_lastBatch = 0;}}             
    
      if(empty($chIn_test[39]))
               $chIn_lastBatch=1;    
      else{$chIn_lastBatch = 0;}     
              
} 
else {$chIn_lastBatch=1;} 
  
    }
    while($chIn_lastBatch<1);
        
if (!empty($chIn_array)) {
      foreach ($chIn_array as $chIn_value) {
      foreach ($chIn_value as $chIn_value1) {
               $chIn_created[] = $chIn_value1["created_time"]; }}
      foreach ($chIn_created as $chIn_timestamp1) {
               $chIn_timestamp[] = strtotime($chIn_timestamp1); }              
                              
} 
else {$chIn_timestamp=array('0'=>'0');}
              

 
$chiLoc_timestamp=array_merge($loc_timestamp,$chIn_timestamp);

for ($t=0;$t<count($chiLoc_timestamp);$t++)
{
if ($chiLoc_timestamp[$t] > 1262304000)
if ($chiLoc_timestamp[$t] < 1264982400)
{
$chiLoc_count10_1[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1264982400)
if ($chiLoc_timestamp[$t] < 1267401600)
{
$chiLoc_count10_2[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1267401600)
if ($chiLoc_timestamp[$t] < 1270080000)
{
$chiLoc_count10_3[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1270080000)
if ($chiLoc_timestamp[$t] < 1272672000)
{
$chiLoc_count10_4[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1272672000)
if ($chiLoc_timestamp[$t] < 1275350400)
{
$chiLoc_count10_5[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1275350400)
if ($chiLoc_timestamp[$t] < 1277942400)
{
$chiLoc_count10_6[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1277942400)
if ($chiLoc_timestamp[$t] < 1280620800)
{
$chiLoc_count10_7[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1280620800)
if ($chiLoc_timestamp[$t] < 1283299200)
{
$chiLoc_count10_8[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1283299200)
if ($chiLoc_timestamp[$t] < 1285891200)
{
$chiLoc_count10_9[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1285891200)
if ($chiLoc_timestamp[$t] < 1288569600)
{
$chiLoc_count10_10[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1288569600)
if ($chiLoc_timestamp[$t] < 1291161600)
{
$chiLoc_count10_11[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1291161600)
if ($chiLoc_timestamp[$t] < 1293840000)
{
$chiLoc_count10_12[] =$chiLoc_timestamp[$t];
}


if ($chiLoc_timestamp[$t] > 1293840000)
if ($chiLoc_timestamp[$t] < 1296518400)
{
$chiLoc_count11_1[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1296518400)
if ($chiLoc_timestamp[$t] < 1298937600)
{
$chiLoc_count11_2[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1298937600)
if ($chiLoc_timestamp[$t] < 1301616000)
{
$chiLoc_count11_3[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1301616000)
if ($chiLoc_timestamp[$t] < 1304208000)
{
$chiLoc_count11_4[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1304208000)
if ($chiLoc_timestamp[$t] < 1306886400)
{
$chiLoc_count11_5[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1306886400)
if ($chiLoc_timestamp[$t] < 1309478400)
{
$chiLoc_count11_6[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1309478400)
if ($chiLoc_timestamp[$t] < 1312156800)
{
$chiLoc_count11_7[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1312156800)
if ($chiLoc_timestamp[$t] < 1314835200)
{
$chiLoc_count11_8[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1314835200)
if ($chiLoc_timestamp[$t] < 1317427200)
{
$chiLoc_count11_9[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1317427200)
if ($chiLoc_timestamp[$t] < 1320105600)
{
$chiLoc_count11_10[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1320105600)
if ($chiLoc_timestamp[$t] < 1322697600)
{
$chiLoc_count11_11[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1322697600)
if ($chiLoc_timestamp[$t] < 1325376000)
{
$chiLoc_count11_12[] =$chiLoc_timestamp[$t];
}


if ($chiLoc_timestamp[$t] > 1325376000)
if ($chiLoc_timestamp[$t] < 1328054400)
{
$chiLoc_count12_1[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1328054400)
if ($chiLoc_timestamp[$t] < 1330560000)
{
$chiLoc_count12_2[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1330560000)
if ($chiLoc_timestamp[$t] < 1333238400)
{
$chiLoc_count12_3[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1333238400)
if ($chiLoc_timestamp[$t] < 1335830400)
{
$chiLoc_count12_4[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1335830400)
if ($chiLoc_timestamp[$t] < 1338508800)
{
$chiLoc_count12_5[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1338508800)
if ($chiLoc_timestamp[$t] < 1341100800)
{
$chiLoc_count12_6[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1341100800)
if ($chiLoc_timestamp[$t] < 1343779200)
{
$chiLoc_count12_7[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1343779200)
if ($chiLoc_timestamp[$t] < 1346457600)
{
$chiLoc_count12_8[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1346457600)
if ($chiLoc_timestamp[$t] < 1349049600)
{
$chiLoc_count12_9[] =$chiLoc_timestamp[$t];
}
if ($chiLoc_timestamp[$t] > 1349049600)
if ($chiLoc_timestamp[$t] < 1351728000)
{
$chiLoc_count12_10[] =$chiLoc_timestamp[$t];
}
}


if (empty($chiLoc_count10_1)){$chiLoc_r2010_1 = "0";} else{$chiLoc_r2010_1 =count($chiLoc_count10_1);}
if (empty($chiLoc_count10_2)){$chiLoc_r2010_2 = "0";} else{$chiLoc_r2010_2 =count($chiLoc_count10_2);}
if (empty($chiLoc_count10_3)){$chiLoc_r2010_3 = "0";} else{$chiLoc_r2010_3 =count($chiLoc_count10_3);}
if (empty($chiLoc_count10_4)){$chiLoc_r2010_4 = "0";} else{$chiLoc_r2010_4 =count($chiLoc_count10_4);}
if (empty($chiLoc_count10_5)){$chiLoc_r2010_5 = "0";} else{$chiLoc_r2010_5 =count($chiLoc_count10_5);}
if (empty($chiLoc_count10_6)){$chiLoc_r2010_6 = "0";} else{$chiLoc_r2010_6 =count($chiLoc_count10_6);}
if (empty($chiLoc_count10_7)){$chiLoc_r2010_7 = "0";} else{$chiLoc_r2010_7 =count($chiLoc_count10_7);}
if (empty($chiLoc_count10_8)){$chiLoc_r2010_8 = "0";} else{$chiLoc_r2010_8 =count($chiLoc_count10_8);}
if (empty($chiLoc_count10_9)){$chiLoc_r2010_9 = "0";} else{$chiLoc_r2010_9 =count($chiLoc_count10_9);}
if (empty($chiLoc_count10_10)){$chiLoc_r2010_10 = "0";} else{$chiLoc_r2010_10 =count($chiLoc_count10_10);}
if (empty($chiLoc_count10_11)){$chiLoc_r2010_11 = "0";} else{$chiLoc_r2010_11 =count($chiLoc_count10_11);}
if (empty($chiLoc_count10_12)){$chiLoc_r2010_12 = "0";} else{$chiLoc_r2010_12 =count($chiLoc_count10_12);}

if (empty($chiLoc_count11_1)){$chiLoc_r2011_1 = "0";} else{$chiLoc_r2011_1 =count($chiLoc_count11_1);}
if (empty($chiLoc_count11_2)){$chiLoc_r2011_2 = "0";} else{$chiLoc_r2011_2 =count($chiLoc_count11_2);}
if (empty($chiLoc_count11_3)){$chiLoc_r2011_3 = "0";} else{$chiLoc_r2011_3 =count($chiLoc_count11_3);}
if (empty($chiLoc_count11_4)){$chiLoc_r2011_4 = "0";} else{$chiLoc_r2011_4 =count($chiLoc_count11_4);}
if (empty($chiLoc_count11_5)){$chiLoc_r2011_5 = "0";} else{$chiLoc_r2011_5 =count($chiLoc_count11_5);}
if (empty($chiLoc_count11_6)){$chiLoc_r2011_6 = "0";} else{$chiLoc_r2011_6 =count($chiLoc_count11_6);}
if (empty($chiLoc_count11_7)){$chiLoc_r2011_7 = "0";} else{$chiLoc_r2011_7 =count($chiLoc_count11_7);}
if (empty($chiLoc_count11_8)){$chiLoc_r2011_8 = "0";} else{$chiLoc_r2011_8 =count($chiLoc_count11_8);}
if (empty($chiLoc_count11_9)){$chiLoc_r2011_9 = "0";} else{$chiLoc_r2011_9 =count($chiLoc_count11_9);}
if (empty($chiLoc_count11_10)){$chiLoc_r2011_10 = "0";} else{$chiLoc_r2011_10 =count($chiLoc_count11_10);}
if (empty($chiLoc_count11_11)){$chiLoc_r2011_11 = "0";} else{$chiLoc_r2011_11 =count($chiLoc_count11_11);}
if (empty($chiLoc_count11_12)){$chiLoc_r2011_12 = "0";} else{$chiLoc_r2011_12 =count($chiLoc_count11_12);}

if (empty($chiLoc_count12_1)){$chiLoc_r2012_1 = "0";} else{$chiLoc_r2012_1 =count($chiLoc_count12_1);}
if (empty($chiLoc_count12_2)){$chiLoc_r2012_2 = "0";} else{$chiLoc_r2012_2 =count($chiLoc_count12_2);}
if (empty($chiLoc_count12_3)){$chiLoc_r2012_3 = "0";} else{$chiLoc_r2012_3 =count($chiLoc_count12_3);}
if (empty($chiLoc_count12_4)){$chiLoc_r2012_4 = "0";} else{$chiLoc_r2012_4 =count($chiLoc_count12_4);}
if (empty($chiLoc_count12_5)){$chiLoc_r2012_5 = "0";} else{$chiLoc_r2012_5 =count($chiLoc_count12_5);}
if (empty($chiLoc_count12_6)){$chiLoc_r2012_6 = "0";} else{$chiLoc_r2012_6 =count($chiLoc_count12_6);}
if (empty($chiLoc_count12_7)){$chiLoc_r2012_7 = "0";} else{$chiLoc_r2012_7 =count($chiLoc_count12_7);}
if (empty($chiLoc_count12_8)){$chiLoc_r2012_8 = "0";} else{$chiLoc_r2012_8 =count($chiLoc_count12_8);}
if (empty($chiLoc_count12_9)){$chiLoc_r2012_9 = "0";} else{$chiLoc_r2012_9 =count($chiLoc_count12_9);}
if (empty($chiLoc_count12_10)){$chiLoc_r2012_10 = "0";} else{$chiLoc_r2012_10 =count($chiLoc_count12_10);}



$graph_chiLoc_array=array($chiLoc_r2010_1,$chiLoc_r2010_2,$chiLoc_r2010_3,$chiLoc_r2010_4,$chiLoc_r2010_5,$chiLoc_r2010_6,$chiLoc_r2010_7,$chiLoc_r2010_8,$chiLoc_r2010_9,$chiLoc_r2010_10,$chiLoc_r2010_11,$chiLoc_r2010_12,
                          $chiLoc_r2011_1,$chiLoc_r2011_2,$chiLoc_r2011_3,$chiLoc_r2011_4,$chiLoc_r2011_5,$chiLoc_r2011_6,$chiLoc_r2011_7,$chiLoc_r2011_8,$chiLoc_r2011_9,$chiLoc_r2011_10,$chiLoc_r2011_11,$chiLoc_r2011_12,
                          $chiLoc_r2012_1,$chiLoc_r2012_2,$chiLoc_r2012_3,$chiLoc_r2012_4,$chiLoc_r2012_5,$chiLoc_r2012_6,$chiLoc_r2012_7,$chiLoc_r2012_8,$chiLoc_r2012_9,$chiLoc_r2012_10);
$graph_chiLoc_ceil=ceil(max($graph_chiLoc_array)/10);                   
$max_graph_chiLoc = $graph_chiLoc_ceil*10;

$chiLoc_amount=array_sum($graph_chiLoc_array);


 // Dataset definition 
 $DataSet = new pData;
 $DataSet->AddPoint($graph_chiLoc_array,"Serie1");
// $DataSet->AddPoint(array(),"Serie2");
 $DataSet->AddPoint(array("January 10","","","April 10","","","July 10","","","October 10","","",
                          "January 11","","","April 11","","","July 11","","","October 11","","",
                          "January 12","","","April 12","","","July 12","","","October 12"),"Serie3");
 $DataSet->AddAllSeries();
 $DataSet->RemoveSerie("Serie3");
// $DataSet->RemoveSerie("Serie2");
 $DataSet->SetAbsciseLabelSerie("Serie3");
 $DataSet->SetSerieName("Amount of Locations","Serie1");
 $DataSet->SetYAxisUnit();
 
 // Initialise the graph 
 $Test = new pChart(790,340);
 $Test->drawGraphAreaGradient(90,90,90,90,TARGET_BACKGROUND);
 $Test->setFixedScale(0,$max_graph_chiLoc);  

 // Graph area setup
 $Test->setFontProperties("libs/pChart/Fonts/arial.ttf",8);
 $Test->setGraphArea(35,40,750,300);
 $Test->drawGraphArea(200,200,200,FALSE);
 
  
 $Test->drawScale($DataSet->GetData(),$DataSet->GetDataDescription(),SCALE_NORMAL,200,200,200,TRUE,0,2);
 $Test->drawGraphAreaGradient(40,40,40,-50);
 $Test->drawGrid(4,TRUE,230,230,230,10);
 $Test->SetColorPalette(0,219,183,36); 
 // Draw the line chart
 $Test->setShadowProperties(3,3,0,0,0,30,4);
 $Test->drawCubicCurve($DataSet->GetData(),$DataSet->GetDataDescription());
 $Test->clearShadow();
 $Test->drawPlotGraph($DataSet->GetData(),$DataSet->GetDataDescription(),3,0,-1,-1,-1,TRUE);

 // Write the title
 $Test->setFontProperties("libs/pChart/Fonts/arialbd.ttf",18);
 $Test->setShadowProperties(1,1,0,0,0);
 $Test->drawTitle(77,0,"Locations",255,255,255,100,40,TRUE);
 $Test->clearShadow();

 // Draw the legend
 $Test->setFontProperties("libs/pChart/Fonts/arial.ttf",12);
 $Test->drawLegend(610,5,$DataSet->GetDataDescription(),0,0,0,0,0,0,255,255,255,FALSE);

 // Render the picture
  $Test->render("pic/location/". $user_uid .".png"); 


 


?>
