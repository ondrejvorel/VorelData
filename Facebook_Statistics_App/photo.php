<?php
    
$photo_url = 'https://graph.facebook.com/'
        . '/me?fields=albums.fields(photos.limit(500).fields(created_time))'
        . '&access_token=' . $params['access_token'];
  $photo_result = file_get_contents($photo_url);
  $photo_obj = json_decode($photo_result, true);
  $photo_test1 = $photo_obj['albums'];
  $photo_test = $photo_test1['data'];
if (!empty($photo_test)) { 

  foreach ($photo_test as $photo_array) {
           $photo_array1[] = $photo_array['photos'];}
  foreach ($photo_array1 as $photo_array2) {
           $photo_array3[] = $photo_array2['data'];}
           
  foreach ($photo_array3 as $photo_array4) {
           if (!empty ($photo_array4)) { 
  foreach ($photo_array4 as $photo_array5) {  
           $photo_created_check[] = $photo_array5["created_time"];}}}
           
           
  foreach ($photo_created_check as $photo_timestamp_check) {
           $created[] = strtotime($photo_timestamp_check); }    
                        
} 
else {$created=array('0'=>'0');}


for ($i=0;$i<count($created);$i++)
{
if ($created[$i] > 1262304000)
if ($created[$i] < 1264982400)
{
$count10_1[] =$created[$i];
}
if ($created[$i] > 1264982400)
if ($created[$i] < 1267401600)
{
$count10_2[] =$created[$i];
}
if ($created[$i] > 1267401600)
if ($created[$i] < 1270080000)
{
$count10_3[] =$created[$i];
}
if ($created[$i] > 1270080000)
if ($created[$i] < 1272672000)
{
$count10_4[] =$created[$i];
}
if ($created[$i] > 1272672000)
if ($created[$i] < 1275350400)
{
$count10_5[] =$created[$i];
}
if ($created[$i] > 1275350400)
if ($created[$i] < 1277942400)
{
$count10_6[] =$created[$i];
}
if ($created[$i] > 1277942400)
if ($created[$i] < 1280620800)
{
$count10_7[] =$created[$i];
}
if ($created[$i] > 1280620800)
if ($created[$i] < 1283299200)
{
$count10_8[] =$created[$i];
}
if ($created[$i] > 1283299200)
if ($created[$i] < 1285891200)
{
$count10_9[] =$created[$i];
}
if ($created[$i] > 1285891200)
if ($created[$i] < 1288569600)
{
$count10_10[] =$created[$i];
}
if ($created[$i] > 1288569600)
if ($created[$i] < 1291161600)
{
$count10_11[] =$created[$i];
}
if ($created[$i] > 1291161600)
if ($created[$i] < 1293840000)
{
$count10_12[] =$created[$i];
}


if ($created[$i] > 1293840000)
if ($created[$i] < 1296518400)
{
$count11_1[] =$created[$i];
}
if ($created[$i] > 1296518400)
if ($created[$i] < 1298937600)
{
$count11_2[] =$created[$i];
}
if ($created[$i] > 1298937600)
if ($created[$i] < 1301616000)
{
$count11_3[] =$created[$i];
}
if ($created[$i] > 1301616000)
if ($created[$i] < 1304208000)
{
$count11_4[] =$created[$i];
}
if ($created[$i] > 1304208000)
if ($created[$i] < 1306886400)
{
$count11_5[] =$created[$i];
}
if ($created[$i] > 1306886400)
if ($created[$i] < 1309478400)
{
$count11_6[] =$created[$i];
}
if ($created[$i] > 1309478400)
if ($created[$i] < 1312156800)
{
$count11_7[] =$created[$i];
}
if ($created[$i] > 1312156800)
if ($created[$i] < 1314835200)
{
$count11_8[] =$created[$i];
}
if ($created[$i] > 1314835200)
if ($created[$i] < 1317427200)
{
$count11_9[] =$created[$i];
}
if ($created[$i] > 1317427200)
if ($created[$i] < 1320105600)
{
$count11_10[] =$created[$i];
}
if ($created[$i] > 1320105600)
if ($created[$i] < 1322697600)
{
$count11_11[] =$created[$i];
}
if ($created[$i] > 1322697600)
if ($created[$i] < 1325376000)
{
$count11_12[] =$created[$i];
}


if ($created[$i] > 1325376000)
if ($created[$i] < 1328054400)
{
$count12_1[] =$created[$i];
}
if ($created[$i] > 1328054400)
if ($created[$i] < 1330560000)
{
$count12_2[] =$created[$i];
}
if ($created[$i] > 1330560000)
if ($created[$i] < 1333238400)
{
$count12_3[] =$created[$i];
}
if ($created[$i] > 1333238400)
if ($created[$i] < 1335830400)
{
$count12_4[] =$created[$i];
}
if ($created[$i] > 1335830400)
if ($created[$i] < 1338508800)
{
$count12_5[] =$created[$i];
}
if ($created[$i] > 1338508800)
if ($created[$i] < 1341100800)
{
$count12_6[] =$created[$i];
}
if ($created[$i] > 1341100800)
if ($created[$i] < 1343779200)
{
$count12_7[] =$created[$i];
}
if ($created[$i] > 1343779200)
if ($created[$i] < 1346457600)
{
$count12_8[] =$created[$i];
}
if ($created[$i] > 1346457600)
if ($created[$i] < 1349049600)
{
$count12_9[] =$created[$i];
}
if ($created[$i] > 1349049600)
if ($created[$i] < 1351728000)
{
$count12_10[] =$created[$i];
}
}


