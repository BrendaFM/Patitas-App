<?php

session_start();
if (isset($_SESSION['login'])){
  if ($_SESSION['login'] == false){
    header("Location:../");
  }
}else{
  header("Location:../");
}

?>