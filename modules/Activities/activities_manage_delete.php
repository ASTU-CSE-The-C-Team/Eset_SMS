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

if (isActionAccessible($guid, $connection2, "/modules/Activities/activities_manage_delete.php")==FALSE) {
	//Acess denied
	print "<div class='error'>" ;
		print "You do not have access to this action." ;
	print "</div>" ;
}
else {
	//Proceed!
	print "<div class='trail'>" ;
	print "<div class='trailHead'><a href='" . $_SESSION[$guid]["absoluteURL"] . "'>Home</a> > <a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . getModuleName($_GET["q"]) . "/" . getModuleEntry($_GET["q"], $connection2, $guid) . "'>" . getModuleName($_GET["q"]) . "</a> > <a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/Activities/activities_manage.php'>Manage Activities</a> > </div><div class='trailEnd'>Delete Activity</div>" ;
	print "</div>" ;
	
	$deleteReturn = $_GET["deleteReturn"] ;
	$deleteReturnMessage ="" ;
	$class="error" ;
	if (!($deleteReturn=="")) {
		if ($deleteReturn=="fail0") {
			$deleteReturnMessage ="Update failed because you do not have access to this action." ;	
		}
		else if ($deleteReturn=="fail1") {
			$deleteReturnMessage ="Update failed because a required parameter was not set." ;	
		}
		else if ($deleteReturn=="fail2") {
			$deleteReturnMessage ="Update failed due to a database error." ;	
		}
		else if ($deleteReturn=="fail3") {
			$deleteReturnMessage ="Update failed because your inputs were invalid." ;	
		}
		print "<div class='$class'>" ;
			print $deleteReturnMessage;
		print "</div>" ;
	} 
	
	//Check if school year specified
	$gibbonActivityID=$_GET["gibbonActivityID"];
	if ($gibbonActivityID=="") {
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
		if ($result) {
			if ($result->rowCount()!=1) {
				print "<div class='error'>" ;
					print "The selected activity does not exist, or you do not have access to it." ;
				print "</div>" ;
			}
			else {
				//Let's go!
				$row=$result->fetch() ;
				?>
				<form method="post" action="<? print $_SESSION[$guid]["absoluteURL"] . "/modules/" . $_SESSION[$guid]["module"] . "/activities_manage_deleteProcess.php?gibbonActivityID=$gibbonActivityID" ?>">
					<table style="width: 100%">	
						<tr>
							<td> 
								<b>Are you sure you want to delete activity "<? print $row["name"] ?>"?</b><br/>
								<span style="font-size: 90%; color: #cc0000"><i>This operation cannot be undone, and may lead to loss of vital data in your system.<br/>PROCEED WITH CAUTION!</i></span>
							</td>
							<td class="right">
								
							</td>
						</tr>
						<tr>
							<td> 
								<input name="viewBy" id="viewBy" value="<? print $viewBy ?>" type="hidden">
								<input name="date" id="date" value="<? print $date ?>" type="hidden">
								<input name="gibbonActivityID" id="gibbonActivityID" value="<? print $gibbonActivityID ?>" type="hidden">
								<input type="hidden" name="address" value="<? print $_SESSION[$guid]["address"] ?>">
								<input type="submit" value="Yes">
							</td>
							<td class="right">
								
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