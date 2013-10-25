<?
/*
Gibbon, Flexible & Open School System
Copyright (C) 2010, Ross Parker

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

//Gibbon system-wide includes
include "./functions.php" ;
include "./config.php" ;
include "./version.php" ;

//New PDO DB connection
try {
  	$connection2=new PDO("mysql:host=$databaseServer;dbname=$databaseName;charset=utf8", $databaseUsername, $databasePassword);
	$connection2->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$connection2->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
}
catch(PDOException $e) {
  echo $e->getMessage();
}

@session_start() ;

//Check to see if system settings are set from databases
if ($_SESSION[$guid]["systemSettingsSet"]==FALSE) {
	getSystemSettings($guid, $connection2) ;
}
//If still false, show warning, otherwise display page
if ($_SESSION[$guid]["systemSettingsSet"]==FALSE) {
	print "System Settings are not set: the system cannot be displayed" ;
}
else {
	?>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<title><? print $_SESSION[$guid]["organisationNameShort"] . " - " . $_SESSION[$guid]["systemName"] ?></title>
			<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
			<meta http-equiv="content-language" content="en"/>
			<meta name="author" content="Ross Parker, International College Hong Kong"/>
			<meta name="ROBOTS" content="none"/>
			
			<?
			//Set theme
			$themeCSS="<link rel='stylesheet' type='text/css' href='./themes/Default/css/main.css' />" ;
			$themeJS="<script type='text/javascript' src='./themes/Default/js/common.js'></script>" ;
			$_SESSION[$guid]["gibbonThemeID"]="001" ;
			$_SESSION[$guid]["gibbonThemeName"]="Default" ;
			
			if ($_SESSION[$guid]["gibbonThemeIDPersonal"]!=NULL) {
				$dataTheme=array("gibbonThemeIDPersonal"=>$_SESSION[$guid]["gibbonThemeIDPersonal"]); 
				$sqlTheme="SELECT * FROM gibbonTheme WHERE gibbonThemeID=:gibbonThemeIDPersonal" ;
			}
			else {
				$dataTheme=array(); 
				$sqlTheme="SELECT * FROM gibbonTheme WHERE active='Y'" ;
			}
			$resultTheme=$connection2->prepare($sqlTheme);
			$resultTheme->execute($dataTheme);
			if ($resultTheme->rowCount()==1) {
				$rowTheme=$resultTheme->fetch() ;
				$themeCSS="<link rel='stylesheet' type='text/css' href='./themes/" . $rowTheme["name"] . "/css/main.css' />" ;
				$themeCJS="<script type='text/javascript' src='./themes/" . $rowTheme["name"] . "/js/common.js'></script>" ;
				$_SESSION[$guid]["gibbonThemeID"]=$rowTheme["gibbonThemeID"] ;
				$_SESSION[$guid]["gibbonThemeName"]=$rowTheme["name"] ;
			}
			print $themeCSS ;
			print $themeJS ;
			
			//Set module CSS & JS
			$moduleCSS="<link rel='stylesheet' type='text/css' href='./modules/" . $_SESSION[$guid]["module"] . "/css/module.css' />" ;
			$moduleJS="<script type='text/javascript' src='./modules/" . $_SESSION[$guid]["module"] . "/js/module.js'></script>" ;
			print $moduleCSS ;
			print $moduleJS ;
			
			//Set timezone from session variable
			date_default_timezone_set($_SESSION[$guid]["timezone"]);
			?>
			
			<link rel="shortcut icon" type="image/x-icon" href="./favicon.ico"/>
			<script type="text/javascript" src="./lib/LiveValidation/livevalidation_standalone.compressed.js"></script>
		
			<?
			if ($_SESSION[$guid]["analytics"]!="") {
				print $_SESSION[$guid]["analytics"] ;
			}
			?>
		</head>
		<body style="background: none">
			<div id="wrap" style="width:750px">
				<div id="header">
					<div id="header-left" style="width:480px; font-size: 100%; height: 120px">
						<?
						print "<div style='padding-top: 30px'>" ;
							print "<p>" ;
								print "This printout contains information that is the property of " . $_SESSION[$guid]["organisationName"] . ". If you find this report, and do not have permission to read it, please return it to " . $_SESSION[$guid]["organisationAdministratorName"] . " (" . $_SESSION[$guid]["organisationAdministratorEmail"] . "). In the event that it cannot be returned, please destroy it" ;
							print "</p>" ;
						print "</div>" ;
						?>
					</div>
					<div id="header-right" style="text-align: right">
						<img height='107px' width='250px' style="margin-top: 10px" alt="Logo" src="<? print $_SESSION[$guid]["absoluteURL"] . "/" . $_SESSION[$guid]["organisationLogo"] ; ?>"/>
					</div>
				</div>
				<div id="content-wrap-report" style="min-height: 500px">
					
					<?
					$_SESSION[$guid]["address"]=$_GET["q"];
					$_SESSION[$guid]["module"]=getModuleName($_SESSION[$guid]["address"]) ;
					$_SESSION[$guid]["action"]=getActionName($_SESSION[$guid]["address"]) ;
					
					if (strstr($_SESSION[$guid]["address"],"..")!=FALSE) {
						print "<div class='error'>" ;
						print "Illegal address detected: access denied." ;
						print "</div>" ;
					}
					else {
						if(is_file("./" . $_SESSION[$guid]["address"])) {
							include ("./" . $_SESSION[$guid]["address"]) ;
						}
						else {
							include "./error.php" ;
						}
					}
					?>
				</div>
				<div id="footer" style="padding-top: 30px; background-color: #fff; color: #333">
					<? print "Created by " . $_SESSION[$guid]["username"] . " (" . $_SESSION[$guid]["organisationNameShort"] . ") at " . date("H:i") . " on " . date("d/m/Y") . "." ; ?>
				</div>
			</div>
		</body>
	</html>
	<?
}
?>