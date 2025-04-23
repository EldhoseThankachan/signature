<?php
session_start();
$message="";
	include("../Assets/Connection/Connection.php");
		if(isset($_POST["btn_login"]))
			{
				
				
				
				 $selQry="select * from tbl_admin where admin_email='".$_POST["txt_emailid"]."' and admin_password='".$_POST["txt_password"]."'";
				$rowAdmin=$Conn->query($selQry);
				
				
						 $selUser="select * from tbl_user where user_email='".$_POST["txt_emailid"]."' and user_password='".$_POST["txt_password"]."'";
				$rowUser=$Conn->query($selUser);
				
				
				$selOrganization="select * from tbl_organization where organization_email='".$_POST["txt_emailid"]."' and organization_password='".$_POST["txt_password"]."' and organization_vstatus='1'";
				$rowOrganization=$Conn->query($selOrganization);
				
				
				
				
				if($dataAdmin=$rowAdmin->fetch_assoc())
				{
					$_SESSION["aid"]=$dataAdmin["admin_id"];
					header("location:../Admin/HomePage.php");
				}
				
				else if($dataUser=$rowUser->fetch_assoc())
				{
					$_SESSION["uid"]=$dataUser["user_id"];
					$_SESSION["uname"]=$dataUser["user_name"];
					header("location:../Users/HomeUPage.php");
				}
				else if($dataOrganization=$rowOrganization->fetch_assoc())
				{
					$_SESSION["orgid"]=$dataOrganization["organization_id"];
					$_SESSION["orgname"]=$dataOrganization["organization_name"];
					header("location:../Organizers/HomeOrgPage.php");
				}
				else if($dataOrganization=$rowOrganization->fetch_assoc())
				{
					$_SESSION["orgid"]=$dataOrganization["organization_id"];
					$_SESSION["orgname"]=$dataOrganization["organization_name"];
					header("location:../Organizers/HomeOrgPage.php");
				}
				else
				{
					
						$message="Invalid Login!!!";
				}	
			}			
?>

		



<!doctype html>
<html lang="en">
  <head>
  	<title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="../Assets/Templates/Login/css/style.css">

	</head>
	<body class="img js-fullheight" style="background-image:url(../Assets/Templates/Main/images/about.jpeg);">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Login</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	<h3 class="mb-4 text-center">Have an account?</h3>
		      	<form action="#" class="signin-form" method="post">
		      		<div class="form-group">
		      			<input type="email" name="txt_emailid" class="form-control" placeholder="Email" required>
		      		</div>
	            <div class="form-group">
	              <input id="password-field" type="password" name="txt_password" class="form-control" placeholder="Password" required>
	              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
	            </div>
	            <div class="form-group">
	            	<button type="submit" name="btn_login" class="form-control btn btn-primary submit px-3">Login</button>
	            </div>
	            <div class="form-group d-md-flex">
	            	<div class="w-50">
		            	<!--<label class="checkbox-wrap checkbox-primary">Remember Me
									  <input type="checkbox" checked>
									  <span class="checkmark"></span>
									</label>-->
								</div>
								<div class="w-50 text-md-right">
									<a href="../Index.php" style="color: #fff">Home</a>
								</div>
	            </div>
	          </form>
	         <!-- <p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
	          <div class="social d-flex text-center">
	          	<a href="#" class="px-2 py-2 mr-md-1 rounded"><span class="ion-logo-facebook mr-2"></span> Facebook</a>
	          	<a href="#" class="px-2 py-2 ml-md-1 rounded"><span class="ion-logo-twitter mr-2"></span> Twitter</a>
	          </div>-->
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="../Assets/Templates/Login/js/jquery.min.js"></script>
  <script src="../Assets/Templates/Login/js/popper.js"></script>
  <script src="../Assets/Templates/Login/js/bootstrap.min.js"></script>
  <script src="../Assets/Templates/Login/js/main.js"></script>

	</body>
</html>

