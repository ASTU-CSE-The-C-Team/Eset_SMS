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

if (isActionAccessible($guid, $connection2, "/modules/Finance/invoices_manage.php")==FALSE) {
	//Acess denied
	print "<div class='error'>" ;
		print "You do not have access to this action." ;
	print "</div>" ;
}
else {
	//Proceed!
	$gibbonFinanceInvoiceIDs=$_SESSION[$guid]["financeInvoiceExportIDs"] ;
	$gibbonSchoolYearID=$_GET["gibbonSchoolYearID"] ;
	
	if ($gibbonFinanceInvoiceIDs=="" OR $gibbonSchoolYearID=="") {
		print "<div class='error'>" ;
		print "List of invoices or school year have not been specified, and so this export cannot be completed." ;
		print "</div>" ;
	}
	else {
		print "<h1>" ;
		print "Invoice Export" ;
		print "</h1>" ;
	
		try {
			$whereCount=0 ;
			$whereSched="(" ;
			$whereAdHoc="(" ;
			$whereNotPending="(" ;
			$data=array("gibbonSchoolYearID"=>$gibbonSchoolYearID); 
			foreach ($gibbonFinanceInvoiceIDs AS $gibbonFinanceInvoiceID) {
				$data["gibbonFinanceInvoiceID" . $whereCount]=$gibbonFinanceInvoiceID ;
				$whereSched.="gibbonFinanceInvoice.gibbonFinanceInvoiceID=:gibbonFinanceInvoiceID" . $whereCount . " OR " ;
				$whereCount++ ;
			}
			$whereSched=substr($whereSched,0,-4) . ")";
					
			//SQL for billing schedule AND pending
			$sql="(SELECT gibbonFinanceInvoice.gibbonFinanceInvoiceID, surname, preferredName, gibbonFinanceInvoice.invoiceTo, gibbonFinanceInvoice.status, gibbonFinanceInvoice.invoiceIssueDate, gibbonFinanceBillingSchedule.invoiceDueDate, paidDate, gibbonFinanceBillingSchedule.name AS billingSchedule, NULL AS billingScheduleExtra, notes FROM gibbonFinanceInvoice JOIN gibbonFinanceBillingSchedule ON (gibbonFinanceInvoice.gibbonFinanceBillingScheduleID=gibbonFinanceBillingSchedule.gibbonFinanceBillingScheduleID) JOIN gibbonFinanceInvoicee ON (gibbonFinanceInvoice.gibbonFinanceInvoiceeID=gibbonFinanceInvoicee.gibbonFinanceInvoiceeID) JOIN gibbonPerson ON (gibbonFinanceInvoicee.gibbonPersonID=gibbonPerson.gibbonPersonID) WHERE gibbonFinanceInvoice.gibbonSchoolYearID=:gibbonSchoolYearID AND billingScheduleType='Scheduled' AND gibbonFinanceInvoice.status='Pending' AND $whereSched)" ; 
			$sql.=" UNION " ; 
			//SQL for Ad Hoc AND pending
			$sql.="(SELECT gibbonFinanceInvoice.gibbonFinanceInvoiceID, surname, preferredName, gibbonFinanceInvoice.invoiceTo, gibbonFinanceInvoice.status, invoiceIssueDate, invoiceDueDate, paidDate, 'Ad Hoc' AS billingSchedule, NULL AS billingScheduleExtra, notes FROM gibbonFinanceInvoice JOIN gibbonFinanceInvoicee ON (gibbonFinanceInvoice.gibbonFinanceInvoiceeID=gibbonFinanceInvoicee.gibbonFinanceInvoiceeID) JOIN gibbonPerson ON (gibbonFinanceInvoicee.gibbonPersonID=gibbonPerson.gibbonPersonID) WHERE gibbonSchoolYearID=:gibbonSchoolYearID AND billingScheduleType='Ad Hoc' AND gibbonFinanceInvoice.status='Pending' AND $whereSched)" ; 
			$sql.=" UNION " ; 
			//SQL for NOT Pending
			$sql.="(SELECT gibbonFinanceInvoice.gibbonFinanceInvoiceID, surname, preferredName, gibbonFinanceInvoice.invoiceTo, gibbonFinanceInvoice.status, gibbonFinanceInvoice.invoiceIssueDate, gibbonFinanceInvoice.invoiceDueDate, paidDate, billingScheduleType AS billingSchedule, gibbonFinanceBillingSchedule.name AS billingScheduleExtra, notes FROM gibbonFinanceInvoice LEFT JOIN gibbonFinanceBillingSchedule ON (gibbonFinanceInvoice.gibbonFinanceBillingScheduleID=gibbonFinanceBillingSchedule.gibbonFinanceBillingScheduleID) JOIN gibbonFinanceInvoicee ON (gibbonFinanceInvoice.gibbonFinanceInvoiceeID=gibbonFinanceInvoicee.gibbonFinanceInvoiceeID) JOIN gibbonPerson ON (gibbonFinanceInvoicee.gibbonPersonID=gibbonPerson.gibbonPersonID) WHERE gibbonFinanceInvoice.gibbonSchoolYearID=:gibbonSchoolYearID AND NOT gibbonFinanceInvoice.status='Pending' AND $whereSched)" ; 
			$sql.=" ORDER BY FIND_IN_SET(status, 'Pending,Issued,Paid,Refunded,Cancelled'), invoiceIssueDate, surname, preferredName" ; 
			$result=$connection2->prepare($sql);
			$result->execute($data);
		}
		catch(PDOException $e) { 
			print "<div class='error'>" . $e->getMessage() . "</div>" ; 
		}
	
		print "<table style='width: 100%'>" ;
			print "<tr class='head'>" ;
				print "<th style='width: 120px'>" ;
					print "Student <span style='font-style: italic; font-size: 85%'>(Invoice To)</span>" ;
				print "</th>" ;
				print "<th style='width: 100px'>" ;
					print "Status" ;
				print "</th>" ;
				print "<th style='width: 90px'>" ;
					print "Schedule" ;
				print "</th>" ;
				print "<th style='width: 100px'>" ;
					print "Total Value<br/><span style='font-style: italic; font-size: 85%'>" . $_SESSION[$guid]["currency"] . "</span>" ;
				print "</th>" ;
				print "<th style='width: 80px'>" ;
					print "Issue Date" ;
				print "</th>" ;
				print "<th style='width: 80px'>" ;
					print "Due Date" ;
				print "</th>" ;
			print "</tr>" ;
		
			$count=0;
			$rowNum="odd" ;
			while ($row=$result->fetch()) {
				if (is_null($log[$row["gibbonRollGroupID"]])) {
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
							print "<b>" . formatName("", htmlPrep($row["preferredName"]), htmlPrep($row["surname"]), "Student", true) . "</b> " ;
							print "<span style='font-style: italic; font-size: 85%'>(" . $row["invoiceTo"] . ")</span>" ;
						print "</td>" ;
						print "<td>" ;
							print $row["status"] ;
							if ($statusExtra!="") {
								print " - $statusExtra" ;
							}
						print "</td>" ;
						print "<td>" ;
							if ($row["billingScheduleExtra"]!="")  {
								print $row["billingScheduleExtra"] ;
							}
							else { 
								print $row["billingSchedule"] ;
							}
						print "</td>" ;
						print "<td>" ;
							//Calculate total value
							$totalFee=0 ;
							$feeError=FALSE ;
							try {
								$dataTotal=array("gibbonFinanceInvoiceID"=>$row["gibbonFinanceInvoiceID"]); 
								if ($row["status"]=="Pending") {
									$sqlTotal="SELECT gibbonFinanceInvoiceFee.fee AS fee, gibbonFinanceFee.fee AS fee2 FROM gibbonFinanceInvoiceFee LEFT JOIN gibbonFinanceFee ON (gibbonFinanceInvoiceFee.gibbonFinanceFeeID=gibbonFinanceFee.gibbonFinanceFeeID) WHERE gibbonFinanceInvoiceID=:gibbonFinanceInvoiceID" ;
								}
								else {
									$sqlTotal="SELECT gibbonFinanceInvoiceFee.fee AS fee, NULL AS fee2 FROM gibbonFinanceInvoiceFee WHERE gibbonFinanceInvoiceID=:gibbonFinanceInvoiceID" ;
								}
								$resultTotal=$connection2->prepare($sqlTotal);
								$resultTotal->execute($dataTotal);
							}
							catch(PDOException $e) { print $e->getMessage() ; print "<i>Error calculating total</i>" ; $feeError=TRUE ;}
							while ($rowTotal=$resultTotal->fetch()) {
								if (is_numeric($rowTotal["fee2"])) {
									$totalFee+=$rowTotal["fee2"] ;
								}
								else {
									$totalFee+=$rowTotal["fee"] ;
								}
							}
							if ($feeError==FALSE) {
								if (substr($_SESSION[$guid]["currency"],4)!="") {
									print substr($_SESSION[$guid]["currency"],4) . " " ;
								}
								print number_format($totalFee, 2, ".", ",") ;
							}
						print "</td>" ;
						print "<td>" ;
							print dateConvertBack($row["invoiceIssueDate"]) ;
						print "</td>" ;
						print "<td>" ;
							print dateConvertBack($row["invoiceDueDate"]) ;
						print "</td>" ;
					print "</tr>" ;
				}
			}
			if ($count==0) {
				print "<tr class=$rowNum>" ;
					print "<td colspan=2>" ;
						print "There are no results in this report." ;
					print "</td>" ;
				print "</tr>" ;
			}
		print "</table>" ;
	}
		
	$_SESSION[$guid]["financeInvoiceExportIDs"]=NULL ;
}
?>