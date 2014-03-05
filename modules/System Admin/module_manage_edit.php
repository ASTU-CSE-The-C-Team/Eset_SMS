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

if (isActionAccessible($guid, $connection2, "/modules/System Admin/module_manage_edit.php")==FALSE) {
	//Acess denied
	print "<div class='error'>" ;
		print "You do not have access to this action." ;
	print "</div>" ;
}
else {
	//Proceed!
	print "<div class='trail'>" ;
	print "<div class='trailHead'><a href='" . $_SESSION[$guid]["absoluteURL"] . "'>" . _("Home") . "</a> > <a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . getModuleName($_GET["q"]) . "/" . getModuleEntry($_GET["q"], $connection2, $guid) . "'>" . getModuleName($_GET["q"]) . "</a> > <a href='" . $_SESSION[$guid]["absoluteURL"] . "/index.php?q=/modules/" . getModuleName($_GET["q"]) . "/module_manage.php'>Manage Modules</a> > </div><div class='trailEnd'>Edit Module</div>" ;
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
	$gibbonModuleID=$_GET["gibbonModuleID"] ;
	if ($gibbonModuleID=="") {
		print "<div class='error'>" ;
			print "You have not specified one or more required parameters." ;
		print "</div>" ;
	}
	else {
		try {
			$data=array("gibbonModuleID"=>$gibbonModuleID); 
			$sql="SELECT * FROM gibbonModule WHERE gibbonModuleID=:gibbonModuleID" ;
			$result=$connection2->prepare($sql);
			$result->execute($data);
		}
		catch(PDOException $e) { 
			print "<div class='error'>" . $e->getMessage() . "</div>" ; 
		}
		
		if ($result->rowCount()!=1) {
			print "<div class='error'>" ;
				print "The specified module cannot be found." ;
			print "</div>" ;
		}
		else {
			//Let's go!
			$row=$result->fetch() ;
			?>
			<form method="post" action="<? print $_SESSION[$guid]["absoluteURL"] . "/modules/" . $_SESSION[$guid]["module"] . "/module_manage_editProcess.php?gibbonModuleID=$gibbonModuleID" ?>">
				<table class='smallIntBorder' cellspacing='0' style="width: 100%">	
					<tr>
						<td> 
							<b>Module Name *</b><br/>
							<span style="font-size: 90%"><i>This value cannot be changed.</i></span>
						</td>
						<td class="right">
							<input readonly name="name" id="name" maxlength=20 value="<? print htmlPrep($row["name"]) ?>" type="text" style="width: 300px">
							<script type="text/javascript">
								var name=new LiveValidation('name');
								name.add(Validate.Presence);
							 </script> 
						</td>
					</tr>
					<tr>
						<td> 
							<b>Description *</b><br/>
							<span style="font-size: 90%"><i>This value cannot be changed.</i></span>
						</td>
						<td class="right">
							<input readonly name="description" id="description" maxlength=100 value="<? print htmlPrep($row["description"]) ?>" type="text" style="width: 300px">
							<script type="text/javascript">
								var description=new LiveValidation('description');
								description.add(Validate.Presence);
							 </script> 
						</td>
					</tr>
					<tr>
						<td> 
							<b>Category *</b><br/>
							<span style="font-size: 90%"><i>Determines menu structure</i></span>
						</td>
						<td class="right">
							<input name="category" id="category" maxlength=10 value="<? print htmlPrep($row["category"]) ?>" type="text" style="width: 300px">
							<script type="text/javascript">
								var category=new LiveValidation('category');
								category.add(Validate.Presence);
							 </script> 
						</td>
					</tr>
					<tr>
						<td> 
							<b>Active *</b><br/>
							<span style="font-size: 90%"><i></i></span>
						</td>
						<td class="right">
							<select name="active" id="active" style="width: 302px">
								<option <? if ($row["active"]=="Y") {print "selected ";}?>value="Y">Y</option>
								<option <? if ($row["active"]=="N") {print "selected ";}?>value="N">N</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<span style="font-size: 90%"><i>* <? print _("denotes a required field") ; ?></i></span>
						</td>
						<td class="right">
							<input type="hidden" name="address" value="<? print $_SESSION[$guid]["address"] ?>">
							<input type="submit" value="<? print _("Submit") ; ?>">
						</td>
					</tr>
				</table>
			</form>
			<?
		}
	}
}
?>