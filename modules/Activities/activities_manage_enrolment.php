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

if (isActionAccessible($guid, $connection2, "/modules/Activities/activities_manage_enrolment.php")==FALSE) {
	//Acess denied
	print "<div class='error'>" ;
		print "You do not have access to this action." ;
	print "</div>" ;
}
else {
	//Proceed!
	print "<div class='trail'>" ;
	print "<div class='trailHead'><a href='" . $_SESSION[$guid]["absoluteURL"] . "'>Home</a> > <a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . getModuleName($_GET["q"]) . "/" . getModuleEntry($_GET["q"], $connection2, $guid) . "'>" . getModuleName($_GET["q"]) . "</a> > <a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/Activities/activities_manage.php'>Manage Activities</a> > </div><div class='trailEnd'>Activity Enrolment</div>" ;
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
		else if ($updateReturn=="fail3") {
			$updateReturnMessage ="Update failed because your inputs were invalid." ;	
		}
		else if ($updateReturn=="fail4") {
			$updateReturnMessage ="Update failed some values need to be unique but were not." ;	
		}
		else if ($updateReturn=="fail5") {
			$updateReturnMessage ="Update failed because your attachment could not be uploaded." ;	
		}
		else if ($updateReturn=="success0") {
			$updateReturnMessage ="Update was successful." ;	
			$class="success" ;
		}
		print "<div class='$class'>" ;
			print $updateReturnMessage;
		print "</div>" ;
	} 
	
	$deleteReturn = $_GET["deleteReturn"] ;
	$deleteReturnMessage ="" ;
	$class="error" ;
	if (!($deleteReturn=="")) {
		if ($deleteReturn=="fail0") {
			$deleteReturnMessage ="Delete failed because you do not have access to this action." ;	
		}
		else if ($deleteReturn=="fail1") {
			$deleteReturnMessage ="Delete failed because a required parameter was not set." ;	
		}
		else if ($deleteReturn=="fail2") {
			$deleteReturnMessage ="Delete failed due to a database error." ;	
		}
		else if ($deleteReturn=="fail3") {
			$deleteReturnMessage ="Delete failed because your inputs were invalid." ;	
		}
		else if ($deleteReturn=="success0") {
			$deleteReturnMessage ="Delete was successful." ;	
			$class="success" ;
		}
		print "<div class='$class'>" ;
			print $deleteReturnMessage;
		print "</div>" ;
	} 
	
	//Check if school year specified
	$gibbonActivityID=$_GET["gibbonActivityID"];
	if ($gibbonActivityID=="Y") {
		print "<div class='error'>" ;
			print "You have not specified an activity." ;
		print "</div>" ;
	}
	else {
		try {
			$data=array("gibbonActivityID"=>$gibbonActivityID); 
			$sql="SELECT * FROM gibbonActivity WHERE gibbonActivityID=:gibbonActivityID" ;
			$result=$connection2->prepare($sql);
			$result->execute($data);
		}
		catch(PDOException $e) { 
			print "<div class='error'>" . $e->getMessage() . "</div>" ; 
		}
		
		if ($result->rowCount()!=1) {
			print "<div class='error'>" ;
				print "The selected activity does not exist, is in a previous school year, or you do not have access to it." ;
			print "</div>" ;
		}
		else {
			//Let's go!
			$row=$result->fetch() ;
			$dateType=getSettingByScope($connection2, "Activities", "dateType") ;
			?>
			<form method="post" action="<? print $_SESSION[$guid]["absoluteURL"] . "/modules/" . $_SESSION[$guid]["module"] . "/tt_editProcess.php?gibbonTTID=$gibbonTTID&gibbonSchoolYearID=" . $_GET["gibbonSchoolYearID"] ?>">
				<table class='smallIntBorder' cellspacing='0' style="width: 100%">	
					<tr>
						<td> 
							<b>Name</b><br/>
						</td>
						<td class="right">
							<input readonly name="name" id="name" maxlength=20 value="<? print $row["name"] ?>" type="text" style="width: 300px">
						</td>
					</tr>
					<?
					if ($dateType=="Date") {
						?>
						<tr>
							<td> 
								<b>Listing Dates</b><br/>
							</td>
							<td class="right">
								<input readonly name="name" id="name" maxlength=20 value="<? print dateConvertBack($row["listingStart"]) . "-" . dateConvertBack($row["listingEnd"]) ?>" type="text" style="width: 300px">
							</td>
						</tr>
						<tr>
							<td> 
								<b>Program Dates</b><br/>
							</td>
							<td class="right">
								<input readonly name="name" id="name" maxlength=20 value="<? print dateConvertBack($row["programStart"]) . "-" . dateConvertBack($row["programEnd"]) ?>" type="text" style="width: 300px">
							</td>
						</tr>
						<?
					}
					else {
						?>
						<tr>
							<td> 
								<b>Terms</b><br/>
							</td>
							<td class="right">
								<?
								$terms=getTerms($connection2, $_SESSION[$guid]["gibbonSchoolYearID"], true) ;
								$termList="" ;
								for ($i=0; $i<count($terms); $i=$i+2) {
									if (is_numeric(strpos($row["gibbonSchoolYearTermIDList"], $terms[$i]))) {
										$termList.=$terms[($i+1)] . ", " ;
									}
								}
								if ($termList=="") {
									$termList="-, " ;
								}
								?>
								<input readonly name="name" id="name" maxlength=20 value="<? print substr($termList,0,-2) ?>" type="text" style="width: 300px">
							</td>
						</tr>
						<?
					}
					?>
				</table>
			</form>
			
			<?
			$enrolment=getSettingByScope($connection2, "Activities", "enrolmentType") ;
			try {
				if ($enrolment=="Competitive") {
					$data=array("gibbonActivityID"=>$gibbonActivityID); 
					$sql="SELECT gibbonActivityStudent.*, surname, preferredName FROM gibbonActivityStudent JOIN gibbonPerson ON (gibbonActivityStudent.gibbonPersonID=gibbonPerson.gibbonPersonID) WHERE gibbonActivityID=:gibbonActivityID AND NOT gibbonActivityStudent.status='Pending' AND gibbonPerson.status='Full' AND (dateStart IS NULL OR dateStart<='" . date("Y-m-d") . "') AND (dateEnd IS NULL  OR dateEnd>='" . date("Y-m-d") . "') ORDER BY gibbonActivityStudent.status, timestamp" ; 
				}
				else {
					$data=array("gibbonActivityID"=>$gibbonActivityID); 
					$sql="SELECT gibbonActivityStudent.*, surname, preferredName FROM gibbonActivityStudent JOIN gibbonPerson ON (gibbonActivityStudent.gibbonPersonID=gibbonPerson.gibbonPersonID) WHERE gibbonActivityID=:gibbonActivityID AND NOT gibbonActivityStudent.status='Waiting List' AND gibbonPerson.status='Full' AND (dateStart IS NULL OR dateStart<='" . date("Y-m-d") . "') AND (dateEnd IS NULL  OR dateEnd>='" . date("Y-m-d") . "') ORDER BY gibbonActivityStudent.status, timestamp" ; 
				}
				$result=$connection2->prepare($sql);
				$result->execute($data);
			}
			catch(PDOException $e) { 
				print "<div class='error'>" . $e->getMessage() . "</div>" ; 
			}
			
			print "<div class='linkTop'>" ;
			print "<a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . $_SESSION[$guid]["module"] . "/activities_manage_enrolment_add.php&gibbonActivityID=$gibbonActivityID'><img title='New' src='./themes/" . $_SESSION[$guid]["gibbonThemeName"] . "/img/page_new.gif'/></a>" ;
			print "</div>" ;
			
			if ($result->rowCount()<1) {
				print "<div class='error'>" ;
				print "There are no students to display." ;
				print "</div>" ;
			}
			else {
				print "<table cellspacing='0' style='width: 100%'>" ;
					print "<tr class='head'>" ;
						print "<th>" ;
							print "Student" ;
						print "</th>" ;
						print "<th>" ;
							print "Status" ;
						print "</th>" ;
						print "<th>" ;
							print "Timestamp" ;
						print "</th>" ;
						print "<th>" ;
							print "Actions" ;
						print "</th>" ;
					print "</tr>" ;
					
					$count=0;
					$rowNum="odd" ;
					while ($row=$result->fetch()) {
						if ($count%2==0) {
							$rowNum="even" ;
						}
						else {
							$rowNum="odd" ;
						}
						$count++ ;
						
						if ($row["active"]=="N") {
							$rowNum="error" ;
						}
		
						//COLOR ROW BY STATUS!
						print "<tr class=$rowNum>" ;
							print "<td>" ;
								print formatName("", $row["preferredName"], $row["surname"], "Student", true) ;
							print "</td>" ;
							print "<td>" ;
								print $row["status"] ;
							print "</td>" ;
							print "<td>" ;
								print dateConvertBack(substr($row["timestamp"],0,10)) . " at " . substr($row["timestamp"],11,5) ;
							print "</td>" ;
							print "<td>" ;
								print "<a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . $_SESSION[$guid]["module"] . "/activities_manage_enrolment_edit.php&gibbonActivityID=" . $row["gibbonActivityID"] . "&gibbonPersonID=" . $row["gibbonPersonID"] . "'><img title='Edit' src='./themes/" . $_SESSION[$guid]["gibbonThemeName"] . "/img/config.png'/></a> " ;
								print "<a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . $_SESSION[$guid]["module"] . "/activities_manage_enrolment_delete.php&gibbonActivityID=" . $row["gibbonActivityID"] . "&gibbonPersonID=" . $row["gibbonPersonID"] . "'><img title='Delete' src='./themes/" . $_SESSION[$guid]["gibbonThemeName"] . "/img/garbage.png'/></a> " ;
							print "</td>" ;
						print "</tr>" ;
					}
				print "</table>" ;
			}
		}
	}
}
?>