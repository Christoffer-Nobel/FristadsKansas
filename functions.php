<?php

$conn = null;

function connect() {
  global $conn;

  $conn = mysqli_connect(DBHOST, DBUSER, DBPASS);

  if(!$conn) {
    die(mysqli_error($conn));
  }

  mysqli_select_db($conn, DBNAME);
}


$brugernavn = null;
function hentBruger($brugernavn) {
  global $conn;

  $sql = 'SELECT * FROM brugere WHERE brugernavn ="'. $brugernavn . '"';
  $result = mysqli_query($conn, $sql);
  $nav = [];

  if(mysqli_num_rows($result) > 0) {
    while($row = mysqli_fetch_assoc($result)) {
      $nav[] = $row;
    }
  }
  return $nav;
}

$telefonnummer = null;
$brugerid = null;
function hentKundeoplysninger($telefonnummer, $brugerid){
  global $conn;

  $sql = 'SELECT * FROM kunder_med_abonnement WHERE telefonnummer ="'. $telefonnummer .'" AND butikstilhørsforhold ="'. $brugerid . '"';
  $result = mysqli_query($conn, $sql);
  $nav = [];

  if(mysqli_num_rows($result) > 0) {
    while($row = mysqli_fetch_assoc($result)) {
      $nav[] = $row;
    }
  }
  return $nav;
}

$telefonnummer = null;
function hentKunde($telefonnummer){
  global $conn;

  $sql = 'SELECT * FROM kunde WHERE telefonnummer ="'. $telefonnummer .'"';
  $result = mysqli_query($conn, $sql);
  $nav = [];

  if(mysqli_num_rows($result) > 0) {
    while($row = mysqli_fetch_assoc($result)) {
      $nav[] = $row;
    }
  }
  return $nav;
}

function hentAbonnementer(){
  global $conn;

  $sql = 'SELECT * FROM abonnementer WHERE abonnement_id > 0';
  $result = mysqli_query($conn, $sql);
  $nav = [];

  if(mysqli_num_rows($result) > 0) {
    while($row = mysqli_fetch_assoc($result)) {
      $nav[] = $row;
    }
  }
  return $nav;
}



function debug($data) {
  echo '<pre>';
  print_r($data);
  echo '</pre>';
}
