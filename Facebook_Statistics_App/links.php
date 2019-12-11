<?php


  $link_url = 'https://graph.facebook.com/'
        . '/me/links?fields=created_time,link&limit=5000&since=1262304000'
        . '&access_token=' . $params['access_token'];
  $link_result = file_get_contents($link_url);
  $link_obj = json_decode($link_result, true);
  $link_test = $link_obj['data'];
if (!empty($link_test)) { 
     
  foreach ($link_test as $link_value_check) {
          $link_created_check[] = $link_value_check['created_time']; }          
  foreach ($link_created_check as $link_timestamp_check) {
          $link_timestamp[] = strtotime($link_timestamp_check); }  
         
} 
else {$link_timestamp=array('0'=>'0');} 


for ($t=0;$t<count($link_timestamp);$t++)
{
if ($link_timestamp[$t] > 1262304000)
if ($link_timestamp[$t] < 1264982400)
{
$link_count10_1[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1264982400)
if ($link_timestamp[$t] < 1267401600)
{
$link_count10_2[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1267401600)
if ($link_timestamp[$t] < 1270080000)
{
$link_count10_3[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1270080000)
if ($link_timestamp[$t] < 1272672000)
{
$link_count10_4[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1272672000)
if ($link_timestamp[$t] < 1275350400)
{
$link_count10_5[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1275350400)
if ($link_timestamp[$t] < 1277942400)
{
$link_count10_6[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1277942400)
if ($link_timestamp[$t] < 1280620800)
{
$link_count10_7[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1280620800)
if ($link_timestamp[$t] < 1283299200)
{
$link_count10_8[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1283299200)
if ($link_timestamp[$t] < 1285891200)
{
$link_count10_9[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1285891200)
if ($link_timestamp[$t] < 1288569600)
{
$link_count10_10[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1288569600)
if ($link_timestamp[$t] < 1291161600)
{
$link_count10_11[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1291161600)
if ($link_timestamp[$t] < 1293840000)
{
$link_count10_12[] =$link_timestamp[$t];
}


if ($link_timestamp[$t] > 1293840000)
if ($link_timestamp[$t] < 1296518400)
{
$link_count11_1[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1296518400)
if ($link_timestamp[$t] < 1298937600)
{
$link_count11_2[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1298937600)
if ($link_timestamp[$t] < 1301616000)
{
$link_count11_3[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1301616000)
if ($link_timestamp[$t] < 1304208000)
{
$link_count11_4[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1304208000)
if ($link_timestamp[$t] < 1306886400)
{
$link_count11_5[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1306886400)
if ($link_timestamp[$t] < 1309478400)
{
$link_count11_6[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1309478400)
if ($link_timestamp[$t] < 1312156800)
{
$link_count11_7[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1312156800)
if ($link_timestamp[$t] < 1314835200)
{
$link_count11_8[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1314835200)
if ($link_timestamp[$t] < 1317427200)
{
$link_count11_9[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1317427200)
if ($link_timestamp[$t] < 1320105600)
{
$link_count11_10[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1320105600)
if ($link_timestamp[$t] < 1322697600)
{
$link_count11_11[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1322697600)
if ($link_timestamp[$t] < 1325376000)
{
$link_count11_12[] =$link_timestamp[$t];
}


if ($link_timestamp[$t] > 1325376000)
if ($link_timestamp[$t] < 1328054400)
{
$link_count12_1[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1328054400)
if ($link_timestamp[$t] < 1330560000)
{
$link_count12_2[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1330560000)
if ($link_timestamp[$t] < 1333238400)
{
$link_count12_3[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1333238400)
if ($link_timestamp[$t] < 1335830400)
{
$link_count12_4[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1335830400)
if ($link_timestamp[$t] < 1338508800)
{
$link_count12_5[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1338508800)
if ($link_timestamp[$t] < 1341100800)
{
$link_count12_6[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1341100800)
if ($link_timestamp[$t] < 1343779200)
{
$link_count12_7[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1343779200)
if ($link_timestamp[$t] < 1346457600)
{
$link_count12_8[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1346457600)
if ($link_timestamp[$t] < 1349049600)
{
$link_count12_9[] =$link_timestamp[$t];
}
if ($link_timestamp[$t] > 1349049600)
if ($link_timestamp[$t] < 1351728000)
{
$link_count12_10[] =$link_timestamp[$t];
}
}


if (empty($link_count10_1)){$link_r2010_1 = "0";} else{$link_r2010_1 =count($link_count10_1);}
if (empty($link_count10_2)){$link_r2010_2 = "0";} else{$link_r2010_2 =count($link_count10_2);}
if (empty($link_count10_3)){$link_r2010_3 = "0";} else{$link_r2010_3 =count($link_count10_3);}
if (empty($link_count10_4)){$link_r2010_4 = "0";} else{$link_r2010_4 =count($link_count10_4);}
if (empty($link_count10_5)){$link_r2010_5 = "0";} else{$link_r2010_5 =count($link_count10_5);}
if (empty($link_count10_6)){$link_r2010_6 = "0";} else{$link_r2010_6 =count($link_count10_6);}
if (empty($link_count10_7)){$link_r2010_7 = "0";} else{$link_r2010_7 =count($link_count10_7);}
if (empty($link_count10_8)){$link_r2010_8 = "0";} else{$link_r2010_8 =count($link_count10_8);}
if (empty($link_count10_9)){$link_r2010_9 = "0";} else{$link_r2010_9 =count($link_count10_9);}
if (empty($link_count10_10)){$link_r2010_10 = "0";} else{$link_r2010_10 =count($link_count10_10);}
if (empty($link_count10_11)){$link_r2010_11 = "0";} else{$link_r2010_11 =count($link_count10_11);}
if (empty($link_count10_12)){$link_r2010_12 = "0";} else{$link_r2010_12 =count($link_count10_12);}

if (empty($link_count11_1)){$link_r2011_1 = "0";} else{$link_r2011_1 =count($link_count11_1);}
if (empty($link_count11_2)){$link_r2011_2 = "0";} else{$link_r2011_2 =count($link_count11_2);}
if (empty($link_count11_3)){$link_r2011_3 = "0";} else{$link_r2011_3 =count($link_count11_3);}
if (empty($link_count11_4)){$link_r2011_4 = "0";} else{$link_r2011_4 =count($link_count11_4);}
if (empty($link_count11_5)){$link_r2011_5 = "0";} else{$link_r2011_5 =count($link_count11_5);}
if (empty($link_count11_6)){$link_r2011_6 = "0";} else{$link_r2011_6 =count($link_count11_6);}
if (empty($link_count11_7)){$link_r2011_7 = "0";} else{$link_r2011_7 =count($link_count11_7);}
if (empty($link_count11_8)){$link_r2011_8 = "0";} else{$link_r2011_8 =count($link_count11_8);}
if (empty($link_count11_9)){$link_r2011_9 = "0";} else{$link_r2011_9 =count($link_count11_9);}
if (empty($link_count11_10)){$link_r2011_10 = "0";} else{$link_r2011_10 =count($link_count11_10);}
if (empty($link_count11_11)){$link_r2011_11 = "0";} else{$link_r2011_11 =count($link_count11_11);}
if (empty($link_count11_12)){$link_r2011_12 = "0";} else{$link_r2011_12 =count($link_count11_12);}

if (empty($link_count12_1)){$link_r2012_1 = "0";} else{$link_r2012_1 =count($link_count12_1);}
if (empty($link_count12_2)){$link_r2012_2 = "0";} else{$link_r2012_2 =count($link_count12_2);}
if (empty($link_count12_3)){$link_r2012_3 = "0";} else{$link_r2012_3 =count($link_count12_3);}
if (empty($link_count12_4)){$link_r2012_4 = "0";} else{$link_r2012_4 =count($link_count12_4);}
if (empty($link_count12_5)){$link_r2012_5 = "0";} else{$link_r2012_5 =count($link_count12_5);}
if (empty($link_count12_6)){$link_r2012_6 = "0";} else{$link_r2012_6 =count($link_count12_6);}
if (empty($link_count12_7)){$link_r2012_7 = "0";} else{$link_r2012_7 =count($link_count12_7);}
if (empty($link_count12_8)){$link_r2012_8 = "0";} else{$link_r2012_8 =count($link_count12_8);}
if (empty($link_count12_9)){$link_r2012_9 = "0";} else{$link_r2012_9 =count($link_count12_9);}
if (empty($link_count12_10)){$link_r2012_10 = "0";} else{$link_r2012_10 =count($link_count12_10);}




$graph_link_array=array($link_r2010_1,$link_r2010_2,$link_r2010_3,$link_r2010_4,$link_r2010_5,$link_r2010_6,$link_r2010_7,$link_r2010_8,$link_r2010_9,$link_r2010_10,$link_r2010_11,$link_r2010_12,
                        $link_r2011_1,$link_r2011_2,$link_r2011_3,$link_r2011_4,$link_r2011_5,$link_r2011_6,$link_r2011_7,$link_r2011_8,$link_r2011_9,$link_r2011_10,$link_r2011_11,$link_r2011_12,
                        $link_r2012_1,$link_r2012_2,$link_r2012_3,$link_r2012_4,$link_r2012_5,$link_r2012_6,$link_r2012_7,$link_r2012_8,$link_r2012_9,$link_r2012_10);
$graph_link_ceil=ceil(max($graph_link_array)/10);                   
$max_graph_link = $graph_link_ceil*10;

$link_amount=array_sum($graph_link_array);


 // Dataset definition 
 $DataSet = new pData;
 $DataSet->AddPoint($graph_link_array,"Serie1");
// $DataSet->AddPoint(array(),"Serie2");
 $DataSet->AddPoint(array("January 10","","","April 10","","","July 10","","","October 10","","",
                          "January 11","","","April 11","","","July 11","","","October 11","","",
                          "January 12","","","April 12","","","July 12","","","October 12"),"Serie3");
 $DataSet->AddAllSeries();
 $DataSet->RemoveSerie("Serie3");
// $DataSet->RemoveSerie("Serie2");
 $DataSet->SetAbsciseLabelSerie("Serie3");
 $DataSet->SetSerieName("Amount of Links","Serie1");
 $DataSet->SetYAxisUnit();
 
 // Initialise the graph 
 $Test = new pChart(790,340);
 $Test->drawGraphAreaGradient(90,90,90,90,TARGET_BACKGROUND);
 $Test->setFixedScale(0,$max_graph_link);  

 // Graph area setup
 $Test->setFontProperties("libs/pChart//Fonts/arial.ttf",8);
 $Test->setGraphArea(35,40,750,300);
 $Test->drawGraphArea(200,200,200,FALSE);
 
  
 $Test->drawScale($DataSet->GetData(),$DataSet->GetDataDescription(),SCALE_NORMAL,200,200,200,TRUE,0,2);
 $Test->drawGraphAreaGradient(40,40,40,-50);
 $Test->drawGrid(4,TRUE,230,230,230,10);
 $Test->SetColorPalette(0,255,0,0);  
 // Draw the line chart
 $Test->setShadowProperties(3,3,0,0,0,30,4);
 $Test->drawCubicCurve($DataSet->GetData(),$DataSet->GetDataDescription());
 $Test->clearShadow();
 $Test->drawPlotGraph($DataSet->GetData(),$DataSet->GetDataDescription(),3,0,-1,-1,-1,TRUE);

 // Write the title
 $Test->setFontProperties("libs/pChart/Fonts/arialbd.ttf",18);
 $Test->setShadowProperties(1,1,0,0,0);
 $Test->drawTitle(33,0,"Links",255,255,255,100,40,TRUE);
 $Test->clearShadow();

 // Draw the legend
 $Test->setFontProperties("libs/pChart/Fonts/arial.ttf",12);
 $Test->drawLegend(610,5,$DataSet->GetDataDescription(),0,0,0,0,0,0,255,255,255,FALSE);

 // Render the picture
  $Test->render("pic/link/". $user_uid .".png"); 






?>
