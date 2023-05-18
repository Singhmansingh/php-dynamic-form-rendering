<?php

global $db;

$db=mysqli_connect("localhost","root","root","templategen");

if(mysqli_connect_error()){
    var_dump(mysqli_error($db));
    die();
}