if (empty($count10_1)){$r2010_1 = "0";} else{$r2010_1 =count($count10_1);}
if (empty($count10_2)){$r2010_2 = "0";} else{$r2010_2 =count($count10_2);}
if (empty($count10_3)){$r2010_3 = "0";} else{$r2010_3 =count($count10_3);}
if (empty($count10_4)){$r2010_4 = "0";} else{$r2010_4 =count($count10_4);}
if (empty($count10_5)){$r2010_5 = "0";} else{$r2010_5 =count($count10_5);}
if (empty($count10_6)){$r2010_6 = "0";} else{$r2010_6 =count($count10_6);}
if (empty($count10_7)){$r2010_7 = "0";} else{$r2010_7 =count($count10_7);}
if (empty($count10_8)){$r2010_8 = "0";} else{$r2010_8 =count($count10_8);}
if (empty($count10_9)){$r2010_9 = "0";} else{$r2010_9 =count($count10_9);}
if (empty($count10_10)){$r2010_10 = "0";} else{$r2010_10 =count($count10_10);}
if (empty($count10_11)){$r2010_11 = "0";} else{$r2010_11 =count($count10_11);}
if (empty($count10_12)){$r2010_12 = "0";} else{$r2010_12 =count($count10_12);}

if (empty($count11_1)){$r2011_1 = "0";} else{$r2011_1 =count($count11_1);}
if (empty($count11_2)){$r2011_2 = "0";} else{$r2011_2 =count($count11_2);}
if (empty($count11_3)){$r2011_3 = "0";} else{$r2011_3 =count($count11_3);}
if (empty($count11_4)){$r2011_4 = "0";} else{$r2011_4 =count($count11_4);}
if (empty($count11_5)){$r2011_5 = "0";} else{$r2011_5 =count($count11_5);}
if (empty($count11_6)){$r2011_6 = "0";} else{$r2011_6 =count($count11_6);}
if (empty($count11_7)){$r2011_7 = "0";} else{$r2011_7 =count($count11_7);}
if (empty($count11_8)){$r2011_8 = "0";} else{$r2011_8 =count($count11_8);}
if (empty($count11_9)){$r2011_9 = "0";} else{$r2011_9 =count($count11_9);}
if (empty($count11_10)){$r2011_10 = "0";} else{$r2011_10 =count($count11_10);}
if (empty($count11_11)){$r2011_11 = "0";} else{$r2011_11 =count($count11_11);}
if (empty($count11_12)){$r2011_12 = "0";} else{$r2011_12 =count($count11_12);}

