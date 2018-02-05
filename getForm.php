<?php
$cookie_file = './cookie/'.time().'.cookie';
$str = getResponse('https://coinboard.me/login/',[],$cookie_file);
setcookie("coinboard_uid", "QVVtlw-8jO50x-nn66La-JGlSug-eV7ylU");
preg_match('/<input type=\'hidden\' name=\'csrfmiddlewaretoken\' value=\'(.*)\'/U', $str, $match);

$post['csrfmiddlewaretoken'] = $match[1];
$post['username'] = $argv[1];
$post['password'] = $argv[2];
print_r(getResponse('https://coinboard.me/login/', $post, $cookie_file));
print_r(getResponse('https://coinboard.me/home/', array(), $cookie_file));

function getResponse($url, $data=[],  $cookie_file='', $timeout = 3)
{
    if(empty($cookie_file))
    {
        $cookie_file = '.cookie';
    }

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_REFERER, "https://coinboard.me/home/");   //构造来路
    curl_setopt($ch, CURLOPT_USERAGENT,"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36");

    if(!empty($data))
    {
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    }
    curl_setopt($ch,  CURLOPT_COOKIEJAR, $cookie_file);// 取cookie的参数是
    curl_setopt($ch, CURLOPT_COOKIEFILE, $cookie_file); //发送cookie
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    try
    {
         $handles = curl_exec($ch);
          curl_close($ch);
          return $handles;
    }
    catch (Exception $e)
    {
        echo 'Caught exception: ',  $e->getMessage(), "\n";
    }
    unlink($cookie_file);
}
