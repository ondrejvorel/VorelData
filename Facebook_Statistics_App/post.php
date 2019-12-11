<?php
                    
// Nastaveni promenych: p = umisteni v retezci post_array, curOffset = posunuti pri vyberu z api (nelze ziskat vice nez 100 hodnot najednou)         
              
$post_p = 0;              
$post_curOffset = 0;

// Ziskani vystupnich retezcu z Graph API, zaroven ulozeni vystupnich dat do prislusne pozice post_array. Proces je nutne opakovat vikrat, jelikoz Graph API je schopny ukazat casovou radu v davce(batch) 100 zaznamu.
 do  {
       $post_url = 'https://graph.facebook.com/'
        . '/me/statuses?fields=updated_time,message&limit=100&offset='.$post_curOffset.''
        . '&access_token=' . $params['access_token']; 
       $post_result = file_get_contents($post_url);
       $post_obj= json_decode($post_result, true); 
       $post_test=$post_obj['data'];
if (!empty($post_test)) {      
      
       $post_array[$post_p]=$post_obj['data'];  
       $post_p=$post_p+1;   
      
       $post_curOffset = $post_curOffset + 100;
                                              
// Samostatne hodnoty update_time je mozne ziskat pouze pomoci dvojiteho vnoreni do post_array, pomoci foreach se prochazi kazdy prvek retezce zvlast
  foreach ($post_test as $post_value_check) {
  foreach ($post_value_check as $post_value1_check) 
   { $post_created_check[] = $post_value1_check["updated_time"]; }}
   
// Podobne jako u predchoziho kroku, pouze nyni je foreach vyuzit spolecne s funkci strtotime k prevedeni bezneho datumu do UNIX timestamp 
  foreach ($post_created_check as $post_timestamp1_check) 
   { $post_timestamp_check[] = strtotime($post_timestamp1_check); }       
// pruchod hodnot retezce post_timestamp_check, pokud je nalezena hodnota datumu mensi nez rok 2010 je nastavena pomocna promena lastBatch na 1, pokud tomu tak neni, tak lastBatch=0  
  foreach ($post_timestamp_check as $post_before_2010)
   { if ($post_before_2010 < 1262304000)
         $post_lastBatch=1; else{$post_lastBatch = 0;}} 
   
   if(empty($post_test[39]))
         $post_lastBatch=1;    
    else{$post_lastBatch = 0;} 

} 
else {$post_lastBatch=1;} 
                           
// Pokud byla v retezci post_timestamp_check (kde se nachazi retezec ziskanych hodnot UNIX timestamp) nalezena hodnota mensi nez datum pocinajici rokem 2010 je ukoncen puvodni ciklus "do"   
     } while($post_lastBatch<1);
    
if (!empty($post_array)) { 
// Pro dalsi vypocet je nutne opet prevest post_array na retezec UNIX timestamp. Z predchozicho post_timestamp_check nelze vychazet jelikoz byl trikrat prepsan, k dalsim vypoctum je nutne aby hodnoty byli zapsany pouze jednou. 
  foreach ($post_array as $post_value) {
  foreach ($post_value as $post_value1) 
   { $post_created[] = $post_value1["updated_time"]; }}
  foreach ($post_created as $post_timestamp1) 
   { $post_timestamp[] = strtotime($post_timestamp1); }

} 
else {$post_timestamp=array('0'=>'0');}  


