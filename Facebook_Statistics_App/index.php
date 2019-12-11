    <?php
// Údaje z https://www.facebook.com/developers/
   $app_id = "309410002500021";
   $app_secret = "c90a87b050211cbdb6b5a796edcb8907";
   $my_url = "https://apps.facebook.com/profile-statistics/";
   $extended_permissions = "publish_stream,user_activities,friends_activities,user_birthday,friends_birthday,user_checkins,friends_checkins,user_hometown,user_location,friends_location,user_photos,friends_photos,user_status,friends_status,user_videos,friends_videos,user_about_me,read_stream,read_friendlists,publish_checkins,publish_stream";
   
   session_start(); 
    
    $code = $_REQUEST["code"];

   if(empty($code)) {
     $_SESSION['state'] = md5(uniqid(rand(), TRUE)); // CSRF protection
     $dialog_url = "https://www.facebook.com/dialog/oauth?client_id=" 
       . $app_id . "&redirect_uri=" . urlencode($my_url) . "&state="
       . $_SESSION['state'] . "&scope=" . $extended_permissions;

     echo("<script> top.location.href='" . $dialog_url . "'</script>");
   }
    
    if($_SESSION['state'] && ($_SESSION['state'] === $_REQUEST['state'])) {
     $token_url = "https://graph.facebook.com/oauth/access_token?"
       . "client_id=" . $app_id . "&redirect_uri=" . urlencode($my_url)
       . "&client_secret=" . $app_secret . "&code=" . $code;

     $response = file_get_contents($token_url);
     $params = null;
     parse_str($response, $params);

     $_SESSION['access_token'] = $params['access_token']; 
    



 include("libs/pChart/pChart/pData.class");
 include("libs/pChart/pChart/pChart.class");




require_once 'personal_details.php';
  
require_once 'photo.php';

require_once 'post.php';

require_once 'location.php';

require_once 'links.php';

$UID_file = file_get_contents('/home/andrew58/public_html/UID.TXT');
if(preg_match("@".$user_uid."@",$UID_file)<1){
file_put_contents('/home/andrew58/public_html/UID.TXT', $user_uid ." ", FILE_APPEND | LOCK_EX);
require_once 'excel_zapis.php';  
    }
    
}
else {




 require 'libs/facebook.php'; // USE FACEBOOK PHP SDK

        $extended_permissions = "publish_stream,user_activities,friends_activities,user_birthday,friends_birthday,user_checkins,friends_checkins,user_hometown,user_location,friends_location,user_photos,friends_photos,user_status,friends_status,user_videos,friends_videos,user_about_me,read_stream,read_friendlists,publish_checkins,publish_stream";
        $facebook = new Facebook(array(
          'appId'  => '309410002500021',
          'secret' => 'c90a87b050211cbdb6b5a796edcb8907',
        ));
     
        // Get User ID
        $user = $facebook->getUser();

        if ($user) {
          try {
            $params['access_token'] = $facebook->getAccessToken();
            
             include("libs/pChart/pChart/pData.class");
             include("libs/pChart/pChart/pChart.class");


              require_once 'personal_details.php';
  
              require_once 'photo.php';

              require_once 'post.php';

              require_once 'location.php';

              require_once 'links.php';

              $UID_file = file_get_contents('/home/andrew58/public_html/UID.TXT');
              if(preg_match("@".$user_uid."@",$UID_file)<1){
              file_put_contents('/home/andrew58/public_html/UID.TXT', $user_uid ." ", FILE_APPEND | LOCK_EX);
              require_once 'excel_zapis.php';  }
                 
          } catch (FacebookApiException $e) {
            error_log($e);
            $user = null;
          } 
        }   
   
     if ($user) {
          $logoutUrl = $facebook->getLogoutUrl();
        } else {
          $loginUrl = $facebook->getLoginUrl(array('scope' => 'publish_stream,user_activities,friends_activities,user_birthday,friends_birthday,user_checkins,friends_checkins,user_hometown,user_location,friends_location,user_photos,friends_photos,user_status,friends_status,user_videos,friends_videos,user_about_me,read_stream,read_friendlists,publish_checkins,publish_stream',
                                                   'redirect_uri' => 'https://apps.facebook.com/profile-statistics/'));
          
        }  



     }  
        
?>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">


        <head>
                <meta charset="utf-8">
                <title>Profile Statistics</title>
                <link rel="stylesheet" type="text/css" href="statisticsCSS.css" /> 
        </head>
        
        <body> 
        <div id="header">
		<h1>Profile Statistics</h1>
	</div>
 
<div id="wrap"> 
<h2 class="personal">Personal Details</h2>
<b>Name: </b><?php echo $user_name; ?> <br>
<b>Birth: </b><?php echo $birthday_date; ?> <br> 
<b>Country: </b><?php echo $city; ?> <br> 
<b>City: </b><?php echo $country; ?> <br>              
                    
