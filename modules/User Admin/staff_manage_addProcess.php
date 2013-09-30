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

include "../../functions.php" ;
include "../../config.php" ;

//New PDO DB connection
try {
  	$connection2=new PDO("mysql:host=$databaseServer;dbname=$databaseName;charset=utf8", $databaseUsername, $databasePassword);
	$connection2->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$connection2->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
}
catch(PDOException $e) {
  echo $e->getMessage();
}

session_start() ;

//Set timezone from session variable
date_default_timezone_set($_SESSION[$guid]["timezone"]);

$search=$_GET["search"] ;
$URL=$_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . getModuleName($_POST["address"]) . "/staff_manage_add.php&search=$search" ;

if (isActionAccessible($guid, $connection2, "/modules/User Admin/staff_manage_add.php")==FALSE) {
	//Fail 0
	$URL = $URL . "&addReturn=fail0" ;
	header("Location: {$URL}");
}
else {
	//Proceed!
	$gibbonPersonID=$_POST["gibbonPersonID"] ; 
	$type=$_POST["type"] ;
	$jobTitle=$_POST["jobTitle"] ;
	$firstAidQualified=$_POST["firstAidQualified"] ;
	$firstAidExpiry=NULL ;
	if ($firstAidQualified=="Y" AND $_POST["firstAidExpiry"]!="") {
		$firstAidExpiry=dateConvert($_POST["firstAidExpiry"]) ;
	}
	
	//Validate Inputs
	if ($gibbonPersonID=="" OR $type=="") {
		//Fail 3
		$URL = $URL . "&addReturn=fail3" ;
		header("Location: {$URL}");
	}
	else {
		//Check unique inputs for uniquness
		try {
			$data=array("gibbonPersonID"=>$gibbonPersonID); 
			$sql="SELECT * FROM gibbonStaff WHERE gibbonPersonID=:gibbonPersonID" ;
			$result=$connection2->prepare($sql);
			$result->execute($data);
		}
		catch(PDOException $e) { 
			//Fail 2
			$URL = $URL . "&addReturn=fail2" ;
			header("Location: {$URL}");
			break ;
		}
		
		if ($result->rowCount()>0) {
			//Fail 4
			$URL = $URL . "&addReturn=fail4" ;
			header("Location: {$URL}");
		}
		else {	
			//Write to database
			try {
				$data=array("gibbonPersonID"=>$gibbonPersonID, "type"=>$type, "jobTitle"=>$jobTitle, "firstAidQualified"=>$firstAidQualified, "firstAidExpiry"=>$firstAidExpiry); 
				$sql="INSERT INTO gibbonStaff SET gibbonPersonID=:gibbonPersonID, type=:type, jobTitle=:jobTitle, firstAidQualified=:firstAidQualified, firstAidExpiry=:firstAidExpiry" ;
				$result=$connection2->prepare($sql);
				$result->execute($data);
			}
			catch(PDOException $e) { 
				//Fail 2
				$URL = $URL . "&addReturn=fail2" ;
				header("Location: {$URL}");
				break ;
			}
			
			//Success 0
			$URL = $URL . "&addReturn=success0" ;
			header("Location: {$URL}");
		}
	}
}
?>