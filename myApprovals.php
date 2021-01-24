<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['emplogin'])==0)
    {   
header('location:index.php');
}
else{

// code for Inactive  employee    
if(isset($_GET['rejectLeaveId']))
{
$id=$_GET['rejectLeaveId'];
$status="Rejected";
$curDate=date("d/m/Y");
$sql = "update tblleaves set AppSecHeadStatus=:status,AppSecHeadDate=:curDate WHERE id=:id";
$query = $dbh->prepare($sql);
$query -> bindParam(':id',$id, PDO::PARAM_STR);
$query -> bindParam(':status',$status, PDO::PARAM_STR);
$query -> bindParam(':curDate',$curDate, PDO::PARAM_STR);
$query -> execute();
header('location:myApprovals.php');
}

//code for active employee
if(isset($_GET['approveLeaveId']))
{
$id=$_GET['approveLeaveId'];
$status="Approved";
$curDate=date("d/m/Y");

$sql = "update tblleaves set AppSecHeadStatus=:status,AppSecHeadDate=:curDate  WHERE id=:id";
$query = $dbh->prepare($sql);
$query -> bindParam(':id',$id, PDO::PARAM_STR);
$query -> bindParam(':status',$status, PDO::PARAM_STR);
$query -> bindParam(':curDate',$curDate, PDO::PARAM_STR);
$query -> execute();
header('location:myApprovals.php');
}
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        
        <!-- Title -->
        <title>Employee | Pending Leave Approvals</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
        <meta charset="UTF-8">
        <meta name="description" content="Responsive Admin Dashboard Template" />
        <meta name="keywords" content="admin,dashboard" />
        <meta name="author" content="Steelcoders" />
        
        <!-- Styles -->
        <link type="text/css" rel="stylesheet" href="assets/plugins/materialize/css/materialize.min.css"/>
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="assets/plugins/material-preloader/css/materialPreloader.min.css" rel="stylesheet">
        <link href="assets/plugins/datatables/css/jquery.dataTables.min.css" rel="stylesheet">

            
        <!-- Theme Styles -->
        <link href="assets/css/alpha.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
<style>
        .errorWrap {
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #dd3d36;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
.succWrap{
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #5cb85c;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
        </style>
    </head>
    <body>
       <?php include('includes/header.php');?>
            
       <?php include('includes/sidebar.php');?>
            <main class="mn-inner">
                <div class="row">
                    <div class="col s12">
                        <div class="page-title">Pending Leave Approvals</div>
                    </div>
                   
                    <div class="col s12 m12 l12">
                        <div class="card">
                            <div class="card-content">
                                <span class="card-title">Pending Leave Approvals</span>
                                <?php if($msg){?><div class="succWrap"><strong>SUCCESS</strong> : <?php echo htmlentities($msg); ?> </div><?php }?>
                                <table id="example" class="display responsive-table ">
                                    <thead>
                                        <tr>
                                            <th width="15">#</th>
											<th width="90">Employee Name</th>
                                            <th width="90">Leave Type</th>
                                            <th width="50">From</th>
                                            <th width="50">To</th>
                                             <th width="120">Description</th>
                                             <th width="120">Posting Date</th>
                                            <th width="200">Approvel by Secional Head</th>
                                            <th width="200">Action</th>
                                            
                                        </tr>
                                    </thead>
                                 
                                    <tbody>
<?php 
$eid=$_SESSION['eid'];
$sql = "SELECT tblemployees.FirstName,tblemployees.LastName,tblemployees.EmpId,tblleaves.id,tblleaves.LeaveType,tblleaves.ToDate,tblleaves.FromDate,tblleaves.Description,tblleaves.PostingDate,tblleaves.AppSecHead,tblleaves.AppSecHeadStatus,tblleaves.AppSecHeadDate,tblleaves.AppDirector from tblleaves INNER JOIN tblemployees ON tblleaves.empid=tblemployees.id where AppSecHead=:eid";
$query = $dbh -> prepare($sql);
$query->bindParam(':eid',$eid,PDO::PARAM_STR);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{               ?>  
                                        <tr>
                                            <td> <?php echo htmlentities($cnt);?></td>
											<td><?php echo htmlentities($result->FirstName." ".$result->LastName."(".$result->EmpId.")");?></td>
                                            <td><?php echo htmlentities($result->LeaveType);?></td>
                                            <td><?php echo htmlentities($result->ToDate);?></td>
                                            <td><?php echo htmlentities($result->FromDate);?></td>
                                           <td><?php echo htmlentities($result->Description);?></td>
                                            <td><?php echo htmlentities($result->PostingDate);?></td>
											
											<td><?php if($result->AppSecHeadStatus=="") {
												echo htmlentities('waiting for approval');

                                            } else{
												echo htmlentities(($result->AppSecHeadStatus)." at ".$result->AppSecHeadDate);
											}
                                            ?>
											</td>
										<td><a href="myApprovals.php?rejectLeaveId=<?php echo htmlentities($result->id);?>" onclick="return confirm('Are you sure you want to REJECT this Leave?');" > <i class="material-icons" title="Inactive">clear</i>
											<a href="myApprovals.php?approveLeaveId=<?php echo htmlentities($result->id);?>" onclick="return confirm('Are you sure you want to Approve this Leave?');"><i class="material-icons" title="Active">done</i></td>          
                                        </tr>
                                         <?php $cnt++;} }?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
         
        </div>
        <div class="left-sidebar-hover"></div>
        
        <!-- Javascripts -->
        <script src="assets/plugins/jquery/jquery-2.2.0.min.js"></script>
        <script src="assets/plugins/materialize/js/materialize.min.js"></script>
        <script src="assets/plugins/material-preloader/js/materialPreloader.min.js"></script>
        <script src="assets/plugins/jquery-blockui/jquery.blockui.js"></script>
        <script src="assets/plugins/datatables/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/alpha.min.js"></script>
        <script src="assets/js/pages/table-data.js"></script>
        
    </body>
</html>
<?php } ?>