if (empty($count12_1)){$r2012_1 = "0";} else{$r2012_1 =count($count12_1);}
if (empty($count12_2)){$r2012_2 = "0";} else{$r2012_2 =count($count12_2);}
if (empty($count12_3)){$r2012_3 = "0";} else{$r2012_3 =count($count12_3);}
if (empty($count12_4)){$r2012_4 = "0";} else{$r2012_4 =count($count12_4);}
if (empty($count12_5)){$r2012_5 = "0";} else{$r2012_5 =count($count12_5);}
if (empty($count12_6)){$r2012_6 = "0";} else{$r2012_6 =count($count12_6);}
if (empty($count12_7)){$r2012_7 = "0";} else{$r2012_7 =count($count12_7);}
if (empty($count12_8)){$r2012_8 = "0";} else{$r2012_8 =count($count12_8);}
if (empty($count12_9)){$r2012_9 = "0";} else{$r2012_9 =count($count12_9);}
if (empty($count12_10)){$r2012_10 = "0";} else{$r2012_10 =count($count12_10);}
 
   
$graph_photo_array=array($r2010_1,$r2010_2,$r2010_3,$r2010_4,$r2010_5,$r2010_6,$r2010_7,$r2010_8,$r2010_9,$r2010_10,$r2010_11,$r2010_12,
                   $r2011_1,$r2011_2,$r2011_3,$r2011_4,$r2011_5,$r2011_6,$r2011_7,$r2011_8,$r2011_9,$r2011_10,$r2011_11,$r2011_12,
                   $r2012_1,$r2012_2,$r2012_3,$r2012_4,$r2012_5,$r2012_6,$r2012_7,$r2012_8,$r2012_9,$r2012_10);
$graph_photo_ceil=ceil(max($graph_photo_array)/10);                   
$max_graph_photo = $graph_photo_ceil*10;

$photo_amount=array_sum($graph_photo_array);
  

 // Dataset definition 
 $DataSet = new pData;
 $DataSet->AddPoint($graph_photo_array,"Serie1");
// $DataSet->AddPoint(array(),"Serie2");
 $DataSet->AddPoint(array("January 10","","","April 10","","","July 10","","","October 10","","",
                          "January 11","","","April 11","","","July 11","","","October 11","","",
                          "January 12","","","April 12","","","July 12","","","October 12"),"Serie3");
 $DataSet->AddAllSeries();
 $DataSet->RemoveSerie("Serie3");
// $DataSet->RemoveSerie("Serie2");
 $DataSet->SetAbsciseLabelSerie("Serie3");
 $DataSet->SetSerieName("Amount of Pictures","Serie1");
 $DataSet->SetYAxisUnit();
 
 // Initialise the graph 
 $Test = new pChart(790,340);
 $Test->drawGraphAreaGradient(90,90,90,90,TARGET_BACKGROUND);
 $Test->setFixedScale(0,$max_graph_photo);  

 // Graph area setup
 $Test->setFontProperties("libs/pChart/Fonts/arial.ttf",8);
 $Test->setGraphArea(35,40,750,300);
 $Test->drawGraphArea(200,200,200,FALSE);
 
  
 $Test->drawScale($DataSet->GetData(),$DataSet->GetDataDescription(),SCALE_NORMAL,200,200,200,TRUE,0,2);
 $Test->drawGraphAreaGradient(40,40,40,-50);
 $Test->drawGrid(4,TRUE,230,230,230,10);
 $Test->SetColorPalette(0,120,208,5);
 // Draw the line chart
 $Test->setShadowProperties(3,3,0,0,0,30,4);
 $Test->drawCubicCurve($DataSet->GetData(),$DataSet->GetDataDescription());
 $Test->clearShadow();
 $Test->drawPlotGraph($DataSet->GetData(),$DataSet->GetDataDescription(),3,0,-1,-1,-1,TRUE);
      
 // Write the title
 $Test->setFontProperties("libs/pChart/Fonts/arialbd.ttf",18);
 $Test->setShadowProperties(1,1,0,0,0);
 $Test->drawTitle(60,0,"Pictures",255,255,255,100,40,TRUE);
 $Test->clearShadow();

 // Draw the legend
 $Test->setFontProperties("libs/pChart/Fonts/arial.ttf",12);
 $Test->drawLegend(610,5,$DataSet->GetDataDescription(),0,0,0,0,0,0,255,255,255,FALSE);

 // Render the picture
// header("Content-Type: image/png");
 $Test->render("pic/photo/". $user_uid .".png");
 
 //$obr = imagecreatefrompng("pic/". $user_uid .".png"); 
    
?>