<h2 class="pictures">Photos in your albums</h2>      
         
      <table frame="border" rules="all" cellpadding="2px">
      <tr id="photo_dark"><td id="photo_corner"></td><th colspan="12">&nbspMonth</th></tr>
      <tr id="photo_light"><th id="photo_dark" width ="40px">Year</th><td width ="60px">January</td><td width ="60px">February</td><td width ="60px">March</td><td width ="60px">April</td><td width ="60px">May</td><td width ="60px">June</td><td width ="60px">July</td><td width ="60px">August</td><td width ="60px">September</td><td width ="60px">October</td><td width ="60px">November</td><td width ="60px">December</td></tr>
      <tr><td id="photo_light">2010</td><td><?php print($r2010_1);?></td><td><?php print($r2010_2); ?></td><td><?php print($r2010_3);?></td><td><?php print($r2010_4); ?></td><td><?php print($r2010_5);?></td><td><?php print($r2010_6); ?></td><td><?php print($r2010_7);?></td><td><?php print($r2010_8); ?></td><td><?php print($r2010_9);?></td><td><?php print($r2010_10);?></td><td><?php print($r2010_11);?></td><td><?php print($r2010_12);?></td></tr>
      <tr><td id="photo_light">2011</td><td><?php print($r2011_1);?></td><td><?php print($r2011_2); ?></td><td><?php print($r2011_3);?></td><td><?php print($r2011_4); ?></td><td><?php print($r2011_5);?></td><td><?php print($r2011_6); ?></td><td><?php print($r2011_7);?></td><td><?php print($r2011_8); ?></td><td><?php print($r2011_9);?></td><td><?php print($r2011_10);?></td><td><?php print($r2011_11);?></td><td><?php print($r2011_12);?></td></tr>
      <tr><td id="photo_light">2012</td><td><?php print($r2012_1);?></td><td><?php print($r2012_2); ?></td><td><?php print($r2012_3);?></td><td><?php print($r2012_4); ?></td><td><?php print($r2012_5);?></td><td><?php print($r2012_6); ?></td><td><?php print($r2012_7);?></td><td><?php print($r2012_8); ?></td><td><?php print($r2012_9);?></td><td><?php print($r2012_10);?></td><th id="photo_corner" colspan="2">Total: <?php print($photo_amount)?></th></tr>
      </table>
      <br> <?php  echo "<img src=pic/photo/". $user_uid .".png>";  ?>    
<h2 class="statuses">Posted statuses</h2>      
      
      <table frame="border" rules="all" cellpadding="2px">
      <tr id="status_dark"><td id="status_corner"></td><th colspan="12">&nbspMonth</th></tr>
      <tr id="status_light"><th id="status_dark" width ="40px">Year</th><td width ="60px">January</td><td width ="60px">February</td><td width ="60px">March</td><td width ="60px">April</td><td width ="60px">May</td><td width ="60px">June</td><td width ="60px">July</td><td width ="60px">August</td><td width ="60px">September</td><td width ="60px">October</td><td width ="60px">November</td><td width ="60px">December</td></tr>
      <tr><td id="status_light">2010</td><td><?php print($post_r2010_1);?></td><td><?php print($post_r2010_2); ?></td><td><?php print($post_r2010_3);?></td><td><?php print($post_r2010_4); ?></td><td><?php print($post_r2010_5);?></td><td><?php print($post_r2010_6); ?></td><td><?php print($post_r2010_7);?></td><td><?php print($post_r2010_8); ?></td><td><?php print($post_r2010_9);?></td><td><?php print($post_r2010_10);?></td><td><?php print($post_r2010_11);?></td><td><?php print($post_r2010_12);?></td></tr>
      <tr><td id="status_light">2011</td><td><?php print($post_r2011_1);?></td><td><?php print($post_r2011_2); ?></td><td><?php print($post_r2011_3);?></td><td><?php print($post_r2011_4); ?></td><td><?php print($post_r2011_5);?></td><td><?php print($post_r2011_6); ?></td><td><?php print($post_r2011_7);?></td><td><?php print($post_r2011_8); ?></td><td><?php print($post_r2011_9);?></td><td><?php print($post_r2011_10);?></td><td><?php print($post_r2011_11);?></td><td><?php print($post_r2011_12);?></td></tr>
      <tr><td id="status_light">2012</td><td><?php print($post_r2012_1);?></td><td><?php print($post_r2012_2); ?></td><td><?php print($post_r2012_3);?></td><td><?php print($post_r2012_4); ?></td><td><?php print($post_r2012_5);?></td><td><?php print($post_r2012_6); ?></td><td><?php print($post_r2012_7);?></td><td><?php print($post_r2012_8); ?></td><td><?php print($post_r2012_9);?></td><td><?php print($post_r2012_10);?></td><th id="status_corner" colspan="2">Total: <?php print($post_amount)?></th></tr>
      </table>
      <br> <?php  echo "<img src=pic/status/". $user_uid .".png>";  ?> 
