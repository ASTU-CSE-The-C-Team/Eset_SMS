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

if (isActionAccessible($guid, $connection2, "/modules/User Admin/medicalForm_manage_condition_edit.php")==FALSE) {
	//Acess denied
	print "<div class='error'>" ;
		print "You do not have access to this action." ;
	print "</div>" ;
}
else {
	//Proceed!
	print "<div class='trail'>" ;
	print "<div class='trailHead'><a href='" . $_SESSION[$guid]["absoluteURL"] . "'>Home</a> > <a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . getModuleName($_GET["q"]) . "/" . getModuleEntry($_GET["q"], $connection2, $guid) . "'>" . getModuleName($_GET["q"]) . "</a> > <a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/User Admin/medicalForm_manage.php'>Manage Medical Forms</a> > <a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/User Admin/medicalForm_manage_edit.php&&gibbonPersonMedicalID=" . $_GET["gibbonPersonMedicalID"] . "'>Edit Medical Form</a> > </div><div class='trailEnd'>Edit Condition</div>" ;
	print "</div>" ;
	
	if (isset($_GET["updateReturn"])) { $updateReturn=$_GET["updateReturn"] ; } else { $updateReturn="" ; }
	$updateReturnMessage ="" ;
	$class="error" ;
	if (!($updateReturn=="")) {
		if ($updateReturn=="fail0") {
			$updateReturnMessage ="Your request failed because you do not have access to this action." ;	
		}
		else if ($updateReturn=="fail1") {
			$updateReturnMessage ="Your request failed because your inputs were invalid." ;	
		}
		else if ($updateReturn=="fail2") {
			$updateReturnMessage ="Your request failed due to a database error." ;	
		}
		else if ($updateReturn=="fail3") {
			$updateReturnMessage ="Your request failed because your inputs were invalid." ;	
		}
		else if ($updateReturn=="fail4") {
			$updateReturnMessage ="Your request failed because your inputs were invalid." ;	
		}
		else if ($updateReturn=="success0") {
			$updateReturnMessage ="Your request was completed successfully." ;	
			$class="success" ;
		}
		print "<div class='$class'>" ;
			print $updateReturnMessage;
		print "</div>" ;
	} 
	
	//Check if school year specified
	$gibbonPersonMedicalID=$_GET["gibbonPersonMedicalID"] ;
	$gibbonPersonMedicalConditionID=$_GET["gibbonPersonMedicalConditionID"] ;
	$search=$_GET["search"] ;
	if ($gibbonPersonMedicalID=="" OR $gibbonPersonMedicalConditionID=="") {
		print "<div class='error'>" ;
			print "You have not specified a medical form or condition." ;
		print "</div>" ;
	}
	else {
		try {
			$data=array("gibbonPersonMedicalConditionID"=>$gibbonPersonMedicalConditionID); 
			$sql="SELECT * FROM gibbonPersonMedicalCondition WHERE gibbonPersonMedicalConditionID=:gibbonPersonMedicalConditionID" ;
			$result=$connection2->prepare($sql);
			$result->execute($data);
		}
		catch(PDOException $e) { 
			print "<div class='error'>" . $e->getMessage() . "</div>" ; 
		}
		
		if ($result->rowCount()!=1) {
			print "<div class='error'>" ;
				print "The specified medical form cannot be found." ;
			print "</div>" ;
		}
		else {
			//Let's go!
			$row=$result->fetch() ;
			
			if ($search!="") {
				print "<div class='linkTop'>" ;
					print "<a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/User Admin/medicalForm_manage_edit.php&search=$search&gibbonPersonMedicalID=$gibbonPersonMedicalID'>Back</a>" ;
				print "</div>" ;
			}
			?>
			<form method="post" action="<? print $_SESSION[$guid]["absoluteURL"] . "/modules/" . $_SESSION[$guid]["module"] . "/medicalForm_manage_condition_editProcess.php?gibbonPersonMedicalID=$gibbonPersonMedicalID&gibbonPersonMedicalConditionID=$gibbonPersonMedicalConditionID&search=$search" ?>">
				<table class='smallIntBorder' cellspacing='0' style="width: 100%">	
					<tr>
						<td> 
							<b>Person *</b><br/>
							<span style="font-size: 90%"><i>This value cannot be changed.</i></span>
						</td>
						<td class="right">
							<?
							try {
								$dataSelect=array("gibbonPersonMedicalID"=>$row["gibbonPersonMedicalID"]); 
								$sqlSelect="SELECT surname, preferredName FROM gibbonPerson JOIN gibbonPersonMedical ON (gibbonPerson.gibbonPersonID=gibbonPersonMedical.gibbonPersonID) WHERE gibbonPersonMedicalID=:gibbonPersonMedicalID" ;
								$resultSelect=$connection2->prepare($sqlSelect);
								$resultSelect->execute($dataSelect);
							}
							catch(PDOException $e) { }
							$rowSelect=$resultSelect->fetch() ;
							?>	
							<input readonly name="personName" id="personName" maxlength=255 value="<? print formatName("", $rowSelect["preferredName"], $rowSelect["surname"], "Student") ?>" type="text" style="width: 300px">
						</td>
					</tr>
					<tr>
						<td> 
							<b>Condition Name *</b><br/>
						</td>
						<td class="right">
							<select style="width: 302px" name="name" id="name">
								<?
								print "<option value='Please select...'>Please select...</option>" ;
								try {
									$dataSelect=array(); 
									$sqlSelect="SELECT * FROM gibbonMedicalCondition ORDER BY name" ;
									$resultSelect=$connection2->prepare($sqlSelect);
									$resultSelect->execute($dataSelect);
								}
								catch(PDOException $e) { }
								while ($rowSelect=$resultSelect->fetch()) {
									 if ($row["name"]==$rowSelect["name"]) {
										print "<option selected value='" . htmlPrep($rowSelect["name"]) . "'>" . htmlPrep($rowSelect["name"]) . "</option>" ;
									}
									 else {
										print "<option value='" . htmlPrep($rowSelect["name"]) . "'>" . htmlPrep($rowSelect["name"]) . "</option>" ;
									}
								}
								?>				
							</select>
							<script type="text/javascript">
								var name=new LiveValidation('name');
								name.add(Validate.Exclusion, { within: ['Please select...'], failureMessage: "Select something!"});
							 </script>	
						</td>
					</tr>
					<tr>
						<td> 
							<b>Risk *</b><br/>
						</td>
						<td class="right">
							<select name="gibbonAlertLevelID" id="gibbonAlertLevelID" style="width: 302px">
								<option value='Please select...'>Please select...</option>
								<?
								try {
									$dataSelect=array(); 
									$sqlSelect="SELECT * FROM gibbonAlertLevel ORDER BY sequenceNumber" ;
									$resultSelect=$connection2->prepare($sqlSelect);
									$resultSelect->execute($dataSelect);
								}
								catch(PDOException $e) { }
								
								while ($rowSelect=$resultSelect->fetch()) {
									$selected="" ;
									if ($row["gibbonAlertLevelID"]==$rowSelect["gibbonAlertLevelID"]) {
										$selected="selected" ;
									}	
									print "<option $selected value='" . $rowSelect["gibbonAlertLevelID"] . "'>" . $rowSelect["name"] . "</option>" ; 
								}
								?>
							</select>
							<script type="text/javascript">
								var gibbonAlertLevelID=new LiveValidation('gibbonAlertLevelID');
								gibbonAlertLevelID.add(Validate.Exclusion, { within: ['Please select...'], failureMessage: "Select something!"});
							 </script>	
						</td>
					</tr>
					<tr>
						<td> 
							<b>Triggers</b><br/>
						</td>
						<td class="right">
							<input name="triggers" id="triggers" maxlength=255 value="<? print htmlPrep($row["triggers"]) ?>" type="text" style="width: 300px">
						</td>
					</tr>
					<tr>
						<td> 
							<b>Reaction</b><br/>
						</td>
						<td class="right">
							<input name="reaction" id="reaction" maxlength=255 value="<? print htmlPrep($row["reaction"]) ?>" type="text" style="width: 300px">
						</td>
					</tr>
					<tr>
						<td> 
							<b>Response</b><br/>
						</td>
						<td class="right">
							<input name="response" id="response" maxlength=255 value="<? print htmlPrep($row["response"]) ?>" type="text" style="width: 300px">
						</td>
					</tr>
					<tr>
						<td> 
							<b>Medication</b><br/>
						</td>
						<td class="right">
							<input name="medication" id="medication" maxlength=255 value="<? print htmlPrep($row["medication"]) ?>" type="text" style="width: 300px">
						</td>
					</tr>
					<tr>
						<td> 
							<b>Last Episode Date</b><br/>
							<span style="font-size: 90%"><i>dd/mm/yyyy</i></span>
						</td>
						<td class="right">
							<input name="lastEpisode" id="lastEpisode" maxlength=10 value="<? print dateConvertBack($guid, $row["lastEpisode"]) ?>" type="text" style="width: 300px">
							<script type="text/javascript">
								var lastEpisode=new LiveValidation('lastEpisode');
								lastEpisode.add( Validate.Format, {pattern: <? if ($_SESSION[$guid]["i18n"]["dateFormatRegEx"]=="") {  print "/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$/i" ; } else { print $_SESSION[$guid]["i18n"]["dateFormatRegEx"] ; } ?>, failureMessage: "Use <? if ($_SESSION[$guid]["i18n"]["dateFormat"]=="") { print "dd/mm/yyyy" ; } else { print $_SESSION[$guid]["i18n"]["dateFormat"] ; }?>." } ); 
							 </script>
							 <script type="text/javascript">
								$(function() {
									$( "#lastEpisode" ).datepicker();
								});
							</script>
						</td>
					</tr>
					<tr>
						<td> 
							<b>Last Episode Treatment</b><br/>
						</td>
						<td class="right">
							<input name="lastEpisodeTreatment" id="lastEpisodeTreatment" maxlength=255 value="<? print htmlPrep($row["lastEpisodeTreatment"]) ?>" type="text" style="width: 300px">
						</td>
					</tr>
					<tr>
						<td> 
							<b>Comment</b><br/>
							<span style="font-size: 90%"><i>1000 character limit</i></span>
						</td>
						<td class="right">
							<textarea name="comment" id="comment" rows=8 style="width: 300px"><? print $row["comment"] ?></textarea>
							<script type="text/javascript">
								var comment=new LiveValidation('comment');
								comment.add( Validate.Length, { maximum: 1000 } );
							 </script>
						</td>
					</tr>
					<tr>
						<td>
							<span style="font-size: 90%"><i>* denotes a required field</i></span>
						</td>
						<td class="right">
							<input name="gibbonPersonMedicalID" id="gibbonPersonMedicalID" value="<? print $gibbonPersonMedicalID ?>" type="hidden">
							<input type="hidden" name="address" value="<? print $_SESSION[$guid]["address"] ?>">
							<input type="submit" value="Submit">
						</td>
					</tr>
				</table>
			</form>
			<?
		}
	}
}
?>