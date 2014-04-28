<?php
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

@session_start() ;

//Set timezone from session variable
date_default_timezone_set($_SESSION[$guid]["timezone"]);

$gibbonPersonID=$_POST["gibbonPersonID"] ;
$gibbonExternalAssessmentStudentID=$_POST["gibbonExternalAssessmentStudentID"] ;
$search=$_GET["search"] ;

if ($gibbonPersonID=="") {
	print "Fatal error loading this page!" ;
}
else {
	$URL=$_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . getModuleName($_POST["address"]) . "/externalAssessment_manage_details_edit.php&gibbonPersonID=$gibbonPersonID&gibbonExternalAssessmentStudentID=$gibbonExternalAssessmentStudentID&search=$search" ;
	
	if (isActionAccessible($guid, $connection2, "/modules/External Assessment/externalAssessment_manage_details_edit.php")==FALSE) {
		//Fail 0
		$URL=$URL . "&updateReturn=fail0" ;
		header("Location: {$URL}");
	}
	else {
		//Proceed!
		//Check if tt specified
		if ($gibbonExternalAssessmentStudentID=="") {
			//Fail1
			$URL=$URL . "&updateReturn=fail1" ;
			header("Location: {$URL}");
		}
		else {
			try {
				$data=array("gibbonExternalAssessmentStudentID"=>$gibbonExternalAssessmentStudentID); 
				$sql="SELECT * FROM gibbonExternalAssessmentStudent WHERE gibbonExternalAssessmentStudentID=:gibbonExternalAssessmentStudentID" ;
				$result=$connection2->prepare($sql);
				$result->execute($data);
			}
			catch(PDOException $e) { 
				//Fail2
				$URL=$URL . "&updateReturn=fail2" ;
				header("Location: {$URL}");
				break ;
			}
			if ($result->rowCount()!=1) {
				//Fail 2
				$URL=$URL . "&updateReturn=fail2" ;
				header("Location: {$URL}");
			}
			else {
				//Validate Inputs
				$count=$_POST["count"] ;
				$date=dateConvert($guid, $_POST["date"]) ;

				if ($count=="" OR $date=="") {
					//Fail 3
					
					$URL=$URL . "&updateReturn=fail3" ;
					header("Location: {$URL}");
				}
				else {
					//Scan through fields
					$partialFail=FALSE ;
					for ($i=0; $i<$count; $i++) {
						$gibbonExternalAssessmentStudentEntryID=$_POST[$i . "-gibbonExternalAssessmentStudentEntryID"] ;
						if ($_POST[$i . "-gibbonScaleGradeID"]=="") {
							$gibbonScaleGradeID=NULL ;
						}
						else {
							$gibbonScaleGradeID=$_POST[$i . "-gibbonScaleGradeID"] ;
						}
						if ($_POST[$i . "-gibbonScaleGradeIDPAS"]=="") {
							$gibbonScaleGradeIDPAS=NULL ;
						}
						else {
							$gibbonScaleGradeIDPAS=$_POST[$i . "-gibbonScaleGradeIDPAS"] ;
						}
						
						if ($gibbonExternalAssessmentStudentEntryID!="") {
							try {
								$data=array("gibbonScaleGradeID"=>$gibbonScaleGradeID, "gibbonScaleGradeIDPAS"=>$gibbonScaleGradeIDPAS, "gibbonExternalAssessmentStudentEntryID"=>$gibbonExternalAssessmentStudentEntryID); 
								$sql="UPDATE gibbonExternalAssessmentStudentEntry SET gibbonScaleGradeID=:gibbonScaleGradeID, gibbonScaleGradeIDPrimaryAssessmentScale=:gibbonScaleGradeIDPAS WHERE gibbonExternalAssessmentStudentEntryID=:gibbonExternalAssessmentStudentEntryID" ;
								$result=$connection2->prepare($sql);
								$result->execute($data);
							}
							catch(PDOException $e) { 
								$partialFail=TRUE ;
							}
						}
					}
					
					//Write to database
					try {
						$data=array("date"=>$date, "gibbonExternalAssessmentStudentID"=>$gibbonExternalAssessmentStudentID); 
						$sql="UPDATE gibbonExternalAssessmentStudent SET date=:date WHERE gibbonExternalAssessmentStudentID=:gibbonExternalAssessmentStudentID" ;
						$result=$connection2->prepare($sql);
						$result->execute($data);
					}
					catch(PDOException $e) { 
						//Fail 2
						$URL=$URL . "&updateReturn=fail2" ;
						header("Location: {$URL}");
						break ;
					}
					
					//Success 0
					$URL=$URL . "&updateReturn=success0" ;
					header("Location: {$URL}");
				}
			}
		}
	}
}
?>