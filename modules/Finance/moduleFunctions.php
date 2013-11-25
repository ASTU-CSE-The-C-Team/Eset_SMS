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

//Make the display for a block, according to the input provided, where $i is a unique number appended to the block's field ids.
//Mode can be add, edit
function makeFeeBlock($guid, $connection2, $i, $mode="add", $feeType, $gibbonFinanceFeeID, $name="", $description="", $gibbonFinanceFeeCategoryID="", $fee="", $category="", $outerBlock=TRUE) {	
	if ($outerBlock) {
		print "<div id='blockOuter$i' class='blockOuter'>" ;
	}
	?>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#blockInner<? print $i ?>").css("display","none");
				$("#block<? print $i ?>").css("height","72px")
				
				//Block contents control
				$('#show<? print $i ?>').unbind('click').click(function() {
					if ($("#blockInner<? print $i ?>").is(":visible")) {
						$("#blockInner<? print $i ?>").css("display","none");
						$("#block<? print $i ?>").css("height","72px")
						$('#show<? print $i ?>').css("background-image", "<? print "url(\'" . $_SESSION[$guid]["absoluteURL"] . "/themes/" . $_SESSION[$guid]["gibbonThemeName"] . "/img/plus.png\'"?>)"); 
					} else {
						$("#blockInner<? print $i ?>").slideDown("fast", $("#blockInner<? print $i ?>").css("display","table-row")); 
						$("#block<? print $i ?>").css("height","auto")
						$('#show<? print $i ?>').css("background-image", "<? print "url(\'" . $_SESSION[$guid]["absoluteURL"] . "/themes/" . $_SESSION[$guid]["gibbonThemeName"] . "/img/minus.png\'"?>)"); 
					}
				});
				
				<? if ($mode=="add" AND $feeType=="Ad Hoc") { ?>
					var nameClick<? print $i ?>=false ;
					$('#name<? print $i ?>').focus(function() {
						if (nameClick<? print $i ?>==false) {
							$('#name<? print $i ?>').css("color", "#000") ;
							$('#name<? print $i ?>').val("") ;
							nameClick<? print $i ?>=true ;
						}
					});
					
					var feeClick<? print $i ?>=false ;
					$('#fee<? print $i ?>').focus(function() {
						if (feeClick<? print $i ?>==false) {
							$('#fee<? print $i ?>').css("color", "#000") ;
							$('#fee<? print $i ?>').val("") ;
							feeClick<? print $i ?>=true ;
						}
					});
				<? } ?>
				
				$('#delete<? print $i ?>').unbind('click').click(function() {
					if (confirm("Are you sure you want to delete this block?")) {
						$('#blockOuter<? print $i ?>').fadeOut(600, function(){ $('#block<? print $i ?>').remove(); });
						fee<? print $i ?>.destroy() ;
					}
				});
			});
		</script>
		<div style='background-color: #EDF7FF; border: 1px solid #d8dcdf; margin: 0 0 5px' id="block<? print $i ?>" style='padding: 0px'>
			<table class='blank' cellspacing='0' style='width: 100%'>
				<tr>
					<td style='width: 70%'>
						<input name='order[]' type='hidden' value='<? print $i ?>'>
						<input <? if ($feeType=="Standard") { print "readonly" ; }?> maxlength=100 id='name<? print $i ?>' name='name<? print $i ?>' type='text' style='float: none; border: 1px dotted #aaa; background: none; margin-left: 3px; <? if ($mode=="add" AND $feeType=="Ad Hoc") { print "color: #999;" ;} ?> margin-top: 0px; font-size: 140%; font-weight: bold; width: 350px' value='<? if ($mode=="add" AND $feeType=="Ad Hoc") { print "Fee Name $i" ;} else { print htmlPrep($name) ;} ?>'><br/>
						<?
						if ($mode=="add" AND $feeType=="Ad Hoc") {
							?>
							<select name="gibbonFinanceFeeCategoryID<? print $i ?>" id="gibbonFinanceFeeCategoryID<? print $i ?>" style='float: none; border: 1px dotted #aaa; background: none; margin-left: 3px; margin-top: 2px; font-size: 110%; font-style: italic; width: 250px'>
								<?
								try {
									$dataSelect=array(); 
									$sqlSelect="SELECT * FROM gibbonFinanceFeeCategory WHERE active='Y' AND NOT gibbonFinanceFeeCategoryID=1 ORDER BY name" ;
									$resultSelect=$connection2->prepare($sqlSelect);
									$resultSelect->execute($dataSelect);
								}
								catch(PDOException $e) { }
								while ($rowSelect=$resultSelect->fetch()) {
									print "<option value='" . $rowSelect["gibbonFinanceFeeCategoryID"] . "'>" . $rowSelect["name"] . "</option>" ;
								}
								print "<option selected value='1'>Other</option>" ;
								?>				
							</select>
							<? 
						}
						else {
							?>
							<input <? if ($feeType=="Standard") { print "readonly" ; }?> maxlength=100 id='category<? print $i ?>' name='category<? print $i ?>' type='text' style='float: none; border: 1px dotted #aaa; background: none; margin-left: 3px; margin-top: 2px; font-size: 110%; font-style: italic; width: 250px' value='<? print htmlPrep($category) ?>'>
							<input type='hidden' id='gibbonFinanceFeeCategoryID<? print $i ?>' name='gibbonFinanceFeeCategoryID<? print $i ?>' value='<? print htmlPrep($gibbonFinanceFeeCategoryID) ?>'>
							<?
						}
						?>
						<input <? if ($feeType=="Standard") { print "readonly" ; }?> maxlength=13 id='fee<? print $i ?>' name='fee<? print $i ?>' type='text' style='float: none; border: 1px dotted #aaa; background: none; margin-left: 3px; <? if ($mode=="add" AND $feeType=="Ad Hoc") { print "color: #999;" ;} ?> margin-top: 2px; font-size: 110%; font-style: italic; width: 95px' value='<? if ($mode=="add" AND $feeType=="Ad Hoc") { print "value" ; if ($_SESSION[$guid]["currency"]!="") { print " (" . $_SESSION[$guid]["currency"] . ")" ;}} else { print htmlPrep($fee) ;} ?>'>
						<script type="text/javascript">
							var fee<? print $i ?>=new LiveValidation('fee<? print $i ?>');
							fee<? print $i ?>.add(Validate.Presence);
							fee<? print $i ?>.add( Validate.Format, { pattern: /^(?:\d*\.\d{1,2}|\d+)$/, failureMessage: "Invalid number format!" } );
						</script>
					</td>
					<td style='text-align: right; width: 30%'>
						<div style='margin-bottom: 5px'>
							<?
							print "<img id='delete$i' title='Delete' src='./themes/" . $_SESSION[$guid]["gibbonThemeName"] . "/img/garbage.png'/> " ;
							print "<div id='show$i' style='margin-top: -1px; margin-left: 3px; padding-right: 1px; float: right; width: 25px; height: 25px; background-image: url(\"" . $_SESSION[$guid]["absoluteURL"] . "/themes/" . $_SESSION[$guid]["gibbonThemeName"] . "/img/plus.png\")'></div></br>" ;
							?>
						</div>
						<?
						if ($mode=="plannerEdit") {
							print "</br>" ;
						}
						?>
						<input type='hidden' name='feeType<? print $i ?>' value='<? print $feeType ?>'>
						<input type='hidden' name='gibbonFinanceFeeID<? print $i ?>' value='<? print $gibbonFinanceFeeID ?>'>
					</td>
				</tr>
				<tr id="blockInner<? print $i ?>">
					<td colspan=2 style='vertical-align: top'>
						<? 
						print "<div style='text-align: left; font-weight: bold; margin-top: 15px'>Description</div>" ;
						if ($gibbonFinanceFeeID==NULL) {
							print "<textarea style='width: 100%;' name='" . $type . "description" . $i . "'>" . htmlPrep($description) . "</textarea>" ;
						}
						else {
							print "<div style='width: 100%;'>" . htmlPrep($description) . "</div>" ;
							print "<input type='hidden' name='" . $type . "description" . $i . "' value='" . htmlPrep($description) . "'>" ;
						}
						?>
					</td>
				</tr>
			</table>
		</div>
	<?
	if ($outerBlock) {
		print "</div>" ;
	}
}

function invoiceContents($connection2, $gibbonFinanceInvoiceID, $gibbonSchoolYearID, $currency="") {
	$return="" ;
	
	try {
		$data=array("gibbonSchoolYearID"=>$gibbonSchoolYearID, "gibbonFinanceInvoiceID"=>$gibbonFinanceInvoiceID); 
		$sql="SELECT gibbonPerson.gibbonPersonID, studentID, surname, preferredName, gibbonFinanceInvoice.*, companyContact, companyName, companyAddress FROM gibbonFinanceInvoice JOIN gibbonFinanceInvoicee ON (gibbonFinanceInvoice.gibbonFinanceInvoiceeID=gibbonFinanceInvoicee.gibbonFinanceInvoiceeID) JOIN gibbonPerson ON (gibbonFinanceInvoicee.gibbonPersonID=gibbonPerson.gibbonPersonID) WHERE gibbonSchoolYearID=:gibbonSchoolYearID AND gibbonFinanceInvoiceID=:gibbonFinanceInvoiceID" ; 
		$result=$connection2->prepare($sql);
		$result->execute($data);
	}
	catch(PDOException $e) { 
		$return=FALSE ;
	}
	
	if ($result->rowCount()==1) {
		//Let's go!
		$row=$result->fetch() ;
		
		//Invoice Text
		$invoiceText=getSettingByScope( $connection2, "Finance", "invoiceText" ) ;
		if ($invoiceText!="") {
			$return.="<p>" ;
				$return.=$invoiceText ;
			$return.="</p>" ;
		}

		//Invoice Details
		$return.="<table cellspacing='0' style='width: 100%'>" ;
			$return.="<tr>" ;
				$return.="<td style='width: 33%; padding-top: 15px; vertical-align: top;' colspan=3>" ;
					$return.="<span style='font-size: 115%; font-weight: bold'>Invoice To (" .$row["invoiceTo"] . ")</span><br/>" ;
					if ($row["invoiceTo"]=="Company") {
						$invoiceTo="" ;
						if ($row["companyContact"]!="") {
							$invoiceTo.=$row["companyContact"] . ", " ;
						}
						if ($row["companyName"]!="") {
							$invoiceTo.=$row["companyName"] . ", " ;
						}
						if ($row["companyAddress"]!="") {
							$invoiceTo.=$row["companyAddress"] . ", " ;
						}
						$return.=substr($invoiceTo,0,-2) ;
					}
					else {
						try {
							$dataParents=array("gibbonFinanceInvoiceeID"=>$row["gibbonFinanceInvoiceeID"]); 
							$sqlParents="SELECT parent.title, parent.surname, parent.preferredName, parent.email, parent.address1, parent.address1District, parent.address1Country, homeAddress, homeAddressDistrict, homeAddressCountry FROM gibbonFinanceInvoicee JOIN gibbonPerson AS student ON (gibbonFinanceInvoicee.gibbonPersonID=student.gibbonPersonID) JOIN gibbonFamilyChild ON (gibbonFamilyChild.gibbonPersonID=student.gibbonPersonID) JOIN gibbonFamily ON (gibbonFamilyChild.gibbonFamilyID=gibbonFamily.gibbonFamilyID) JOIN gibbonFamilyAdult ON (gibbonFamily.gibbonFamilyID=gibbonFamilyAdult.gibbonFamilyID) JOIN gibbonPerson AS parent ON (gibbonFamilyAdult.gibbonPersonID=parent.gibbonPersonID) WHERE gibbonFinanceInvoiceeID=:gibbonFinanceInvoiceeID AND (contactPriority=1 OR (contactPriority=2 AND contactEmail='Y')) ORDER BY contactPriority, surname, preferredName" ; 
							$resultParents=$connection2->prepare($sqlParents);
							$resultParents->execute($dataParents);
						}
						catch(PDOException $e) { 
							$return.="<div class='error'>" . $e->getMessage() . "</div>" ; 
						}
						if ($resultParents->rowCount()<1) {
							$return.="<div class='warning'>There are no family members available to send this receipt to.</div>" ; 
						}
						else {
							$return.="<ul>" ;
							while ($rowParents=$resultParents->fetch()) {
								$return.="<li>" ;
								$invoiceTo="" ;
								$invoiceTo.="<b>" . formatName(htmlPrep($rowParents["title"]), htmlPrep($rowParents["preferredName"]), htmlPrep($rowParents["surname"]), "Parent", false) . "</b>, " ;
								if ($rowParents["address1"]!="") {
									$invoiceTo.=$rowParents["address1"] . ", " ;
									if ($rowParents["address1District"]!="") {
										$invoiceTo.=$rowParents["address1District"] . ", " ;
									}
									if ($rowParents["address1Country"]!="") {
										$invoiceTo.=$rowParents["address1Country"] . ", " ;
									}
								}
								else {
									$invoiceTo.=$rowParents["homeAddress"] . ", " ;
									if ($rowParents["homeAddressDistrict"]!="") {
										$invoiceTo.=$rowParents["homeAddressDistrict"] . ", " ;
									}
									if ($rowParents["homeAddressCountry"]!="") {
										$invoiceTo.=$rowParents["homeAddressCountry"] . ", " ;
									}
								}
								$return.=substr($invoiceTo,0,-2) ;
								$return.="</li>" ;
							}
							$return.="</ul>" ;
						}
					}
				$return.="</td>" ;
			$return.="</tr>" ;
			$return.="<tr>" ;
				$return.="<td style='width: 33%; padding-top: 15px; vertical-align: top'>" ;
					$return.="<span style='font-size: 115%; font-weight: bold'>Fees For</span><br/>" ;
					$return.=formatName("", htmlPrep($row["preferredName"]), htmlPrep($row["surname"]), "Student", true) . "<br/>" ;
				$return.="</td>" ;
				$return.="<td style='width: 33%; padding-top: 15px; vertical-align: top'>" ;
					$return.="<span style='font-size: 115%; font-weight: bold'>Status</span><br/>" ;
					$return.=$row["status"] ;
				$return.="</td>" ;
				$return.="<td style='width: 33%; padding-top: 15px; vertical-align: top'>" ;
					$return.="<span style='font-size: 115%; font-weight: bold'>Schedule</span><br/>" ;
					if ($row["billingScheduleType"]=="Ad Hoc") {
						$return.="Ad Hoc" ;
					}
					else {
						try {
							$dataSched=array("gibbonFinanceBillingScheduleID"=>$row["gibbonFinanceBillingScheduleID"]); 
							$sqlSched="SELECT * FROM gibbonFinanceBillingSchedule WHERE gibbonFinanceBillingScheduleID=:gibbonFinanceBillingScheduleID" ; 
							$resultSched=$connection2->prepare($sqlSched);
							$resultSched->execute($dataSched);
						}
						catch(PDOException $e) { 
							$return.="<div class='error'>" . $e->getMessage() . "</div>" ; 
						}
						if ($resultSched->rowCount()==1) {
							$rowSched=$resultSched->fetch() ;
							$return.=$rowSched["name"] ;
						}
					}
				$return.="</td>" ;
			$return.="</tr>" ;
			$return.="<tr>" ;
				$return.="<td style='width: 33%; padding-top: 15px; vertical-align: top'>" ;
					$return.="<span style='font-size: 115%; font-weight: bold'>Invoice Issue Date</span><br/>" ;
					$return.=dateConvertBack($row["invoiceIssueDate"]) ;
				$return.="</td>" ;
				$return.="<td style='width: 33%; padding-top: 15px; vertical-align: top'>" ;
					$return.="<span style='font-size: 115%; font-weight: bold'>Due Date</span><br/>" ;
					$return.=dateConvertBack($row["invoiceDueDate"]) ;
				$return.="</td>" ;
				$return.="<td style='width: 33%; padding-top: 15px; vertical-align: top'>" ;
					$return.="<span style='font-size: 115%; font-weight: bold'>Invoice Number</span><br/>" ;
					$invoiceNumber=getSettingByScope( $connection2, "Finance", "invoiceNumber" ) ;
					if ($invoiceNumber=="Person ID + Invoice ID") {
						$return.=ltrim($row["gibbonPersonID"],"0") . "-" . ltrim($gibbonFinanceInvoiceID, "0") ;
					}
					else if ($invoiceNumber=="Student ID + Invoice ID") {
						$return.=ltrim($row["studentID"],"0") . "-" . ltrim($gibbonFinanceInvoiceID, "0") ;
					}
					else {
						$return.=ltrim($gibbonFinanceInvoiceID, "0") ;
					}
				$return.="</td>" ;
			$return.="</tr>" ;
		$return.="</table>" ;

		//Fee table
		$return.="<h3 style='margin-top: 40px'>" ;
			$return.="Fee Table" ;
		$return.="</h3>" ;
		$feeTotal=0 ;
		try {
			$dataFees["gibbonFinanceInvoiceID"]=$row["gibbonFinanceInvoiceID"]; 
			$sqlFees="SELECT gibbonFinanceInvoiceFee.gibbonFinanceInvoiceFeeID, gibbonFinanceInvoiceFee.feeType, gibbonFinanceFeeCategory.name AS category, gibbonFinanceInvoiceFee.name AS name, gibbonFinanceInvoiceFee.fee, gibbonFinanceInvoiceFee.description AS description, NULL AS gibbonFinanceFeeID, gibbonFinanceInvoiceFee.gibbonFinanceFeeCategoryID AS gibbonFinanceFeeCategoryID, sequenceNumber FROM gibbonFinanceInvoiceFee JOIN gibbonFinanceFeeCategory ON (gibbonFinanceInvoiceFee.gibbonFinanceFeeCategoryID=gibbonFinanceFeeCategory.gibbonFinanceFeeCategoryID) WHERE gibbonFinanceInvoiceID=:gibbonFinanceInvoiceID ORDER BY sequenceNumber" ;
			$resultFees=$connection2->prepare($sqlFees);
			$resultFees->execute($dataFees);
		}
		catch(PDOException $e) { 
			$return.="<div class='error'>" . $e->getMessage() . "</div>" ; 
		}
		if ($resultFees->rowCount()<1) {
			$return.="<div class='error'>" ;
				$return.="There are no fees to display" ;
			$return.="</div>" ;
		}
		else {
			$return.="<table cellspacing='0' style='width: 100%'>" ;
				$return.="<tr class='head'>" ;
					$return.="<th style='text-align: left'>" ;
						$return.="Name" ;
					$return.="</th>" ;
					$return.="<th style='text-align: left'>" ;
						$return.="Category" ;
					$return.="</th>" ;
					$return.="<th style='text-align: left'>" ;
						$return.="Description" ;
					$return.="</th>" ;
					$return.="<th style='text-align: left'>" ;
						$return.="Fee<br/>" ;
						if ($currency!="") {
							$return.="<span style='font-style: italic; font-size: 85%'>" . $currency . "</span>" ;
						}
					$return.="</th>" ;
				$return.="</tr>" ;

				$count=0;
				$rowNum="odd" ;
				while ($rowFees=$resultFees->fetch()) {
					if ($count%2==0) {
						$rowNum="even" ;
					}
					else {
						$rowNum="odd" ;
					}
					$count++ ;

					$return.="<tr style='height: 25px' class=$rowNum>" ;
						$return.="<td>" ;
							$return.=$rowFees["name"] ;
						$return.="</td>" ;
						$return.="<td>" ;
							$return.=$rowFees["category"] ;
						$return.="</td>" ;
						$return.="<td>" ;
							$return.=$rowFees["description"] ;
						$return.="</td>" ;
						$return.="<td>" ;
							if (substr($currency,4)!="") {
								$return.=substr($currency,4) . " " ;
							}
							$return.=number_format($rowFees["fee"], 2, ".", ",") ;
							$feeTotal+=$rowFees["fee"] ;
						$return.="</td>" ;
					$return.="</tr>" ;
				}
				$return.="<tr style='height: 35px' class='current'>" ;
					$return.="<td colspan=3 style='text-align: right'>" ;
						$return.="<b>Invoice Total  : </b>";
					$return.="</td>" ;
					$return.="<td>" ;
						if (substr($currency,4)!="") {
							$return.=substr($currency,4) . " " ;
						}
						$return.="<b>" . number_format($feeTotal, 2, ".", ",") . "</b>" ;
					$return.="</td>" ;
				$return.="</tr>" ;
			}
		$return.="</table>" ;

		//Invoice Notes
		$invoiceNotes=getSettingByScope( $connection2, "Finance", "invoiceNotes" ) ;
		if ($invoiceNotes!="") {
			$return.="<h3 style='margin-top: 40px'>" ;
				$return.="Notes" ;
			$return.="</h3>" ;
			$return.="<p>" ;
				$return.=$invoiceNotes ;
			$return.="</p>" ;
		}
		
		return $return ;	
	}
}

function receiptContents($connection2, $gibbonFinanceInvoiceID, $gibbonSchoolYearID, $currency="") {
	$return="" ;
	
	try {
		$data=array("gibbonSchoolYearID"=>$gibbonSchoolYearID, "gibbonFinanceInvoiceID"=>$gibbonFinanceInvoiceID); 
		$sql="SELECT gibbonPerson.gibbonPersonID, studentID, surname, preferredName, gibbonFinanceInvoice.*, companyContact, companyName, companyAddress FROM gibbonFinanceInvoice JOIN gibbonFinanceInvoicee ON (gibbonFinanceInvoice.gibbonFinanceInvoiceeID=gibbonFinanceInvoicee.gibbonFinanceInvoiceeID) JOIN gibbonPerson ON (gibbonFinanceInvoicee.gibbonPersonID=gibbonPerson.gibbonPersonID) WHERE gibbonSchoolYearID=:gibbonSchoolYearID AND gibbonFinanceInvoiceID=:gibbonFinanceInvoiceID" ; 
		$result=$connection2->prepare($sql);
		$result->execute($data);
	}
	catch(PDOException $e) { 
		$return=FALSE ;
	}
	
	if ($result->rowCount()==1) {
		//Let's go!
		$row=$result->fetch() ;
		
		//Invoice Text
		$receiptText=getSettingByScope( $connection2, "Finance", "receiptText" ) ;
		if ($receiptText!="") {
			$return.="<p>" ;
				$return.=$receiptText ;
			$return.="</p>" ;
		}

		//Invoice Details
		$return.="<table cellspacing='0' style='width: 100%'>" ;
			$return.="<tr>" ;
				$return.="<td style='width: 33%; padding-top: 15px; vertical-align: top;' colspan=3>" ;
					$return.="<span style='font-size: 115%; font-weight: bold'>Receipt To (" .$row["invoiceTo"] . ")</span><br/>" ;
					if ($row["invoiceTo"]=="Company") {
						$invoiceTo="" ;
						if ($row["companyContact"]!="") {
							$invoiceTo.=$row["companyContact"] . ", " ;
						}
						if ($row["companyName"]!="") {
							$invoiceTo.=$row["companyName"] . ", " ;
						}
						if ($row["companyAddress"]!="") {
							$invoiceTo.=$row["companyAddress"] . ", " ;
						}
						$return.=substr($invoiceTo,0,-2) ;
					}
					else {
						try {
							$dataParents=array("gibbonFinanceInvoiceeID"=>$row["gibbonFinanceInvoiceeID"]); 
							$sqlParents="SELECT parent.title, parent.surname, parent.preferredName, parent.email, parent.address1, parent.address1District, parent.address1Country, homeAddress, homeAddressDistrict, homeAddressCountry FROM gibbonFinanceInvoicee JOIN gibbonPerson AS student ON (gibbonFinanceInvoicee.gibbonPersonID=student.gibbonPersonID) JOIN gibbonFamilyChild ON (gibbonFamilyChild.gibbonPersonID=student.gibbonPersonID) JOIN gibbonFamily ON (gibbonFamilyChild.gibbonFamilyID=gibbonFamily.gibbonFamilyID) JOIN gibbonFamilyAdult ON (gibbonFamily.gibbonFamilyID=gibbonFamilyAdult.gibbonFamilyID) JOIN gibbonPerson AS parent ON (gibbonFamilyAdult.gibbonPersonID=parent.gibbonPersonID) WHERE gibbonFinanceInvoiceeID=:gibbonFinanceInvoiceeID AND (contactPriority=1 OR (contactPriority=2 AND contactEmail='Y')) ORDER BY contactPriority, surname, preferredName" ; 
							$resultParents=$connection2->prepare($sqlParents);
							$resultParents->execute($dataParents);
						}
						catch(PDOException $e) { 
							$return.="<div class='error'>" . $e->getMessage() . "</div>" ; 
						}
						if ($resultParents->rowCount()<1) {
							$return.="<div class='warning'>There are no family members available to send this receipt to.</div>" ; 
						}
						else {
							$return.="<ul>" ;
							while ($rowParents=$resultParents->fetch()) {
								$return.="<li>" ;
								$invoiceTo="" ;
								$invoiceTo.="<b>" . formatName(htmlPrep($rowParents["title"]), htmlPrep($rowParents["preferredName"]), htmlPrep($rowParents["surname"]), "Parent", false) . "</b>, " ;
								if ($rowParents["address1"]!="") {
									$invoiceTo.=$rowParents["address1"] . ", " ;
									if ($rowParents["address1District"]!="") {
										$invoiceTo.=$rowParents["address1District"] . ", " ;
									}
									if ($rowParents["address1Country"]!="") {
										$invoiceTo.=$rowParents["address1Country"] . ", " ;
									}
								}
								else {
									$invoiceTo.=$rowParents["homeAddress"] . ", " ;
									if ($rowParents["homeAddressDistrict"]!="") {
										$invoiceTo.=$rowParents["homeAddressDistrict"] . ", " ;
									}
									if ($rowParents["homeAddressCountry"]!="") {
										$invoiceTo.=$rowParents["homeAddressCountry"] . ", " ;
									}
								}
								$return.=substr($invoiceTo,0,-2) ;
								$return.="</li>" ;
							}
							$return.="</ul>" ;
						}
					}
				$return.="</td>" ;
			$return.="</tr>" ;
			$return.="<tr>" ;
				$return.="<td style='width: 33%; padding-top: 15px; vertical-align: top'>" ;
					$return.="<span style='font-size: 115%; font-weight: bold'>Fees For</span><br/>" ;
					$return.=formatName("", htmlPrep($row["preferredName"]), htmlPrep($row["surname"]), "Student", true) . "<br/>" ;
				$return.="</td>" ;
				$return.="<td style='width: 33%; padding-top: 15px; vertical-align: top'>" ;
					$return.="<span style='font-size: 115%; font-weight: bold'>Status</span><br/>" ;
					$return.=$row["status"] ;
				$return.="</td>" ;
				$return.="<td style='width: 33%; padding-top: 15px; vertical-align: top'>" ;
					$return.="<span style='font-size: 115%; font-weight: bold'>Schedule</span><br/>" ;
					if ($row["billingScheduleType"]=="Ad Hoc") {
						$return.="Ad Hoc" ;
					}
					else {
						try {
							$dataSched=array("gibbonFinanceBillingScheduleID"=>$row["gibbonFinanceBillingScheduleID"]); 
							$sqlSched="SELECT * FROM gibbonFinanceBillingSchedule WHERE gibbonFinanceBillingScheduleID=:gibbonFinanceBillingScheduleID" ; 
							$resultSched=$connection2->prepare($sqlSched);
							$resultSched->execute($dataSched);
						}
						catch(PDOException $e) { 
							$return.="<div class='error'>" . $e->getMessage() . "</div>" ; 
						}
						if ($resultSched->rowCount()==1) {
							$rowSched=$resultSched->fetch() ;
							$return.=$rowSched["name"] ;
						}
					}
				$return.="</td>" ;
			$return.="</tr>" ;
			$return.="<tr>" ;
				$return.="<td style='width: 33%; padding-top: 15px; vertical-align: top'>" ;
					$return.="<span style='font-size: 115%; font-weight: bold'>Invoice Issue Date</span><br/>" ;
					$return.=dateConvertBack($row["invoiceIssueDate"]) ;
				$return.="</td>" ;
				$return.="<td style='width: 33%; padding-top: 15px; vertical-align: top'>" ;
					$return.="<span style='font-size: 115%; font-weight: bold'>Due Date</span><br/>" ;
					$return.=dateConvertBack($row["invoiceDueDate"]) ;
				$return.="</td>" ;
				$return.="<td style='width: 33%; padding-top: 15px; vertical-align: top'>" ;
					$return.="<span style='font-size: 115%; font-weight: bold'>Invoice Number</span><br/>" ;
					$invoiceNumber=getSettingByScope( $connection2, "Finance", "invoiceNumber" ) ;
					if ($invoiceNumber=="Person ID + Invoice ID") {
						$return.=ltrim($row["gibbonPersonID"],"0") . "-" . ltrim($gibbonFinanceInvoiceID, "0") ;
					}
					else if ($invoiceNumber=="Student ID + Invoice ID") {
						$return.=ltrim($row["studentID"],"0") . "-" . ltrim($gibbonFinanceInvoiceID, "0") ;
					}
					else {
						$return.=ltrim($gibbonFinanceInvoiceID, "0") ;
					}
				$return.="</td>" ;
			$return.="</tr>" ;
			$return.="<tr>" ;
				$return.="<td style='width: 33%; padding-top: 15px; vertical-align: top'>" ;
					$return.="<span style='font-size: 115%; font-weight: bold'>Date Paid</span><br/>" ;
					$return.=dateConvertBack($row["paidDate"]) ;
				$return.="</td>" ;
				$return.="<td style='width: 33%; padding-top: 15px; vertical-align: top'>" ;
					
				$return.="</td>" ;
				$return.="<td style='width: 33%; padding-top: 15px; vertical-align: top'>" ;
					
				$return.="</td>" ;
			$return.="</tr>" ;
		$return.="</table>" ;

		//Fee table
		$return.="<h3 style='margin-top: 40px'>" ;
			$return.="Fee Table" ;
		$return.="</h3>" ;
		$feeTotal=0 ;
		try {
			$dataFees["gibbonFinanceInvoiceID"]=$row["gibbonFinanceInvoiceID"]; 
			$sqlFees="SELECT gibbonFinanceInvoiceFee.gibbonFinanceInvoiceFeeID, gibbonFinanceInvoiceFee.feeType, gibbonFinanceFeeCategory.name AS category, gibbonFinanceInvoiceFee.name AS name, gibbonFinanceInvoiceFee.fee, gibbonFinanceInvoiceFee.description AS description, NULL AS gibbonFinanceFeeID, gibbonFinanceInvoiceFee.gibbonFinanceFeeCategoryID AS gibbonFinanceFeeCategoryID, sequenceNumber FROM gibbonFinanceInvoiceFee JOIN gibbonFinanceFeeCategory ON (gibbonFinanceInvoiceFee.gibbonFinanceFeeCategoryID=gibbonFinanceFeeCategory.gibbonFinanceFeeCategoryID) WHERE gibbonFinanceInvoiceID=:gibbonFinanceInvoiceID ORDER BY sequenceNumber" ;
			$resultFees=$connection2->prepare($sqlFees);
			$resultFees->execute($dataFees);
		}
		catch(PDOException $e) { 
			$return.="<div class='error'>" . $e->getMessage() . "</div>" ; 
		}
		if ($resultFees->rowCount()<1) {
			$return.="<div class='error'>" ;
				$return.="There are no fees to display" ;
			$return.="</div>" ;
		}
		else {
			$return.="<table cellspacing='0' style='width: 100%'>" ;
				$return.="<tr class='head'>" ;
					$return.="<th style='text-align: left'>" ;
						$return.="Name" ;
					$return.="</th>" ;
					$return.="<th style='text-align: left'>" ;
						$return.="Category" ;
					$return.="</th>" ;
					$return.="<th style='text-align: left'>" ;
						$return.="Description" ;
					$return.="</th>" ;
					$return.="<th style='text-align: left'>" ;
						$return.="Fee<br/>" ;
						if ($currency!="") {
							$return.="<span style='font-style: italic; font-size: 85%'>" . $currency . "</span>" ;
						}
					$return.="</th>" ;
				$return.="</tr>" ;

				$count=0;
				$rowNum="odd" ;
				while ($rowFees=$resultFees->fetch()) {
					if ($count%2==0) {
						$rowNum="even" ;
					}
					else {
						$rowNum="odd" ;
					}
					$count++ ;

					$return.="<tr style='height: 25px' class=$rowNum>" ;
						$return.="<td>" ;
							$return.=$rowFees["name"] ;
						$return.="</td>" ;
						$return.="<td>" ;
							$return.=$rowFees["category"] ;
						$return.="</td>" ;
						$return.="<td>" ;
							$return.=$rowFees["description"] ;
						$return.="</td>" ;
						$return.="<td>" ;
							if (substr($currency,4)!="") {
								$return.=substr($currency,4) . " " ;
							}
							$return.=number_format($rowFees["fee"], 2, ".", ",") ;
							$feeTotal+=$rowFees["fee"] ;
						$return.="</td>" ;
					$return.="</tr>" ;
				}
				$return.="<tr style='height: 35px' class='current'>" ;
					$return.="<td colspan=3 style='text-align: right'>" ;
						$return.="<b>Invoice Total  : </b>";
					$return.="</td>" ;
					$return.="<td>" ;
						if (substr($currency,4)!="") {
							$return.=substr($currency,4) . " " ;
						}
						$return.="<b>" . number_format($feeTotal, 2, ".", ",") . "</b>" ;
					$return.="</td>" ;
				$return.="</tr>" ;
			}
		$return.="</table>" ;

		//Invoice Notes
		$receiptNotes=getSettingByScope( $connection2, "Finance", "receiptNotes" ) ;
		if ($receiptNotes!="") {
			$return.="<h3 style='margin-top: 40px'>" ;
				$return.="Notes" ;
			$return.="</h3>" ;
			$return.="<p>" ;
				$return.=$receiptNotes ;
			$return.="</p>" ;
		}
		
		return $return ;	
	}
}

?>
