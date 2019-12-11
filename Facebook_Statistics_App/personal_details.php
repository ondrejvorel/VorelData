<?php

   $personal_details_url = 'https://graph.facebook.com/'
    . 'me?fields=birthday,name,hometown,location'
    . '&access_token=' . $params['access_token']; 
   $personal_details_result = file_get_contents($personal_details_url);
   $personal_details_obj = json_decode($personal_details_result, true);
   
  
  if (empty($personal_details_obj['id'])){$user_uid = "Not specified";} else{$user_uid =$personal_details_obj['id'];}
  if (empty($personal_details_obj['name'])){$user_name = "Not specified";} else{$user_name =$personal_details_obj['name'];}
  if (empty($personal_details_obj['birthday'])){$birthday_date = "Not specified";} else{$birthday_date =$personal_details_obj['birthday'];}
  if (empty($personal_details_obj['hometown'])){$country = "Not specified"; 
                                          $city = "Not specified";} 
      else{
           $hometown=$personal_details_obj['hometown'];
           $pripona = explode(", ",$hometown['name']);
           $country = $pripona[0];
           $city = $pripona[1];
          }
?>
