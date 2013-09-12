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

session_start() ;

//Module includes
include "./modules/" . $_SESSION[$guid]["module"] . "/moduleFunctions.php" ;

if (isActionAccessible($guid, $connection2, "/modules/Attendance/attendance_take_byPerson.php")==FALSE) {
	//Acess denied
	print "<div class='error'>" ;
		print "You do not have access to this action." ;
	print "</div>" ;
}
else {
	//Proceed!
	print "<div class='trail'>" ;
	print "<div class='trailHead'><a href='" . $_SESSION[$guid]["absoluteURL"] . "'>Home</a> > <a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . getModuleName($_GET["q"]) . "/" . getModuleEntry($_GET["q"], $connection2, $guid) . "'>" . getModuleName($_GET["q"]) . "</a> > </div><div class='trailEnd'>Take Attendance by Person</div>" ;
	print "</div>" ;
	
	$updateReturn = $_GET["updateReturn"] ;
	$updateReturnMessage ="" ;
	$class="error" ;
	if (!($updateReturn=="")) {
		if ($updateReturn=="fail0") {
			$updateReturnMessage ="Update failed because you do not have access to this action." ;	
		}
		else if ($updateReturn=="fail1") {
			$updateReturnMessage ="Update failed because a required parameter was not set." ;	
		}
		else if ($updateReturn=="fail2") {
			$updateReturnMessage ="Update failed due to a database error." ;	
		}
		else if ($updateReturn=="fail4") {
			$updateReturnMessage ="Update failed because specified date is in the future." ;	
		}
		else if ($updateReturn=="fail5") {
			$updateReturnMessage ="Update failed because school is closed on the specified date." ;	
		}
		else if ($updateReturn=="success0") {
			$updateReturnMessage ="Update was successful." ;	
			$class="success" ;
		}
		print "<div class='$class'>" ;
			print $updateReturnMessage;
		print "</div>" ;
	} 
	
	print "<h2 class='top'>" ;
	print "Choose Student" ;
	print "</h2>" ;
	
	$gibbonPersonID=$_GET["gibbonPersonID"] ;
	
	if ($_GET["currentDate"]=="") {
	 	$currentDate=date("Y-m-d");
	}
	else {
		$currentDate=dateConvert($_GET["currentDate"]) ;	 
	}
	
	$today=date("Y-m-d");
	
	?>
	
	<form method="get" action="<? print $_SESSION[$guid]["absoluteURL"]?>/index.php">
		<table style="width: 100%">	
			<tr><td style="width: 30%"></td><td></td></tr>
			<tr>
				<td> 
					<b>Student</b><br/>
					<span style="font-size: 90%"><i></i></span>
				</td>
				<td class="right">
					<select style="width: 302px" name="gibbonPersonID">
						<?
						print "<option value=''></option>" ;
						try {
							$dataSelect=array("gibbonSchoolYearID"=>$_SESSION[$guid]["gibbonSchoolYearID"]); 
							$sqlSelect="SELECT * FROM gibbonPerson JOIN gibbonStudentEnrolment ON (gibbonPerson.gibbonPersonID=gibbonStudentEnrolment.gibbonPersonID) JOIN gibbonRollGroup ON (gibbonStudentEnrolment.gibbonRollGroupID=gibbonRollGroup.gibbonRollGroupID) WHERE gibbonRollGroup.gibbonSchoolYearID=:gibbonSchoolYearID AND status='Full' AND (dateStart IS NULL OR dateStart<='" . date("Y-m-d") . "') AND (dateEnd IS NULL  OR dateEnd>='" . date("Y-m-d") . "') ORDER BY surname, preferredName" ;
							$resultSelect=$connection2->prepare($sqlSelect);
							$resultSelect->execute($dataSelect);
						}
						catch(PDOException $e) { 
							print "<div class='error'>" . $e->getMessage() . "</div>" ; 
						}
						
						while ($rowSelect=$resultSelect->fetch()) {
							if ($gibbonPersonID==$rowSelect["gibbonPersonID"]) {
								print "<option selected value='" . $rowSelect["gibbonPersonID"] . "'>" . formatName("", htmlPrep($rowSelect["preferredName"]), htmlPrep($rowSelect["surname"]), "Student", true) . " (" . htmlPrep($rowSelect["nameShort"]) . ")</option>" ;
							}
							else {
								print "<option value='" . $rowSelect["gibbonPersonID"] . "'>" . formatName("", htmlPrep($rowSelect["preferredName"]), htmlPrep($rowSelect["surname"]), "Student", true) . " (" . htmlPrep($rowSelect["nameShort"]) . ")</option>" ;
							}
						}
						?>				
					</select>
				</td>
			</tr>
			<tr>
				<td> 
					<b>Date *</b><br/>
					<span style="font-size: 90%"><i>dd/mm/yyyy</i></span>
				</td>
				<td class="right">
					<input name="currentDate" id="currentDate" maxlength=10 value="<? print dateConvertBack($currentDate) ?>" type="text" style="width: 300px">
					<script type="text/javascript">
						var date = new LiveValidation('date');
						date.add( Validate.Format, {pattern: /^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$/i, failureMessage: "Use dd/mm/yyyy." } ); 
						date.add(Validate.Presence);
					 </script>
					 <script type="text/javascript">
						$(function() {
							$( "#currentDate" ).datepicker();
						});
					</script>
				</td>
			</tr>
			<tr>
				<td colspan=2 class="right">
					<input type="hidden" name="q" value="/modules/<? print $_SESSION[$guid]["module"] ?>/attendance_take_byPerson.php">
					<input type="submit" value="Search">
				</td>
			</tr>
		</table>
	</form>
	<?
	
	if ($gibbonPersonID!="") {
		print "<h2 class='top'>" ;
		print "Take Attendance" ;
		print "</h2>" ;
		
		if ($currentDate>$today) {
			print "<div class='error'>" ;
				print "The specified date is in the future: it must be today or earlier.";
			print "</div>" ;
		}
		else {
			if (isSchoolOpen($guid, $currentDate, $connection2)==FALSE) {
				print "<div class='error'>" ;
					print "School is closed on the specified date, and so attendance information cannot be recorded.";
				print "</div>" ;
			}
			else {
				//Get last 5 school days from currentDate within the last 100
				$timestamp=dateConvertToTimestamp($currentDate) ;
				$count=0 ;
				$spin=1 ;
				$last5SchoolDays=array() ;
				while ($count<5 AND $spin<=100) {
					$date=date("Y-m-d", ($timestamp-($spin*86400))) ;
					if (isSchoolOpen($guid, $date,$connection2)) {
						$last5SchoolDays[$count]=$date ;
						$count++ ;
					}
					$spin++ ;
				}
				$last5SchoolDaysCount=$count ;
		
				//Show attendance log for the current day
				try {
					$dataLog=array("gibbonPersonID"=>$gibbonPersonID, "date"=>"$currentDate%"); 
					$sqlLog="SELECT * FROM gibbonAttendanceLogPerson, gibbonPerson WHERE gibbonAttendanceLogPerson.gibbonPersonIDTaker=gibbonPerson.gibbonPersonID AND gibbonAttendanceLogPerson.gibbonPersonID=:gibbonPersonID AND date LIKE :date ORDER BY gibbonAttendanceLogPersonID" ;
					$resultLog=$connection2->prepare($sqlLog);
					$resultLog->execute($dataLog);
				}
				catch(PDOException $e) { 
					print "<div class='error'>" . $e->getMessage() . "</div>" ; 
				}
				if ($resultLog->rowCount()<1) {
					print "<div class='error'>" ;
						print "There is currently no attendance data today for the selected student.";
					print "</div>" ;
				}
				else {
					print "<div class='success'>" ;
						print "The following attendance log has been recorded for the selected student today:";
						print "<ul>" ;
						$lastType="" ;
						$lastReason="" ;
						$lastComment="" ;
						while ($rowLog=$resultLog->fetch()) {
							print "<li><b>" . $rowLog["direction"] . "</b> (" . $rowLog["type"] . ") | Recorded at " . substr($rowLog["timestampTaken"],11) . " on " . dateConvertBack(substr($rowLog["timestampTaken"],0,10)) . " by " . formatName("", $rowLog["preferredName"], $rowLog["surname"], "Staff", false, true) ."</li>" ;
							$lastType=$rowLog["type"] ;
							$lastReason=$rowLog["reason"] ;
							$lastComment=$rowLog["comment"] ;
						}
						print "</ul>" ;
					print "</div>" ;
				}
				
				//Show student form
				?>
				<form method="post" action="<? print $_SESSION[$guid]["absoluteURL"] . "/modules/" . $_SESSION[$guid]["module"] . "/attendance_take_byPersonProcess.php?gibbonPersonID=$gibbonPersonID" ?>">
					<table style="width: 100%">	
						<tr><td style="width: 30%"></td><td></td></tr>
						<tr>
							<td> 
								<b>Recent Attendance Summary</b><br/>
								<span style="font-size: 90%"><i></i></span>
							</td>
							<td class="right">
								<?
								print "<table style='float: right; width:134px; margin: 0px 0px 0px 8px; height: 35px' >" ;
									print "<tr>" ;
										for ($i=4; $i>=0; $i--) {
											$link="" ;
											if ($i>($last5SchoolDaysCount-1)) {
												$extraStyle="border: 1px solid #555; color: #555; background-color: #eee;" ;
												
												print "<td style='" . $extraStyle . "height: 25px; width: 20%'>" ;
												print "<i>NA</i>" ;
												print "</td>" ;
											}
											else {
												try {
													$dataLast5SchoolDays=array("gibbonPersonID"=>$gibbonPersonID, "date"=>date("Y-m-d", dateConvertToTimestamp($last5SchoolDays[$i])) . "%"); 
													$sqlLast5SchoolDays="SELECT * FROM gibbonAttendanceLogPerson WHERE gibbonPersonID=:gibbonPersonID AND date LIKE :date ORDER BY gibbonAttendanceLogPersonID DESC" ;
													$resultLast5SchoolDays=$connection2->prepare($sqlLast5SchoolDays);
													$resultLast5SchoolDays->execute($dataLast5SchoolDays);
												}
												catch(PDOException $e) { 
													print "<div class='error'>" . $e->getMessage() . "</div>" ; 
												}

												if ($resultLast5SchoolDays->rowCount()==0) {
													$extraStyle="border: 1px solid #555; color: #555; background-color: #eee; " ;
												}
												else {
													$link="./index.php?q=/modules/" . $_SESSION[$guid]["module"] . "/attendance_take_byPerson.php&gibbonPersonID=" . $gibbonPersonID . "&currentDate=" . date("d/m/Y", dateConvertToTimestamp($last5SchoolDays[$i])) ;
													$rowLast5SchoolDays=$resultLast5SchoolDays->fetch() ;
													if ($rowLast5SchoolDays["type"]=="Absent") {
														$color="#c00" ;
														$extraStyle="border: 1px solid #c00; color: #c00; background-color: #F6CECB; " ;
													}
													else {
														$color="#390" ;
														$extraStyle="border: 1px solid #390; color: #390; background-color: #D4F6DC; " ;
													}
												}
												
												print "<td style='" . $extraStyle . "height: 25px; width: 20%'>" ;
													if ($link!="") {
														print "<a style='text-decoration: none; color: $color' href='$link'>" ;
														print date("d", dateConvertToTimestamp($last5SchoolDays[$i])) . "<br/>" ;
														print "<span style='font-size: 65%'>" . date("M", dateConvertToTimestamp($last5SchoolDays[$i])) . "</span>" ;
														print "</a>" ;
													}
													else {
														print date("d", dateConvertToTimestamp($last5SchoolDays[$i])) . "<br/>" ;
														print "<span style='font-size: 65%'>" . date("M", dateConvertToTimestamp($last5SchoolDays[$i])) . "</span>" ;
													}
												print "</td>" ;
											}
										}
									print "</tr>" ;
								print "</table>" ;
								?>
							</td>
						</tr>
						<tr>
							<td> 
								<b>Type *</b><br/>
								<span style="font-size: 90%"><i></i></span>
							</td>
							<td class="right">
								<?
								print "<select style='float: none; width: 302px; margin-bottom: 3px' name='type'>" ;
									print "<option " ; if ($lastType=="Present") { print "selected " ; } ; print "value='Present'>Present</option>" ;
									print "<option " ; if ($lastType=="Present - Late") { print "selected " ; } ; print "value='Present - Late'>Present - Late</option>" ;
									print "<option " ; if ($lastType=="Present - Offsite") { print "selected " ; } ; print "value='Present - Offsite'>Present - Offsite</option>" ;
									print "<option " ; if ($lastType=="Absent") { print "selected " ; } ; print "value='Absent'>Absent</option>" ;
									print "<option " ; if ($lastType=="Left") { print "selected " ; } ; print "value='Left'>Left</option>" ;
									print "<option " ; if ($lastType=="Left - Early") { print "selected " ; } ; print "value='Left - Early'>Left - Early</option>" ;
								print "</select>" ;
								?>
							</td>
						</tr>
						<tr>
							<td> 
								<b>Reason</b><br/>
								<span style="font-size: 90%"><i></i></span>
							</td>
							<td class="right">
								<?
								print "<select style='float: none; width: 302px; margin-bottom: 10px' name='reason'>" ;
									print "<option " ; if ($lastReason=="") { print "selected " ; } ; print "value=''></option>" ;
									print "<option " ; if ($lastReason=="Pending") { print "selected " ; } ; print "value='Pending'>Pending</option>" ;
									print "<option " ; if ($lastReason=="Education") { print "selected " ; } ; print "value='Education'>Education</option>" ;
									print "<option " ; if ($lastReason=="Family") { print "selected " ; } ; print "value='Family'>Family</option>" ;
									print "<option " ; if ($lastReason=="Medical") { print "selected " ; } ; print "value='Medical'>Medical</option>" ;
									print "<option " ; if ($lastReason=="Other") { print "selected " ; } ; print "value='Other'>Other</option>" ;
								print "</select>" ;
								?>
							</td>
						</tr>
						<tr>
							<td> 
								<b>Comment</b><br/>
								<span style="font-size: 90%"><i>255 character limit</i></span>
							</td>
							<td class="right">
								<?
								print "<textarea name='comment' id='comment' rows=3 style='width: 300px'>$lastComment</textarea>" ;
								?>
								<script type="text/javascript">
									var comment = new LiveValidation('comment');
									comment.add( Validate.Length, { maximum: 255 } );
								 </script>
							</td>
						</tr>
						<tr>
							<td class="right" colspan=2>
								<? print "<input type='hidden' name='currentDate' value='$currentDate'>" ; ?>
								<input type="hidden" name="address" value="<? print $_SESSION[$guid]["address"] ?>">
								<input type="reset" value="Reset"> <input type="submit" value="Submit">
							</td>
						</tr>
						<tr>
							<td class="right" colspan=2>
								<span style="font-size: 90%"><i>* denotes a required field</i></span>
							</td>
						</tr>
					</table>
				</form>
				<?
			}
		}
	}
}
?>