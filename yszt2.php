<?php
if (isset($_GET['link'])) {
  // header('Content-type: image/jpeg');
  // echo file_get_contents('http://127.0.0.1:4081/' . $_GET['link']);
  // echo get_headers('http://127.0.0.1:4081/' . $_GET['link'])[10];
  // foreach(get_headers('http://127.0.0.1:4081/' . $_GET['link']) as $i => $item) {
  //   echo '<pre>'; var_dump($i, $item);
  // }
  $url = 'http://127.0.0.1:4081/' . $_GET['link'];
  header(get_headers($url)[10]);
  echo file_get_contents($url);
} else {
  echo 'Yyyy';
}
?>
