<?php
$params = '?';
foreach ($_GET as $key => $value) {
  if ($key != "link")
      $params .= str_replace("_", ".", $key) . "=" . urlencode($value) . "&";
}
$params = rtrim($params, "&");
// echo $params;
$url='http://156.17.251.36:59188/solr/' . $_GET["link"] . $params;
$content_type=get_headers($url, 1)["Content-Type"];
$ch=curl_init();
$timeout=5;

curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
// curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
// curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);

$result=curl_exec($ch);
curl_close($ch);
header('Content-type: ' . $content_type);
echo $result;
?>
