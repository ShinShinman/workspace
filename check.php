<?php
if (isset($_GET['link'])) {
  // header('Content-type: image/jpeg');
  // echo file_get_contents('http://127.0.0.1:4081/' . $_GET['link']);
  // echo get_headers('http://127.0.0.1:4081/' . $_GET['link'])[10];
  // foreach(get_headers('http://127.0.0.1:4081/' . $_GET['link']) as $i => $item) {
  //   echo '<pre>'; var_dump($i, $item);
  // }
  $url = 'http://127.0.0.1:4081/' . $_GET['link'];
  // header(get_headers($url)[10]);
  header('Content-type: text/plain');
  // echo get_headers($url)[10];
  echo $_GET['link'];
  foreach(get_headers($url) as $item) {
    echo PHP_EOL . $item;
  }
  echo PHP_EOL . PHP_EOL;
  echo get_headers($url, 1)["Content-Type"];
} else {
  echo 'Yyyy';
}
?>