for ($t=0;$t<count($post_timestamp);$t++)
{
if ($post_timestamp[$t] > 1262304000)
if ($post_timestamp[$t] < 1264982400)
{
$post_count10_1[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1264982400)
if ($post_timestamp[$t] < 1267401600)
{
$post_count10_2[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1267401600)
if ($post_timestamp[$t] < 1270080000)
{
$post_count10_3[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1270080000)
if ($post_timestamp[$t] < 1272672000)
{
$post_count10_4[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1272672000)
if ($post_timestamp[$t] < 1275350400)
{
$post_count10_5[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1275350400)
if ($post_timestamp[$t] < 1277942400)
{
$post_count10_6[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1277942400)
if ($post_timestamp[$t] < 1280620800)
{
$post_count10_7[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1280620800)
if ($post_timestamp[$t] < 1283299200)
{
$post_count10_8[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1283299200)
if ($post_timestamp[$t] < 1285891200)
{
$post_count10_9[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1285891200)
if ($post_timestamp[$t] < 1288569600)
{
$post_count10_10[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1288569600)
if ($post_timestamp[$t] < 1291161600)
{
$post_count10_11[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1291161600)
if ($post_timestamp[$t] < 1293840000)
{
$post_count10_12[] =$post_timestamp[$t];
}


if ($post_timestamp[$t] > 1293840000)
if ($post_timestamp[$t] < 1296518400)
{
$post_count11_1[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1296518400)
if ($post_timestamp[$t] < 1298937600)
{
$post_count11_2[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1298937600)
if ($post_timestamp[$t] < 1301616000)
{
$post_count11_3[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1301616000)
if ($post_timestamp[$t] < 1304208000)
{
$post_count11_4[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1304208000)
if ($post_timestamp[$t] < 1306886400)
{
$post_count11_5[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1306886400)
if ($post_timestamp[$t] < 1309478400)
{
$post_count11_6[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1309478400)
if ($post_timestamp[$t] < 1312156800)
{
$post_count11_7[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1312156800)
if ($post_timestamp[$t] < 1314835200)
{
$post_count11_8[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1314835200)
if ($post_timestamp[$t] < 1317427200)
{
$post_count11_9[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1317427200)
if ($post_timestamp[$t] < 1320105600)
{
$post_count11_10[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1320105600)
if ($post_timestamp[$t] < 1322697600)
{
$post_count11_11[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1322697600)
if ($post_timestamp[$t] < 1325376000)
{
$post_count11_12[] =$post_timestamp[$t];
}


if ($post_timestamp[$t] > 1325376000)
if ($post_timestamp[$t] < 1328054400)
{
$post_count12_1[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1328054400)
if ($post_timestamp[$t] < 1330560000)
{
$post_count12_2[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1330560000)
if ($post_timestamp[$t] < 1333238400)
{
$post_count12_3[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1333238400)
if ($post_timestamp[$t] < 1335830400)
{
$post_count12_4[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1335830400)
if ($post_timestamp[$t] < 1338508800)
{
$post_count12_5[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1338508800)
if ($post_timestamp[$t] < 1341100800)
{
$post_count12_6[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1341100800)
if ($post_timestamp[$t] < 1343779200)
{
$post_count12_7[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1343779200)
if ($post_timestamp[$t] < 1346457600)
{
$post_count12_8[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1346457600)
if ($post_timestamp[$t] < 1349049600)
{
$post_count12_9[] =$post_timestamp[$t];
}
if ($post_timestamp[$t] > 1349049600)
if ($post_timestamp[$t] < 1351728000)
{
$post_count12_10[] =$post_timestamp[$t];
}
}

if (empty($post_count10_1)){$post_r2010_1 = "0";} else{$post_r2010_1 =count($post_count10_1);}
if (empty($post_count10_2)){$post_r2010_2 = "0";} else{$post_r2010_2 =count($post_count10_2);}
if (empty($post_count10_3)){$post_r2010_3 = "0";} else{$post_r2010_3 =count($post_count10_3);}
if (empty($post_count10_4)){$post_r2010_4 = "0";} else{$post_r2010_4 =count($post_count10_4);}
if (empty($post_count10_5)){$post_r2010_5 = "0";} else{$post_r2010_5 =count($post_count10_5);}
if (empty($post_count10_6)){$post_r2010_6 = "0";} else{$post_r2010_6 =count($post_count10_6);}
if (empty($post_count10_7)){$post_r2010_7 = "0";} else{$post_r2010_7 =count($post_count10_7);}
if (empty($post_count10_8)){$post_r2010_8 = "0";} else{$post_r2010_8 =count($post_count10_8);}
if (empty($post_count10_9)){$post_r2010_9 = "0";} else{$post_r2010_9 =count($post_count10_9);}
if (empty($post_count10_10)){$post_r2010_10 = "0";} else{$post_r2010_10 =count($post_count10_10);}
if (empty($post_count10_11)){$post_r2010_11 = "0";} else{$post_r2010_11 =count($post_count10_11);}
if (empty($post_count10_12)){$post_r2010_12 = "0";} else{$post_r2010_12 =count($post_count10_12);}

if (empty($post_count11_1)){$post_r2011_1 = "0";} else{$post_r2011_1 =count($post_count11_1);}
if (empty($post_count11_2)){$post_r2011_2 = "0";} else{$post_r2011_2 =count($post_count11_2);}
if (empty($post_count11_3)){$post_r2011_3 = "0";} else{$post_r2011_3 =count($post_count11_3);}
if (empty($post_count11_4)){$post_r2011_4 = "0";} else{$post_r2011_4 =count($post_count11_4);}
if (empty($post_count11_5)){$post_r2011_5 = "0";} else{$post_r2011_5 =count($post_count11_5);}
if (empty($post_count11_6)){$post_r2011_6 = "0";} else{$post_r2011_6 =count($post_count11_6);}
if (empty($post_count11_7)){$post_r2011_7 = "0";} else{$post_r2011_7 =count($post_count11_7);}
if (empty($post_count11_8)){$post_r2011_8 = "0";} else{$post_r2011_8 =count($post_count11_8);}
if (empty($post_count11_9)){$post_r2011_9 = "0";} else{$post_r2011_9 =count($post_count11_9);}
if (empty($post_count11_10)){$post_r2011_10 = "0";} else{$post_r2011_10 =count($post_count11_10);}
if (empty($post_count11_11)){$post_r2011_11 = "0";} else{$post_r2011_11 =count($post_count11_11);}
if (empty($post_count11_12)){$post_r2011_12 = "0";} else{$post_r2011_12 =count($post_count11_12);}

if (empty($post_count12_1)){$post_r2012_1 = "0";} else{$post_r2012_1 =count($post_count12_1);}
if (empty($post_count12_2)){$post_r2012_2 = "0";} else{$post_r2012_2 =count($post_count12_2);}
if (empty($post_count12_3)){$post_r2012_3 = "0";} else{$post_r2012_3 =count($post_count12_3);}
if (empty($post_count12_4)){$post_r2012_4 = "0";} else{$post_r2012_4 =count($post_count12_4);}
if (empty($post_count12_5)){$post_r2012_5 = "0";} else{$post_r2012_5 =count($post_count12_5);}
if (empty($post_count12_6)){$post_r2012_6 = "0";} else{$post_r2012_6 =count($post_count12_6);}
if (empty($post_count12_7)){$post_r2012_7 = "0";} else{$post_r2012_7 =count($post_count12_7);}
if (empty($post_count12_8)){$post_r2012_8 = "0";} else{$post_r2012_8 =count($post_count12_8);}
if (empty($post_count12_9)){$post_r2012_9 = "0";} else{$post_r2012_9 =count($post_count12_9);}
if (empty($post_count12_10)){$post_r2012_10 = "0";} else{$post_r2012_10 =count($post_count12_10);}
 

$graph_post_array=array($post_r2010_1,$post_r2010_2,$post_r2010_3,$post_r2010_4,$post_r2010_5,$post_r2010_6,$post_r2010_7,$post_r2010_8,$post_r2010_9,$post_r2010_10,$post_r2010_11,$post_r2010_12,
                        $post_r2011_1,$post_r2011_2,$post_r2011_3,$post_r2011_4,$post_r2011_5,$post_r2011_6,$post_r2011_7,$post_r2011_8,$post_r2011_9,$post_r2011_10,$post_r2011_11,$post_r2011_12,
                        $post_r2012_1,$post_r2012_2,$post_r2012_3,$post_r2012_4,$post_r2012_5,$post_r2012_6,$post_r2012_7,$post_r2012_8,$post_r2012_9,$post_r2012_10);
$graph_post_ceil=ceil(max($graph_post_array)/10);                   
$max_graph_post = $graph_post_ceil*10;

$post_amount=array_sum($graph_post_array);


 // Dataset definition 
 $DataSet = new pData;
 $DataSet->AddPoint($graph_post_array,"Serie1");
 
// $DataSet->AddPoint(array(),"Serie2");
 $DataSet->AddPoint(array("January 10","","","April 10","","","July 10","","","October 10","","",
                          "January 11","","","April 11","","","July 11","","","October 11","","",
                          "January 12","","","April 12","","","July 12","","","October 12"),"Serie3");
 $DataSet->AddAllSeries();
 $DataSet->RemoveSerie("Serie3");
// $DataSet->RemoveSerie("Serie2");
 $DataSet->SetAbsciseLabelSerie("Serie3");
 $DataSet->SetSerieName("Amount of Statuses","Serie1");
 $DataSet->SetYAxisUnit();
 

 
 
 // Initialise the graph 
 $Test = new pChart(790,340);
 $Test->drawGraphAreaGradient(90,90,90,90,TARGET_BACKGROUND);
 $Test->setFixedScale(0,$max_graph_post);  

 // Graph area setup
 $Test->setFontProperties("libs/pChart/Fonts/arial.ttf",8);
 $Test->setGraphArea(35,40,750,300);
 $Test->drawGraphArea(200,200,200,FALSE);
 
  
 $Test->drawScale($DataSet->GetData(),$DataSet->GetDataDescription(),SCALE_NORMAL,200,200,200,TRUE,0,2);
 $Test->drawGraphAreaGradient(40,40,40,-50);
 $Test->drawGrid(4,TRUE,230,230,230,10);
 $Test->SetColorPalette(0,32,175,224);
 // Draw the line chart
 $Test->setShadowProperties(3,3,0,0,0,30,4);
 $Test->drawCubicCurve($DataSet->GetData(),$DataSet->GetDataDescription());
 $Test->clearShadow();
 $Test->drawPlotGraph($DataSet->GetData(),$DataSet->GetDataDescription(),3,0,-1,-1,-1,TRUE);

 // Write the title
 $Test->setFontProperties("libs/pChart/Fonts/arialbd.ttf",18);
 $Test->setShadowProperties(1,1,0,0,0);
 $Test->drawTitle(62,0,"Statuses",255,255,255,100,40,TRUE);
 $Test->clearShadow();

 // Draw the legend
 $Test->setFontProperties("libs/pChart/Fonts/arial.ttf",12);
 $Test->drawLegend(610,5,$DataSet->GetDataDescription(),0,0,0,0,0,0,255,255,255,FALSE);

 // Render the picture
  $Test->render("pic/status/". $user_uid .".png");





?>