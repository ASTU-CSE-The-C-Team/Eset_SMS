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

@session_start() ;

if (isActionAccessible($guid, $connection2, "/modules/User Admin/studentEnrolment_manage_add.php")==FALSE) {
	//Acess denied
	print "<div class='error'>" ;
		print "You do not have access to this action." ;
	print "</div>" ;
}
else {
	//Proceed!
	print "<div class='trail'>" ;
	print "<div class='trailHead'><a href='" . $_SESSION[$guid]["absoluteURL"] . "'>Home</a> > <a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . getModuleName($_GET["q"]) . "/" . getModuleEntry($_GET["q"], $connection2, $guid) . "'>" . getModuleName($_GET["q"]) . "</a> > <a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/User Admin/studentEnrolment_manage.php&gibbonSchoolYearID=" . $_GET["gibbonSchoolYearID"] . "'>Student Enrolment</a> > </div><div class='trailEnd'>Add Student Enrolment</div>" ;
	print "</div>" ;
	
	if (isset($_GET["addReturn"])) { $addReturn=$_GET["addReturn"] ; } else { $addReturn="" ; }
	$addReturnMessage ="" ;
	$class="error" ;
	if (!($addReturn=="")) {
		if ($addReturn=="fail0") {
			$addReturnMessage ="Your request failed because you do not have access to this action." ;	
		}
		else if ($addReturn=="fail2") {
			$addReturnMessage ="Your request failed due to a database error." ;	
		}
		else if ($addReturn=="fail3") {
			$addReturnMessage ="Your request failed because your inputs were invalid." ;	
		}
		else if ($addReturn=="fail4") {
			$addReturnMessage ="Your request failed because your inputs were invalid." ;	
		}
		else if ($addReturn=="fail5") {
			$addReturnMessage ="Your request failed because your passwords did not match." ;	
		}
		else if ($addReturn=="fail6") {
			$addReturnMessage ="Your request failed because the student is already registered in the specified year." ;	
		}
		else if ($addReturn=="success0") {
			$addReturnMessage ="Your request was successful. You can now add another record if you wish." ;	
			$class="success" ;
		}
		print "<div class='$class'>" ;
			print $addReturnMessage;
		print "</div>" ;
	} 
	
	//Check if school year specified
	$gibbonSchoolYearID=$_GET["gibbonSchoolYearID"] ;
	$search=$_GET["search"] ;
	if ($gibbonSchoolYearID=="") {
		print "<div class='error'>" ;
			print "You have not specified a school year." ;
		print "</div>" ;
	}
	else {
		if ($search!="") {
			print "<div class='linkTop'>" ;
				print "<a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/User Admin/studentEnrolment_manage.php&gibbonSchoolYearID=$gibbonSchoolYearID&search=$search'>Back to Search Results</a>" ;
			print "</div>" ;
		}
		?>
		<form method="post" action="<? print $_SESSION[$guid]["absoluteURL"] . "/modules/" . $_SESSION[$guid]["module"] . "/studentEnrolment_manage_addProcess.php?gibbonSchoolYearID=$gibbonSchoolYearID&search=$search" ?>">
			<table class='smallIntBorder' cellspacing='0' style="width: 100%">	
				<tr>
					<td> 
						<b>School Year *</b><br/>
						<span style="font-size: 90%"><i>This value cannot be changed.</i></span>
					</td>
					<td class="right">
						<?
						$yearName="" ;
						try {
							$dataYear=array("gibbonSchoolYearID"=>$gibbonSchoolYearID); 
							$sqlYear="SELECT * FROM gibbonSchoolYear WHERE gibbonSchoolYearID=:gibbonSchoolYearID" ;
							$resultYear=$connection2->prepare($sqlYear);
							$resultYear->execute($dataYear);
						}
						catch(PDOException $e) { 
							print "<div class='error'>" . $e->getMessage() . "</div>" ; 
						}
						if ($resultYear->rowCount()==1) {
							$rowYear=$resultYear->fetch() ;
							$yearName=$rowYear["name"] ;
						}
						?>
						<input readonly name="yearName" id="yearName" maxlength=20 value="<? print $yearName ?>" type="text" style="width: 300px">
						<script type="text/javascript">
							var yearName=new LiveValidation('yearName');
							yearName.add(Validate.Presence);
						</script>
					</td>
				</tr>
				<tr>
					<td> 
						<b>Student *</b><br/>
						<span style="font-size: 90%"><i></i></span>
					</td>
					<td class="right">
						<select name="gibbonPersonID" id="gibbonPersonID" style="width: 302px">
							<?
							print "<option value='Please select...'>Please select...</option>" ;
							try {
								$dataSelect=array(); 
								$sqlSelect="SELECT gibbonPersonID, preferredName, surname FROM gibbonPerson WHERE gibbonPerson.status='Full' ORDER BY surname, preferredName" ;
								$resultSelect=$connection2->prepare($sqlSelect);
								$resultSelect->execute($dataSelect);
							}
							catch(PDOException $e) { }
							while ($rowSelect=$resultSelect->fetch()) {
								print "<option value='" . $rowSelect["gibbonPersonID"] . "'>" . formatName("", htmlPrep($rowSelect["preferredName"]), htmlPrep($rowSelect["surname"]), "Student", true) . "</option>" ;
							}
							?>				
						</select>
						<script type="text/javascript">
							var gibbonPersonID=new LiveValidation('gibbonPersonID');
							gibbonPersonID.add(Validate.Exclusion, { within: ['Please select...'], failureMessage: "Select something!"});
						 </script>
					</td>
				</tr>
				<tr>
					<td> 
						<b>Year Group *</b><br/>
						<span style="font-size: 90%"></span>
					</td>
					<td class="right">
						<select name="gibbonYearGroupID" id="gibbonYearGroupID" style="width: 302px">
							<?
							print "<option value='Please select...'>Please select...</option>" ;
							try {
								$dataSelect=array(); 
								$sqlSelect="SELECT gibbonYearGroupID, name FROM gibbonYearGroup ORDER BY sequenceNumber" ;
								$resultSelect=$connection2->prepare($sqlSelect);
								$resultSelect->execute($dataSelect);
							}
							catch(PDOException $e) { }
							while ($rowSelect=$resultSelect->fetch()) {
								$selected="" ;
								if ($row["gibbonYearGroupID"]==$rowSelect["gibbonYearGroupID"]) {
									$selected="selected" ;
								}
								print "<option $selected value='" . $rowSelect["gibbonYearGroupID"] . "'>" . htmlPrep($rowSelect["name"]) . "</option>" ;
							}
							?>				
						</select>
						<script type="text/javascript">
							var gibbonYearGroupID=new LiveValidation('gibbonYearGroupID');
							gibbonYearGroupID.add(Validate.Exclusion, { within: ['Please select...'], failureMessage: "Select something!"});
						 </script>
					</td>
				</tr>
				<tr>
					<td> 
						<b>Roll Group *</b><br/>
						<span style="font-size: 90%"></span>
					</td>
					<td class="right">
						<select name="gibbonRollGroupID" id="gibbonRollGroupID" style="width: 302px">
							<?
							print "<option value='Please select...'>Please select...</option>" ;
							try {
								$dataSelect=array("gibbonSchoolYearID"=>$gibbonSchoolYearID); 
								$sqlSelect="SELECT gibbonRollGroupID, name FROM gibbonRollGroup WHERE gibbonSchoolYearID=:gibbonSchoolYearID ORDER BY name" ;
								$resultSelect=$connection2->prepare($sqlSelect);
								$resultSelect->execute($dataSelect);
							}
							catch(PDOException $e) { }
							while ($rowSelect=$resultSelect->fetch()) {
								$selected="" ;
								if ($row["gibbonRollGroupID"]==$rowSelect["gibbonRollGroupID"]) {
									$selected="selected" ;
								}
								print "<option $selected value='" . $rowSelect["gibbonRollGroupID"] . "'>" . htmlPrep($rowSelect["name"]) . "</option>" ;
							}
							?>				
						</select>
						<script type="text/javascript">
							var gibbonRollGroupID=new LiveValidation('gibbonRollGroupID');
							gibbonRollGroupID.add(Validate.Exclusion, { within: ['Please select...'], failureMessage: "Select something!"});
						 </script>
					</td>
				</tr>
				<tr>
					<td>
						<span style="font-size: 90%"><i>* denotes a required field</i></span>
					</td>
					<td class="right">
						<input name="gibbonStudentEnrolmentID" id="gibbonStudentEnrolmentID" value="<? print $gibbonStudentEnrolmentID ?>" type="hidden">
						<input type="hidden" name="address" value="<? print $_SESSION[$guid]["address"] ?>">
						<input type="submit" value="Submit">
					</td>
				</tr>
			</table>
		</form>
		<?
	}
}
?>