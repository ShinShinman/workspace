<?php
$url='http://127.0.0.1:4081/' . $_GET['link'];
$content_type=get_headers($url, 1)["Content-Type"];
$ch=curl_init();
$timeout=12000;

curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);

$result=curl_exec($ch);
curl_close($ch);
header('Content-type: ' . $content_type);
echo $result;
?>
