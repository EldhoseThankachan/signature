<?php

$Servername="localhost";
$Username="root";
$Database="e-tournix";
$Password="";
$Conn=mysqli_connect($Servername,$Username,$Password,$Database);
if(!$Conn)
{
	echo "Connection Error";
}

?>