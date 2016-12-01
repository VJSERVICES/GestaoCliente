<?php
// This script was created by phpMyBackupPro v.2.4 (http://www.phpMyBackupPro.net) | Adaptador por Montepage
// In order to work probably, it must be saved in the directory C:/xampp/htdocs/PROJETOS/.
$_POST['db']=array("vjcliente", );
$_POST['tables']="on";
$_POST['data']="on";
$period=(3600*24)/24;
// switch to the phpMyBackupPro v.2.4 directory
@chdir("C:/xampp/htdocs/PROJETOS/VJ_GestaoDeClientes/phpMyBackupPro-2.4-Adaptado-Montepage");
@include("./phpMyBackupPro-2.4-Adaptado-Montepage/backup.php");
// switch back to the directory containing this script
@chdir("C:/xampp/htdocs/PROJETOS/VJ_GestaoDeClientes/phpMyBackupPro-2.4-Adaptado-Montepage/export");
?>