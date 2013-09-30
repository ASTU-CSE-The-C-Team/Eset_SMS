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

if (isActionAccessible($guid, $connection2, "/modules/Planner/units_edit.php")==FALSE) {
	//Acess denied
	print "<div class='error'>" ;
		print "You do not have access to this action." ;
	print "</div>" ;
}
else {
	//Get action with highest precendence
	$highestAction=getHighestGroupedAction($guid, $_GET["q"], $connection2) ;
	if ($highestAction==FALSE) {
		print "<div class='error'>" ;
		print "The highest grouped action cannot be determined." ;
		print "</div>" ;
	}
	else {
		//IF UNIT DOES NOT CONTAIN HYPHEN, IT IS A GIBBON UNIT
		$gibbonUnitID=$_GET["gibbonUnitID"]; 
		if (strpos($gibbonUnitID,"-")==FALSE) {
			$hooked=FALSE ;
		}
		else {
			$hooked=TRUE ;
			$gibbonHookIDToken=substr($gibbonUnitID,11) ;
			$gibbonUnitIDToken=substr($gibbonUnitID,0,10) ;
		}
		
		//Proceed!
		print "<div class='trail'>" ;
		print "<div class='trailHead'><a href='" . $_SESSION[$guid]["absoluteURL"] . "'>Home</a> > <a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . getModuleName($_GET["q"]) . "/" . getModuleEntry($_GET["q"], $connection2, $guid) . "'>" . getModuleName($_GET["q"]) . "</a> > <a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . getModuleName($_GET["q"]) . "/units.php&gibbonSchoolYearID=" . $_GET["gibbonSchoolYearID"] . "&gibbonCourseID=" . $_GET["gibbonCourseID"] . "'>Manage Units</a> > </div><div class='trailEnd'>Edit Unit</div>" ;
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
				$updateReturnMessage ="Add failed due to an attachment error." ;	
			}
			else if ($updateReturn=="fail6") {
				$updateReturnMessage ="Some aspects of the update failed." ;	
			}
			else if ($updateReturn=="success0") {
				$updateReturnMessage ="Update was successful." ;	
				$class="success" ;
			}
			print "<div class='$class'>" ;
				print $updateReturnMessage;
			print "</div>" ;
		} 
		
		$addReturn = $_GET["addReturn"] ;
		$addReturnMessage ="" ;
		$class="error" ;
		if (!($addReturn=="")) {
			if ($addReturn=="success0") {
				$addReturnMessage ="Your Smart Unit was successfully created: you can now <b><u>edit and deploy it using the form below</u></b>." ;	
				$class="success" ;
			}
			print "<div class='$class'>" ;
				print $addReturnMessage;
			print "</div>" ;
		} 
		
		$deployReturn = $_GET["deployReturn"] ;
		$deployReturnMessage ="" ;
		$class="error" ;
		if (!($deployReturn=="")) {
			if ($deployReturn=="fail0") {
				$deployReturnMessage ="Deploy failed because you do not have access to this action." ;	
			}
			else if ($deployReturn=="fail2") {
				$deployReturnMessage ="Deploy failed due to a database error." ;	
			}
			else if ($deployReturn=="fail3") {
				$deployReturnMessage ="Deploy failed because your inputs were invalid." ;	
			}
			else if ($deployReturn=="fail4") {
				$deployReturnMessage ="Deploy failed because you do not have access to the specified course." ;	
			}
			else if ($deployReturn=="fail6") {
				$deployReturnMessage ="Some aspects of the deploy failed." ;	
			}
			else if ($deployReturn=="success0") {
				$deployReturnMessage ="Deploy was successful." ;	
				$class="success" ;
			}
			print "<div class='$class'>" ;
				print $deployReturnMessage;
			print "</div>" ;
		} 
		
		$copyReturn = $_GET["copyReturn"] ;
		$copyReturnMessage ="" ;
		$class="error" ;
		if (!($copyReturn=="")) {
			if ($copyReturn=="success0") {
				$copyReturnMessage ="Copy was successful. The blocks from the selected working unit have replaced those in the master unit (see below for the new block listing)." ;	
				$class="success" ;
			}
			print "<div class='$class'>" ;
				print $copyReturnMessage;
			print "</div>" ;
		} 
		
		$copyForwardReturn = $_GET["copyForwardReturn"] ;
		$copyForwardReturnMessage ="" ;
		$class="error" ;
		if (!($copyForwardReturn=="")) {
			if ($copyForwardReturn=="success0") {
				$copyForwardReturnMessage ="Copy forward was successful. You can now work on your new unit below." ;	
				$class="success" ;
			}
			print "<div class='$class'>" ;
				print $copyForwardReturnMessage;
			print "</div>" ;
		} 
									
		//Check if courseschool year specified
		$gibbonSchoolYearID=$_GET["gibbonSchoolYearID"];
		$gibbonCourseID=$_GET["gibbonCourseID"]; 
		if ($gibbonCourseID=="" OR $gibbonSchoolYearID=="") {
			print "<div class='error'>" ;
				print "You have not specified a course." ;
			print "</div>" ;
		}
		else {
			//IF UNIT DOES NOT CONTAIN HYPHEN, IT IS A GIBBON UNIT
			if (strpos($gibbonUnitID,"-")==FALSE) {
				try {
					if ($highestAction=="Manage Units_all") {
						$data=array("gibbonSchoolYearID"=>$gibbonSchoolYearID, "gibbonCourseID"=>$gibbonCourseID); 
						$sql="SELECT * FROM gibbonCourse WHERE gibbonSchoolYearID=:gibbonSchoolYearID AND gibbonCourseID=:gibbonCourseID" ;
					}
					else if ($highestAction=="Manage Units_learningAreas") {
						$data=array("gibbonSchoolYearID"=>$gibbonSchoolYearID, "gibbonCourseID"=>$gibbonCourseID, "gibbonPersonID"=>$_SESSION[$guid]["gibbonPersonID"]); 
						$sql="SELECT gibbonCourseID, gibbonCourse.name, gibbonCourse.nameShort, gibbonYearGroupIDList FROM gibbonCourse JOIN gibbonDepartment ON (gibbonCourse.gibbonDepartmentID=gibbonDepartment.gibbonDepartmentID) JOIN gibbonDepartmentStaff ON (gibbonDepartmentStaff.gibbonDepartmentID=gibbonDepartment.gibbonDepartmentID) WHERE gibbonDepartmentStaff.gibbonPersonID=:gibbonPersonID AND (role='Coordinator' OR role='Assistant Coordinator' OR role='Teacher (Curriculum)') AND gibbonSchoolYearID=:gibbonSchoolYearID AND gibbonCourseID=:gibbonCourseID ORDER BY gibbonCourse.nameShort" ;
					}
					$result=$connection2->prepare($sql);
					$result->execute($data);
				}
				catch(PDOException $e) { 
					print "<div class='error'>" . $e->getMessage() . "</div>" ; 
				}

				if ($result->rowCount()!=1) {
					print "<div class='error'>" ;
						print "The specified course cannot be found or you do not have access to it." ;
					print "</div>" ;
				}
				else {
					$row=$result->fetch() ;
					$yearName=$row["name"] ;
					$gibbonYearGroupIDList=$row["gibbonYearGroupIDList"] ;
				
					//Check if unit specified
					if ($gibbonUnitID=="") {
						print "<div class='error'>" ;
							print "You have not specified a unit." ;
						print "</div>" ;
					}
					else {
						try {
							$data=array("gibbonUnitID"=>$gibbonUnitID, "gibbonCourseID"=>$gibbonCourseID); 
							$sql="SELECT gibbonCourse.nameShort AS courseName, gibbonCourse.gibbonDepartmentID, gibbonUnit.* FROM gibbonUnit JOIN gibbonCourse ON (gibbonUnit.gibbonCourseID=gibbonCourse.gibbonCourseID) WHERE gibbonUnitID=:gibbonUnitID AND gibbonUnit.gibbonCourseID=:gibbonCourseID" ;
							$result=$connection2->prepare($sql);
							$result->execute($data);
						}
						catch(PDOException $e) { 
							print "<div class='error'>" . $e->getMessage() . "</div>" ; 
						}
						if ($result->rowCount()!=1) {
							print "<div class='error'>" ;
								print "The specified unit cannot be found." ;
							print "</div>" ;
						}
						else {
							//Let's go!
							$row=$result->fetch() ;
							$gibbonDepartmentID=$row["gibbonDepartmentID"] ;
							?>
							<form method="post" action="<? print $_SESSION[$guid]["absoluteURL"] . "/modules/" . $_SESSION[$guid]["module"] . "/units_editProcess.php?gibbonUnitID=$gibbonUnitID&gibbonSchoolYearID=$gibbonSchoolYearID&gibbonCourseID=$gibbonCourseID&address=" . $_GET["q"] ?>" enctype="multipart/form-data">
								<table class='smallIntBorder' cellspacing='0' style="width: 100%">	
									<tr class='break'>
										<td colspan=2> 
											<h3>Unit Basics</h3>
										</td>
									</tr>
									<tr>
										<td> 
											<b>School Year *</b><br/>
											<span style="font-size: 90%"><i>This value cannot be changed.</i></span>
										</td>
										<td class="right">
											<input readonly name="yearName" id="yearName" maxlength=20 value="<? print $yearName ?>" type="text" style="width: 300px">
										</td>
									</tr>
									<tr>
										<td> 
											<b>Course *</b><br/>
											<span style="font-size: 90%"><i>This value cannot be changed.</i></span>
										</td>
										<td class="right">
											<input readonly name="courseName" id="courseName" maxlength=20 value="<? print $row["courseName"] ?>" type="text" style="width: 300px">
										</td>
									</tr>
									<tr>
										<td> 
											<b>Name *</b><br/>
											<span style="font-size: 90%"><i></i></span>
										</td>
										<td class="right">
											<input name="name" id="name" maxlength=40 value="<? print $row["name"] ?>" type="text" style="width: 300px">
											<script type="text/javascript">
												var name = new LiveValidation('name');
												name.add(Validate.Presence);
											 </script>
										</td>
									</tr>
									<tr>
										<td colspan=2> 
											<b>Blurb *</b> 
											<textarea name='description' id='description' rows=5 style='width: 300px'><? print $row["description"] ?></textarea>
											<script type="text/javascript">
												var description = new LiveValidation('description');
												description.add(Validate.Presence);
											</script>
										</td>
									</tr>
									
									<tr>
										<td> 
											<b>Embeddable *</b><br/>
											<span style="font-size: 90%"><i>Can this unit be embedded in another website, and so shared publicly?</i></span>
										</td>
										<td class="right">
											<input <? if ($row["embeddable"]=="Y") { print "checked" ; } ?> type="radio" id="embeddable" name="embeddable" class="embeddable" value="Y" /> Yes
											<input <? if ($row["embeddable"]=="N") { print "checked" ; } ?> type="radio" id="embeddable" name="embeddable" class="embeddable" value="N" /> No
										</td>
									</tr>
									<script type="text/javascript">
										$(document).ready(function(){
											<?
											if ($row["embeddable"]=="Y") {
												print "$(\"#embeddableRow\").slideDown(\"fast\", $(\"#embeddableRow\").css(\"display\",\"table-row\"));" ;
											}
											?>
											
											$(".embeddable").click(function(){
												if ($('input[name=embeddable]:checked').val() == "Y" ) {
													$("#embeddableRow").slideDown("fast", $("#embeddableRow").css("display","table-row"));
												} else {
													$("#embeddableRow").css("display","none");
													
												}
											 });
										});
									</script>
									
									<tr id="embeddableRow" <? if ($row["embeddable"]=="N") { print "style='display: none'" ; } ?>>
										<td> 
											<b>Embed Code</b><br/>
											<span style="font-size: 90%"><i>Copy and paste this HTML code into the target website.</i></span>
										</td>
										<td class="right">
											<textarea readonly name='embedCode' id='embedCode' rows=5 style='width: 300px'><? print "<iframe style='border: none; width: 620px; height: 800px; overflow-x: hidden; overflow-y: scroll' src=\"" . $_SESSION[$guid]["absoluteURL"] . "/modules/Planner/units_embed.php?gibbonUnitID=$gibbonUnitID&gibbonSchoolYearID=$gibbonSchoolYearID&gibbonCourseID=$gibbonCourseID&themeName=" . $_SESSION[$guid]["gibbonThemeName"] . "&title=false\"></iframe>" ?></textarea>
										</td>
									</tr>
								
									<tr class='break'>
										<td colspan=2> 
											<h3>Classes</h3>
										</td>
									</tr>
									<?
									if ($_SESSION[$guid]["gibbonSchoolYearIDCurrent"]==$gibbonSchoolYearID AND $_SESSION[$guid]["gibbonSchoolYearIDCurrent"]==$_SESSION[$guid]["gibbonSchoolYearID"]) {
										?>
										<tr>
											<td colspan=2> 
												<p>Select classes which will have access to this unit.</p>
												<?
												$classCount=0 ;
												try {
													$dataClass=array("gibbonCourseID"=>$gibbonCourseID); 
													$sqlClass="SELECT * FROM gibbonCourseClass WHERE gibbonCourseID=:gibbonCourseID ORDER BY name" ;
													$resultClass=$connection2->prepare($sqlClass);
													$resultClass->execute($dataClass);
												}
												catch(PDOException $e) { 
													print "<div class='error'>" . $e->getMessage() . "</div>" ; 
												}
										
												if ($resultClass->rowCount()<1) {
													print "<div class='error'>" ;
													print "There are no classes to display." ;
													print "</div>" ;
												}
												else {
													print "<table cellspacing='0' style='width: 100%'>" ;
														print "<tr class='head'>" ;
															print "<th>" ;
																print "Class" ;
															print "</th>" ;
															print "<th>" ;
																print "Running<br/><span style='font-size: 80%'>Is class doing unit?</span>" ;
															print "</th>" ;
															print "<th>" ;
																print "First Lesson<br/><span style='font-size: 80%'>dd/mm/yyy<y/span>" ;
															print "</th>" ;
															print "<th>" ;
																print "Actions" ;
															print "</th>" ;
														print "</tr>" ;
												
														$count=0;
														$rowNum="odd" ;
								
														while ($rowClass=$resultClass->fetch()) {
															if ($count%2==0) {
																$rowNum="even" ;
															}
															else {
																$rowNum="odd" ;
															}
															$count++ ;
													
															try {
																$dataClassData=array("gibbonUnitID"=>$gibbonUnitID, "gibbonCourseClassID"=>$rowClass["gibbonCourseClassID"]); 
																$sqlClassData="SELECT * FROM gibbonUnitClass WHERE gibbonUnitID=:gibbonUnitID AND gibbonCourseClassID=:gibbonCourseClassID" ;
																$resultClassData=$connection2->prepare($sqlClassData);
																$resultClassData->execute($dataClassData);
															}
															catch(PDOException $e) { 
																print "<div class='error'>" . $e->getMessage() . "</div>" ; 
															}
															$rowClassData=NULL ;
															if ($resultClassData->rowCount()==1) {
																$rowClassData=$resultClassData->fetch() ;
															}
													
															//COLOR ROW BY STATUS!
															print "<tr class=$rowNum>" ;
																print "<td>" ;
																	print $row["courseName"] . "." . $rowClass["name"] . "</a>" ;
																print "</td>" ;
																print "<td>" ;
																	?>
																	<input name="gibbonCourseClassID<? print $classCount?>" id="gibbonCourseClassID<? print $classCount?>" maxlength=10 value="<? print $rowClass["gibbonCourseClassID"] ?>" type="hidden" style="width: 300px">
																	<select name="running<? print $classCount?>" id="running<? print $classCount?>" style="width:100%">
																		<option <? if ($rowClassData["running"]=="N") { print "selected ";} ?>value="N">N</option>
																		<option <? if ($rowClassData["running"]=="Y") { print "selected ";} ?>value="Y">Y</option>
																	</select>
																	<?
																print "</td>" ;
																print "<td>" ;
																	try {
																		$dataDate=array("gibbonCourseClassID"=>$rowClass["gibbonCourseClassID"], "gibbonUnitID"=>$gibbonUnitID); 
																		$sqlDate="SELECT date FROM gibbonPlannerEntry WHERE gibbonCourseClassID=:gibbonCourseClassID AND gibbonUnitID=:gibbonUnitID ORDER BY date, timeStart" ;
																		$resultDate=$connection2->prepare($sqlDate);
																		$resultDate->execute($dataDate);
																	}
																	catch(PDOException $e) { }
																	if ($resultDate->rowCount()<1) {
																		print "<i>There are no lessons in this unit.</i>" ;
																	}
																	else {
																		$rowDate=$resultDate->fetch() ;
																		print dateConvertBack($rowDate["date"]) ;
																	}
																print "</td>" ;
																print "<td>" ;
																	if ($rowClassData["running"]=="Y") {
																		if ($resultDate->rowCount()<1) {
																			print "<a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . $_SESSION[$guid]["module"] . "/units_edit_deploy.php&gibbonCourseClassID=" . $rowClass["gibbonCourseClassID"] . "&gibbonCourseID=$gibbonCourseID&gibbonUnitID=$gibbonUnitID&gibbonSchoolYearID=$gibbonSchoolYearID&gibbonUnitClassID=" . $rowClassData["gibbonUnitClassID"] . "'><img title='Edit Unit' src='./themes/" . $_SESSION[$guid]["gibbonThemeName"] . "/img/config.png'/></a> " ;
																		}
																		else {
																			print "<a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . $_SESSION[$guid]["module"] . "/units_edit_working.php&gibbonCourseClassID=" . $rowClass["gibbonCourseClassID"] . "&gibbonCourseID=$gibbonCourseID&gibbonUnitID=$gibbonUnitID&gibbonSchoolYearID=$gibbonSchoolYearID&gibbonUnitClassID=" . $rowClassData["gibbonUnitClassID"] . "'><img title='Edit Unit' src='./themes/" . $_SESSION[$guid]["gibbonThemeName"] . "/img/config.png'/></a> " ;
																		}
																		print "<a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . $_SESSION[$guid]["module"] . "/planner.php&gibbonCourseClassID=" . $rowClass["gibbonCourseClassID"] . "&viewBy=class'><img style='margin-top: 3px' title='View Planner' src='./themes/" . $_SESSION[$guid]["gibbonThemeName"] . "/img/planner.gif'/></a> " ;
																		print "<a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . $_SESSION[$guid]["module"] . "/units_edit_copyBack.php&gibbonCourseClassID=" . $rowClass["gibbonCourseClassID"] . "&gibbonCourseID=$gibbonCourseID&gibbonUnitID=$gibbonUnitID&gibbonSchoolYearID=$gibbonSchoolYearID&gibbonUnitClassID=" . $rowClassData["gibbonUnitClassID"] . "'><img title='Copy Back' src='./themes/" . $_SESSION[$guid]["gibbonThemeName"] . "/img/copyback.png'/></a> " ;
																		print "<a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . $_SESSION[$guid]["module"] . "/units_edit_copyForward.php&gibbonCourseClassID=" . $rowClass["gibbonCourseClassID"] . "&gibbonCourseID=$gibbonCourseID&gibbonUnitID=$gibbonUnitID&gibbonSchoolYearID=$gibbonSchoolYearID&gibbonUnitClassID=" . $rowClassData["gibbonUnitClassID"] . "'><img title='Copy Forward' src='./themes/" . $_SESSION[$guid]["gibbonThemeName"] . "/img/copyforward.png'/></a> " ;
																	}
																print "</td>" ;
															print "</tr>" ;
															$classCount++ ;
														}
													print "</table>" ;
												}
												?>
											</td>
										</tr>
										<?
									}
									else {
										print "<tr>" ;
											print "<td colspan=2 style='margin-top: 0; padding-top: 0'>" ;
												print "<div class='warning'>" ;
													print "You are currently not logged into the current year and/or are looking at units in another year, and so you cannot access your classes. Please log back into the current school year, and look at units in the current year." ;
												print "</div>" ;
											print "</td>" ;
										print "</tr>" ;
									}
									?>
									
									
							
								
									<tr class='break'>
										<td colspan=2> 
											<h3>Unit Outline</h3>
										</td>
									</tr>
									<tr>
										<td colspan=2>
											<p>The contents of this field are viewable only to those with full access to the Planner (usually teachers and administrators, but not students and parents), whereas the downloadable version (below) is available to more users.</p>
											<? print getEditor($guid,  TRUE, "details", $row["details"], 40, true, false, false) ?>
										</td>
									</tr>
									<tr>
										<td> 
											<b>Downloadable Unit Outline</b><br/>
											<span style="font-size: 90%"><i>Available to most users.</i></span>
											<? if ($row["attachment"]!="") { ?>
											<span style="font-size: 90%"><i>Will overwrite existing attachment</i></span>
											<? } ?>
										</td>
										<td class="right">
											<?
											if ($row["attachment"]!="") {
												print "Current attachment: <a href='" . $_SESSION[$guid]["absoluteURL"] . "/" . $row["attachment"] . "'>" . $row["attachment"] . "</a><br/><br/>" ;
											}
											?>
											<input type="file" name="file" id="file"><br/><br/>
											<?
											print getMaxUpload() ;
										
											//Get list of acceptable file extensions
											try {
												$dataExt=array(); 
												$sqlExt="SELECT * FROM gibbonFileExtension" ;
												$resultExt=$connection2->prepare($sqlExt);
												$resultExt->execute($dataExt);
											}
											catch(PDOException $e) { }
											$ext="" ;
											while ($rowExt=$resultExt->fetch()) {
												$ext=$ext . "'." . $rowExt["extension"] . "'," ;
											}
											?>
										
											<script type="text/javascript">
												var file = new LiveValidation('file');
												file.add( Validate.Inclusion, { within: [<? print $ext ;?>], failureMessage: "Illegal file type!", partialMatch: true, caseSensitive: false } );
											</script>
										</td>
									</tr>
							
									<tr class='break'>
										<td colspan=2>
											<h3>Smart Blocks</h3>
										</td>
									</tr>
									<tr>
										<td colspan=2>
											<p>
												Smart Blocks aid unit planning by giving teachers help in creating and maintaining new units, splitting material into smaller units which can be deployed to lesson plans. As well as predefined fields to fill, Smart Units provide a visual view of the content blocks that make up a unit. Blocks may be any kind of content, such as discussion, assessments, group work, outcome etc.
											</p>
										
											<style>
												#sortable { list-style-type: none; margin: 0; padding: 0; width: 100%; }
												#sortable div.ui-state-default { margin: 0 0px 5px 0px; padding: 5px; font-size: 100%; min-height: 58px; }
												div.ui-state-default_dud { margin: 5px 0px 5px 0px; padding: 5px; font-size: 100%; min-height: 58px; }
												html>body #sortable li { min-height: 58px; line-height: 1.2em; }
												.ui-state-highlight { margin-bottom: 5px; min-height: 58px; line-height: 1.2em; width: 100%; }
											</style>
											<script>
												$(function() {
													$( "#sortable" ).sortable({
														placeholder: "ui-state-highlight", 
														axis: 'y'
													});
												});
											</script>
										
										
											<div class="sortable" id="sortable" style='width: 100%; padding: 5px 0px 0px 0px'>
												<? 
												try {
													$dataBlocks=array("gibbonUnitID"=>$gibbonUnitID); 
													$sqlBlocks="SELECT * FROM gibbonUnitBlock WHERE gibbonUnitID=:gibbonUnitID ORDER BY sequenceNumber" ;
													$resultBlocks=$connection2->prepare($sqlBlocks);
													$resultBlocks->execute($dataBlocks);
												}
												catch(PDOException $e) { 
													print "<div class='error'>" . $e->getMessage() . "</div>" ; 
												}
												$i=1 ;
												while ($rowBlocks=$resultBlocks->fetch()) {
													makeBlock($guid, $connection2, $i, "masterEdit", $rowBlocks["title"], $rowBlocks["type"], $rowBlocks["length"], $rowBlocks["contents"], "N", $rowBlocks["gibbonUnitBlockID"], "", $rowBlocks["teachersNotes"], TRUE) ;
													$i++ ;
												}
												?>
											</div>
											<div style='width: 100%; padding: 0px 0px 0px 0px'>
												<div class="ui-state-default_dud" style='padding: 0px; height: 40px'>
													<table class='blank' cellspacing='0' style='width: 100%'>
														<tr>
															<td style='width: 50%'>
																<script type="text/javascript">
																	var count=<? print ($resultBlocks->rowCount()+1) ?> ;
																	$(document).ready(function(){
																		$("#new").click(function(){
																			$("#sortable").append('<div id=\'blockOuter' + count + '\'><img style=\'margin: 10px 0 5px 0\' src=\'<? print $_SESSION[$guid]["absoluteURL"] ?>/themes/Default/img/loading.gif\' alt=\'Loading\' onclick=\'return false;\' /><br/>Loading</div>');
																			$("#blockOuter" + count).load("<? print $_SESSION[$guid]["absoluteURL"] ?>/modules/Planner/units_add_blockAjax.php","id=" + count + "&mode=masterEdit") ;
																			count++ ;
																		 });
																	});
																</script>
																<div id='new' style='cursor: default; float: none; border: 1px dotted #aaa; background: none; margin-left: 3px; color: #999; margin-top: 0px; font-size: 140%; font-weight: bold; width: 350px'>Click to create a new block</div><br/>
															</td>
														</tr>
													</table>
												</div>
											</div>
										</td>
									</tr>
								
									<tr class='break'>
										<td colspan=2> 
											<h3>Outcomes</h3>
										</td>
									</tr>
									<? 
									$type="outcome" ; 
									$allowOutcomeEditing=getSettingByScope($connection2, "Planner", "allowOutcomeEditing") ;
									$categories=array() ;
									$categoryCount=0 ;
									?> 
									<style>
										#<? print $type ?> { list-style-type: none; margin: 0; padding: 0; width: 100%; }
										#<? print $type ?> div.ui-state-default { margin: 0 0px 5px 0px; padding: 5px; font-size: 100%; min-height: 58px; }
										div.ui-state-default_dud { margin: 5px 0px 5px 0px; padding: 5px; font-size: 100%; min-height: 58px; }
										html>body #<? print $type ?> li { min-height: 58px; line-height: 1.2em; }
										.<? print $type ?>-ui-state-highlight { margin-bottom: 5px; min-height: 58px; line-height: 1.2em; width: 100%; }
										.<? print $type ?>-ui-state-highlight {border: 1px solid #fcd3a1; background: #fbf8ee url(images/ui-bg_glass_55_fbf8ee_1x400.png) 50% 50% repeat-x; color: #444444; }
									</style>
									<script>
										$(function() {
											$( "#<? print $type ?>" ).sortable({
												placeholder: "<? print $type ?>-ui-state-highlight",
												axis: 'y'
											});
										});
									</script>
									<tr>
										<td colspan=2> 
											<p>Link this unit to outcomes (defined in the Manage Outcomes section of the Planner), and track which outcomes are being met in which units, classes and courses.</p>
											<div class="outcome" id="outcome" style='width: 100%; padding: 5px 0px 0px 0px; min-height: 66px'>
												<?
												try {
													$dataBlocks=array("gibbonUnitID"=>$gibbonUnitID);  
													$sqlBlocks="SELECT gibbonUnitOutcome.*, scope, name, category FROM gibbonUnitOutcome JOIN gibbonOutcome ON (gibbonUnitOutcome.gibbonOutcomeID=gibbonOutcome.gibbonOutcomeID) WHERE gibbonUnitID=:gibbonUnitID AND active='Y' ORDER BY sequenceNumber" ;
													$resultBlocks=$connection2->prepare($sqlBlocks);
													$resultBlocks->execute($dataBlocks);
												}
												catch(PDOException $e) { 
													print "<div class='error'>" . $e->getMessage() . "</div>" ; 
												}
												if ($resultBlocks->rowCount()<1) {
													print "<div id='outcomeOuter0'>" ;
														print "<div style='color: #ddd; font-size: 230%; margin: 15px 0 0 6px'>Outcomes listed here...</div>" ;
													print "</div>" ;
												}
												else {
													$usedArrayFill="" ;
													$i=1 ;
													while ($rowBlocks=$resultBlocks->fetch()) {
														makeBlockOutcome($guid, $i, "outcome", $rowBlocks["gibbonOutcomeID"],  $rowBlocks["name"],  $rowBlocks["category"], $rowBlocks["content"],"",TRUE, $allowOutcomeEditing) ;
														$usedArrayFill.="\"" . $rowBlocks["gibbonOutcomeID"] . "\"," ;
														$i++ ;
													}
												}
												?>
											</div>
											<div style='width: 100%; padding: 0px 0px 0px 0px'>
												<div class="ui-state-default_dud" style='padding: 0px; min-height: 50px'>
													<table class='blank' cellspacing='0' style='width: 100%'>
														<tr>
															<td style='width: 50%'>
																<script type="text/javascript">
																	<?
																	if ($i<1) {
																		print "var outcomeCount=0;" ;
																	}
																	else {
																		print "var outcomeCount=$i;" ;
																	}
																	?>
																</script>
																<select class='all' id='newOutcome' onChange='outcomeDisplayElements(this.value);' style='float: none; margin-left: 3px; margin-top: 0px; margin-bottom: 3px; width: 350px'>
																	<option class='all' value='0'>Choose an outcome to add it to this unit</option>
																	<?
																	$currentCategory="" ;
																	$lastCategory="" ;
																	$switchContents="" ;
																	try {
																		$countClause=0 ;
																		$years=explode(",", $gibbonYearGroupIDList) ;
																		$dataSelect=array();  
																		$sqlSelect="" ;
																		foreach ($years as $year) {
																			$dataSelect["clause" . $countClause]="%" . $year . "%" ;
																			$sqlSelect.="(SELECT * FROM gibbonOutcome WHERE active='Y' AND scope='School' AND gibbonYearGroupIDList LIKE :clause" . $countClause . ") UNION " ;
																			$countClause++ ;
																		}
																		$resultSelect=$connection2->prepare(substr($sqlSelect,0,-6) . "ORDER BY category, name");
																		$resultSelect->execute($dataSelect);
																	}
																	catch(PDOException $e) { 
																		print "<div class='error'>" . $e->getMessage() . "</div>" ; 
																	}
																	print "<optgroup label='--SCHOOL OUTCOMES--'>" ;
																	while ($rowSelect=$resultSelect->fetch()) {
																		$currentCategory=$rowSelect["category"] ;
																		if (($currentCategory!=$lastCategory) AND $currentCategory!="") {
																			print "<optgroup label='--" . $currentCategory . "--'>" ;
																			print "<option class='$currentCategory' value='0'>Choose an outcome to add it to this unit</option>" ;
																			$categories[$categoryCount]= $currentCategory ;
																			$categoryCount++ ;
																		}
																		print "<option class='all " . $rowSelect["category"] . "'   value='" . $rowSelect["gibbonOutcomeID"] . "'>" . $rowSelect["name"] . "</option>" ;
																		$switchContents.="case \"" . $rowSelect["gibbonOutcomeID"] . "\": " ;
																		$switchContents.="$(\"#outcome\").append('<div id=\'outcomeOuter' + outcomeCount + '\'><img style=\'margin: 10px 0 5px 0\' src=\'" . $_SESSION[$guid]["absoluteURL"] . "/themes/Default/img/loading.gif\' alt=\'Loading\' onclick=\'return false;\' /><br/>Loading</div>');" ;
																		$switchContents.="$(\"#outcomeOuter\" + outcomeCount).load(\"" . $_SESSION[$guid]["absoluteURL"] . "/modules/Planner/units_add_blockOutcomeAjax.php\",\"type=outcome&id=\" + outcomeCount + \"&title=" . urlencode($rowSelect["name"]) . "\&category=" . urlencode($rowSelect["category"]) . "&gibbonOutcomeID=" . $rowSelect["gibbonOutcomeID"] . "&contents=" . urlencode($rowSelect["description"]) . "&allowOutcomeEditing=" . urlencode($allowOutcomeEditing) . "\") ;" ;
																		$switchContents.="outcomeCount++ ;" ;
																		$switchContents.="$('#newOutcome').val('0');" ;
																		$switchContents.="break;" ;
																		$lastCategory=$rowSelect["category"] ;
																	}
																
																	$currentCategory="" ;
																	$lastCategory="" ;
																	$currentLA="" ;
																	$lastLA="" ;
																	try {
																		$countClause=0 ;
																		$years=explode(",", $gibbonYearGroupIDList) ;
																		$dataSelect=array("gibbonDepartmentID"=>$gibbonDepartmentID); 
																		$sqlSelect="" ;
																		foreach ($years as $year) {
																			$dataSelect["clause" . $countClause]="%" . $year . "%" ;
																			$sqlSelect.="(SELECT gibbonOutcome.*, gibbonDepartment.name AS learningArea FROM gibbonOutcome JOIN gibbonDepartment ON (gibbonOutcome.gibbonDepartmentID=gibbonDepartment.gibbonDepartmentID) WHERE active='Y' AND scope='Learning Area' AND gibbonDepartment.gibbonDepartmentID=:gibbonDepartmentID AND gibbonYearGroupIDList LIKE :clause" . $countClause . ") UNION " ;
																			$countClause++ ;
																		}
																		$resultSelect=$connection2->prepare(substr($sqlSelect,0,-6) . "ORDER BY learningArea, category, name");
																		$resultSelect->execute($dataSelect);
																	}
																	catch(PDOException $e) { 
																		print "<div class='error'>" . $e->getMessage() . "</div>" ; 
																	}
																	while ($rowSelect=$resultSelect->fetch()) {
																		$currentCategory=$rowSelect["category"] ;
																		$currentLA=$rowSelect["learningArea"] ;
																		if (($currentLA!=$lastLA) AND $currentLA!="") {
																			print "<optgroup label='--" . strToUpper($currentLA) . " OUTCOMES--'>" ;
																		}
																		if (($currentCategory!=$lastCategory) AND $currentCategory!="") {
																			print "<optgroup label='--" . $currentCategory . "--'>" ;
																			print "<option class='$currentCategory' value='0'>Choose an outcome to add it to this unit</option>" ;
																			$categories[$categoryCount]= $currentCategory ;
																			$categoryCount++ ;
																		}
																		print "<option class='all " . $rowSelect["category"] . "'   value='" . $rowSelect["gibbonOutcomeID"] . "'>" . $rowSelect["name"] . "</option>" ;
																		$switchContents.="case \"" . $rowSelect["gibbonOutcomeID"] . "\": " ;
																		$switchContents.="$(\"#outcome\").append('<div id=\'outcomeOuter' + outcomeCount + '\'><img style=\'margin: 10px 0 5px 0\' src=\'" . $_SESSION[$guid]["absoluteURL"] . "/themes/Default/img/loading.gif\' alt=\'Loading\' onclick=\'return false;\' /><br/>Loading</div>');" ;
																		$switchContents.="$(\"#outcomeOuter\" + outcomeCount).load(\"" . $_SESSION[$guid]["absoluteURL"] . "/modules/Planner/units_add_blockOutcomeAjax.php\",\"type=outcome&id=\" + outcomeCount + \"&title=" . urlencode($rowSelect["name"]) . "\&category=" . urlencode($rowSelect["category"]) . "&gibbonOutcomeID=" . $rowSelect["gibbonOutcomeID"] . "&contents=" . urlencode($rowSelect["description"]) . "&allowOutcomeEditing=" . urlencode($allowOutcomeEditing) . "\") ;" ;
																		$switchContents.="outcomeCount++ ;" ;
																		$switchContents.="$('#newOutcome').val('0');" ;
																		$switchContents.="break;" ;
																		$lastCategory=$rowSelect["category"] ;
																		$lastLA=$rowSelect["learningArea"] ;
																	}
																
																	?>
																</select><br/>
																<?
																if (count($categories)>0) {
																	?>
																	<select id='outcomeFilter' style='float: none; margin-left: 3px; margin-top: 0px; width: 350px'>
																		<option value='all'>View All</option>
																		<?
																		$categories=array_unique($categories) ;
																		$categories=msort($categories) ;
																		foreach ($categories AS $category) {
																			print "<option value='$category'>$category</option>" ;
																		}
																		?>
																	</select>
																	<script type="text/javascript">
																		$("#newOutcome").chainedTo("#outcomeFilter");
																	</script>
																	<?
																}
																?>
																<script type='text/javascript'>
																	var <? print $type ?>Used=new Array(<? print substr($usedArrayFill,0,-1) ?>);
																	var <? print $type ?>UsedCount=<? print $type ?>Used.length ;
																	
																	function outcomeDisplayElements(number) {
																		$("#<? print $type ?>Outer0").css("display", "none") ;
																		if (<? print $type ?>Used.indexOf(number)<0) {
																			<? print $type ?>Used[<? print $type ?>UsedCount]=number ;
																			<? print $type ?>UsedCount++ ;
																			switch(number) {
																				<? print $switchContents ?>
																			}
																		}
																		else {
																			alert("This element has already been selected!") ;
																			$('#newOutcome').val('0');
																		}
																	}
																</script>
															</td>
														</tr>
													</table>
												</div>
											</div>
										</td>
									</tr>
								
									<tr>
										<td>
											<span style="font-size: 90%"><i>* denotes a required field</i></span>
										</td>
										<td class="right">
											<input name="classCount" id="classCount" value="<? print $classCount ?>" type="hidden">
											<input type="reset" value="Reset"> <input id="submit" type="submit" value="Submit">
										</td>
									</tr>
								</table>
							</form>
							<?
						}
					}
				}
			}
			//IF UNIT DOES CONTAIN HYPHEN, IT IS A HOOKED UNIT
			else {
				try {
					if ($highestAction=="Manage Units_all") {
						$data=array("gibbonSchoolYearID"=>$gibbonSchoolYearID, "gibbonCourseID"=>$gibbonCourseID); 
						$sql="SELECT * FROM gibbonCourse WHERE gibbonSchoolYearID=:gibbonSchoolYearID AND gibbonCourseID=:gibbonCourseID" ;
					}
					else if ($highestAction=="Manage Units_learningAreas") {
						$data=array("gibbonSchoolYearID"=>$gibbonSchoolYearID, "gibbonCourseID"=>$gibbonCourseID, "gibbonPersonID"=>$_SESSION[$guid]["gibbonPersonID"]); 
						$sql="SELECT gibbonCourseID, gibbonCourse.name, gibbonCourse.nameShort FROM gibbonCourse JOIN gibbonDepartment ON (gibbonCourse.gibbonDepartmentID=gibbonDepartment.gibbonDepartmentID) JOIN gibbonDepartmentStaff ON (gibbonDepartmentStaff.gibbonDepartmentID=gibbonDepartment.gibbonDepartmentID) WHERE gibbonDepartmentStaff.gibbonPersonID=:gibbonPersonID AND (role='Coordinator' OR role='Assistant Coordinator' OR role='Teacher (Curriculum)') AND gibbonSchoolYearID=:gibbonSchoolYearID AND gibbonCourseID=:gibbonCourseID ORDER BY gibbonCourse.nameShort" ;
					}
					$result=$connection2->prepare($sql);
					$result->execute($data);
				}
				catch(PDOException $e) { 
					print "<div class='error'>" . $e->getMessage() . "</div>" ; 
				}

				if ($result->rowCount()!=1) {
					print "<div class='error'>" ;
						print "The specified course cannot be found or you do not have access to it." ;
					print "</div>" ;
				}
				else {
					$row=$result->fetch() ;
					$yearName=$row["name"] ;
					$gibbonYearGroupIDList=$row["gibbonYearGroupIDList"] ;
				
					//Check if unit specified
					if ($gibbonHookIDToken=="") {
						print "<div class='error'>" ;
							print "You have not specified a unit." ;
						print "</div>" ;
					}
					else {
						try {
							$dataHooks=array("gibbonHookID"=>$gibbonHookIDToken); 
							$sqlHooks="SELECT * FROM gibbonHook WHERE type='Unit' AND gibbonHookID=:gibbonHookID ORDER BY name" ;
							$resultHooks=$connection2->prepare($sqlHooks);
							$resultHooks->execute($dataHooks);
						}
						catch(PDOException $e) { }
						if ($resultHooks->rowCount()==1) {
							$rowHooks=$resultHooks->fetch() ;
							$hookOptions=unserialize($rowHooks["options"]) ;
							if ($hookOptions["unitTable"]!="" AND $hookOptions["unitIDField"]!="" AND $hookOptions["unitCourseIDField"]!="" AND $hookOptions["unitNameField"]!="" AND $hookOptions["unitDescriptionField"]!="" AND $hookOptions["classLinkTable"]!="" AND $hookOptions["classLinkJoinFieldUnit"]!="" AND $hookOptions["classLinkJoinFieldClass"]!="" AND $hookOptions["classLinkIDField"]!="") {
								try {
									$data=array("unitIDField"=>$gibbonUnitIDToken); 
									$sql="SELECT " . $hookOptions["unitTable"] . ".*, gibbonCourse.nameShort FROM " . $hookOptions["unitTable"] . " JOIN gibbonCourse ON (" . $hookOptions["unitTable"] . "." . $hookOptions["unitCourseIDField"] . "=gibbonCourse.gibbonCourseID) WHERE " . $hookOptions["unitIDField"] . "=:unitIDField" ;
									$result=$connection2->prepare($sql);
									$result->execute($data);
								}
								catch(PDOException $e) { }									
							}
						}
						if ($result->rowCount()!=1) {
							print "<div class='error'>" ;
								print "The specified unit cannot be found." ;
							print "</div>" ;
						}
						else {
							//Let's go!
							$row=$result->fetch() ;
							?>
							<table cellspacing='0' style="width: 100%">	
								<tr><td style="width: 30%"></td><td></td></tr>
								<tr>
									<td colspan=2> 
										<h3>Unit Basics</h3>
									</td>
								</tr>
								<tr>
									<td> 
										<b>School Year *</b><br/>
										<span style="font-size: 90%"><i>This value cannot be changed.</i></span>
									</td>
									<td class="right">
										<input readonly name="yearName" id="yearName" maxlength=20 value="<? print $yearName ?>" type="text" style="width: 300px">
									</td>
								</tr>
								<tr>
									<td> 
										<b>Course *</b><br/>
										<span style="font-size: 90%"><i>This value cannot be changed.</i></span>
									</td>
									<td class="right">
										<input readonly name="courseName" id="courseName" maxlength=20 value="<? print $row["nameShort"] ?>" type="text" style="width: 300px">
									</td>
								</tr>
								<tr>
									<td> 
										<b>Name *</b><br/>
										<span style="font-size: 90%"><i>This value cannot be changed.</i></span>
									</td>
									<td class="right">
										<input readonly name="name" id="name" maxlength=40 value="<? print $row["name"] ?>" type="text" style="width: 300px">
									</td>
								</tr>
							
								<tr>
									<td colspan=2> 
										<h3>Classes</h3>
										<p>Select classes which will have access to this unit.</p>
									</td>
								</tr>
								<tr>
									<td colspan=2> 
										<?
										$classCount=0 ;
										try {
											$dataClass=array("unitIDField"=>$row[$hookOptions["unitIDField"]], "gibbonCourseID"=>$row[$hookOptions["unitCourseIDField"]]); 
											$sqlClass="SELECT gibbonCourseClass.nameShort AS className, gibbonCourse.nameShort AS courseName, " . $hookOptions["classLinkTable"] . ".* FROM " . $hookOptions["classLinkTable"] . " JOIN " . $hookOptions["unitTable"] . " ON (" . $hookOptions["classLinkTable"] . "." . $hookOptions["unitIDField"] . "=" . $hookOptions["unitTable"] . "." . $hookOptions["unitIDField"] . ") JOIN gibbonCourseClass ON (" . $hookOptions["classLinkTable"] . "." . $hookOptions["classLinkJoinFieldClass"] . "=gibbonCourseClass.gibbonCourseClassID) JOIN gibbonCourse ON (gibbonCourseClass.gibbonCourseID=gibbonCourse.gibbonCourseID) WHERE " . $hookOptions["classLinkTable"] . "." . $hookOptions["unitIDField"] . "=:unitIDField AND " . $hookOptions["unitTable"] . "." . $hookOptions["unitCourseIDField"] . "=:gibbonCourseID ORDER BY courseName, className" ;
											$resultClass=$connection2->prepare($sqlClass);
											$resultClass->execute($dataClass);
										}
										catch(PDOException $e) { 
											print "<div class='error'>" . $e->getMessage() . "</div>" ; 
										}
									
										if ($resultClass->rowCount()<1) {
											print "<div class='error'>" ;
											print "There are no classes to display." ;
											print "</div>" ;
										}
										else {
											print "<table cellspacing='0' style='width: 100%'>" ;
												print "<tr class='head'>" ;
													print "<th>" ;
														print "Class" ;
													print "</th>" ;
													print "<th>" ;
														print "Running<br/><span style='font-size: 80%'>Is class doing unit?</span>" ;
													print "</th>" ;
													print "<th>" ;
														print "First Lesson<br/><span style='font-size: 80%'>dd/mm/yyy<y/span>" ;
													print "</th>" ;
													print "<th>" ;
														print "Actions" ;
													print "</th>" ;
												print "</tr>" ;
											
												$count=0;
												$rowNum="odd" ;
							
												while ($rowClass=$resultClass->fetch()) {
													if ($count%2==0) {
														$rowNum="even" ;
													}
													else {
														$rowNum="odd" ;
													}
													$count++ ;
												
													//COLOR ROW BY STATUS!
													print "<tr class=$rowNum>" ;
														print "<td>" ;
															print $rowClass["courseName"] . "." . $rowClass["className"] . "</a>" ;
														print "</td>" ;
														print "<td>" ;
															print "Y" ;
														print "</td>" ;
														print "<td>" ;
															try {
																$dataDate=array("gibbonCourseClassID"=>$rowClass["gibbonCourseClassID"], "gibbonHookID"=>$gibbonHookIDToken, "gibbonUnitID"=>$gibbonUnitIDToken); 
																$sqlDate="SELECT date FROM gibbonPlannerEntry WHERE gibbonCourseClassID=:gibbonCourseClassID AND gibbonHookID=:gibbonHookID AND gibbonUnitID=:gibbonUnitID ORDER BY date, timeStart" ;
																$resultDate=$connection2->prepare($sqlDate);
																$resultDate->execute($dataDate);
															}
															catch(PDOException $e) { }
															if ($resultDate->rowCount()<1) {
																print "<i>There are no lessons in this unit.</i>" ;
															}
															else {
																$rowDate=$resultDate->fetch() ;
																print dateConvertBack($rowDate["date"]) ;
															}
														print "</td>" ;
														print "<td>" ;
															if ($resultDate->rowCount()<1) {
																print "<a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . $_SESSION[$guid]["module"] . "/units_edit_deploy.php&gibbonCourseClassID=" . $rowClass["gibbonCourseClassID"] . "&gibbonCourseID=$gibbonCourseID&gibbonUnitID=$gibbonUnitID&gibbonSchoolYearID=$gibbonSchoolYearID&gibbonUnitClassID=" . $rowClass[$hookOptions["classLinkIDField"]] . "'><img title='Edit Unit' src='./themes/" . $_SESSION[$guid]["gibbonThemeName"] . "/img/config.png'/></a> " ;
															}
															else {
																print "<a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . $_SESSION[$guid]["module"] . "/units_edit_working.php&gibbonCourseClassID=" . $rowClass["gibbonCourseClassID"] . "&gibbonCourseID=$gibbonCourseID&gibbonUnitID=$gibbonUnitID&gibbonSchoolYearID=$gibbonSchoolYearID&gibbonUnitClassID=" . $rowClass[$hookOptions["classLinkIDField"]] . "'><img title='Edit Unit' src='./themes/" . $_SESSION[$guid]["gibbonThemeName"] . "/img/config.png'/></a> " ;
															}
															print "<a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . $_SESSION[$guid]["module"] . "/planner.php&gibbonCourseClassID=" . $rowClass["gibbonCourseClassID"] . "&viewBy=class'><img style='margin-top: 3px' title='View Planner' src='./themes/" . $_SESSION[$guid]["gibbonThemeName"] . "/img/planner.gif'/></a> " ;
														print "</td>" ;
													print "</tr>" ;
													$classCount++ ;
												}
											print "</table>" ;
										}
										?>
									</td>
								</tr>
							</table>
							<?
						}
					}
				}
			}
		}
	}
	//Print sidebar
	$_SESSION[$guid]["sidebarExtra"]=sidebarExtraUnits($guid, $connection2, $gibbonCourseID, $gibbonSchoolYearID) ;
}
?>