<h2 class="locations">Location checkin</h2>      
    
      <table frame="border" rules="all" cellpadding="2px">
      <tr id="location_dark"><td id="location_corner"></td><th colspan="12">&nbspMonth</th></tr>
      <tr id="location_light"><th id="location_dark" width ="40px">Year</th><td width ="60px">January</td><td width ="60px">February</td><td width ="60px">March</td><td width ="60px">April</td><td width ="60px">May</td><td width ="60px">June</td><td width ="60px">July</td><td width ="60px">August</td><td width ="60px">September</td><td width ="60px">October</td><td width ="60px">November</td><td width ="60px">December</td></tr>
      <tr><td id="location_light">2010</td><td><?php print($chiLoc_r2010_1);?></td><td><?php print($chiLoc_r2010_2); ?></td><td><?php print($chiLoc_r2010_3);?></td><td><?php print($chiLoc_r2010_4); ?></td><td><?php print($chiLoc_r2010_5);?></td><td><?php print($chiLoc_r2010_6); ?></td><td><?php print($chiLoc_r2010_7);?></td><td><?php print($chiLoc_r2010_8); ?></td><td><?php print($chiLoc_r2010_9);?></td><td><?php print($chiLoc_r2010_10);?></td><td><?php print($chiLoc_r2010_11);?></td><td><?php print($chiLoc_r2010_12);?></td></tr>
      <tr><td id="location_light">2011</td><td><?php print($chiLoc_r2011_1);?></td><td><?php print($chiLoc_r2011_2); ?></td><td><?php print($chiLoc_r2011_3);?></td><td><?php print($chiLoc_r2011_4); ?></td><td><?php print($chiLoc_r2011_5);?></td><td><?php print($chiLoc_r2011_6); ?></td><td><?php print($chiLoc_r2011_7);?></td><td><?php print($chiLoc_r2011_8); ?></td><td><?php print($chiLoc_r2011_9);?></td><td><?php print($chiLoc_r2011_10);?></td><td><?php print($chiLoc_r2011_11);?></td><td><?php print($chiLoc_r2011_12);?></td></tr>
      <tr><td id="location_light">2012</td><td><?php print($chiLoc_r2012_1);?></td><td><?php print($chiLoc_r2012_2); ?></td><td><?php print($chiLoc_r2012_3);?></td><td><?php print($chiLoc_r2012_4); ?></td><td><?php print($chiLoc_r2012_5);?></td><td><?php print($chiLoc_r2012_6); ?></td><td><?php print($chiLoc_r2012_7);?></td><td><?php print($chiLoc_r2012_8); ?></td><td><?php print($chiLoc_r2012_9);?></td><td><?php print($chiLoc_r2012_10);?></td><th id="location_corner" colspan="2">Total: <?php print($chiLoc_amount)?></th></tr>
      </table>
      <br> <?php  echo "<img src=pic/location/". $user_uid .".png>";  ?> 
<h2 class="links">Posted links</h2>      
  
      <table frame="border" rules="all" cellpadding="2px">
      <tr id="link_dark"><td id="link_corner"></td><th colspan="12">&nbspMonth</th></tr>
      <tr id="link_light"><th id="link_dark" width ="40px">Year</th><td width ="60px">January</td><td width ="60px">February</td><td width ="60px">March</td><td width ="60px">April</td><td width ="60px">May</td><td width ="60px">June</td><td width ="60px">July</td><td width ="60px">August</td><td width ="60px">September</td><td width ="60px">October</td><td width ="60px">November</td><td width ="60px">December</td></tr>
      <tr><td id="link_light">2010</td><td><?php print($link_r2010_1);?></td><td><?php print($link_r2010_2); ?></td><td><?php print($link_r2010_3);?></td><td><?php print($link_r2010_4); ?></td><td><?php print($link_r2010_5);?></td><td><?php print($link_r2010_6); ?></td><td><?php print($link_r2010_7);?></td><td><?php print($link_r2010_8); ?></td><td><?php print($link_r2010_9);?></td><td><?php print($link_r2010_10);?></td><td><?php print($link_r2010_11);?></td><td><?php print($link_r2010_12);?></td></tr>
      <tr><td id="link_light">2011</td><td><?php print($link_r2011_1);?></td><td><?php print($link_r2011_2); ?></td><td><?php print($link_r2011_3);?></td><td><?php print($link_r2011_4); ?></td><td><?php print($link_r2011_5);?></td><td><?php print($link_r2011_6); ?></td><td><?php print($link_r2011_7);?></td><td><?php print($link_r2011_8); ?></td><td><?php print($link_r2011_9);?></td><td><?php print($link_r2011_10);?></td><td><?php print($link_r2011_11);?></td><td><?php print($link_r2011_12);?></td></tr>
      <tr><td id="link_light">2012</td><td><?php print($link_r2012_1);?></td><td><?php print($link_r2012_2); ?></td><td><?php print($link_r2012_3);?></td><td><?php print($link_r2012_4); ?></td><td><?php print($link_r2012_5);?></td><td><?php print($link_r2012_6); ?></td><td><?php print($link_r2012_7);?></td><td><?php print($link_r2012_8); ?></td><td><?php print($link_r2012_9);?></td><td><?php print($link_r2012_10);?></td><th id="link_corner" colspan="2">Total: <?php print($link_amount)?></th></tr>
      </table>
      <br> <?php  echo "<img src=pic/link/". $user_uid .".png>";  ?> 
      
      </div>
      <div id="footer">
		    <h1>Thanks for watching</h1>
	    </div>
        
    </body>  
</html