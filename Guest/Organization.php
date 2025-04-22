
<?php include("../Assets/Connection/Connection.php");
include("Head.php");
  if(isset($_POST["btn_submit"]))
  
  {
	  $name=$_POST["txt_name"];
	  $address=$_POST["txt_add"];
	  $contact=$_POST["txt_contact"];
	  $place=$_POST["sel_place"];
	  $email=$_POST["txt_email"];

	  $password=$_POST["txt_pass"];
	  $confirmpassword=$_POST["txt_confpass"];
	  
	  
	   $logo=$_FILES["file_logo"]['name'];
	  $temp=$_FILES['file_logo']['tmp_name'];
	  move_uploaded_file($temp,"../Assets/Orglogo/".$logo);
	    
	  $proof=$_FILES["file_proof"]['name'];
	  $temp=$_FILES["file_proof"]['tmp_name'];
	  move_uploaded_file($temp,"../Assets/Orgproof/".$proof);
	  if($password== $confirmpassword)
	  {
 $insQry="insert into tbl_organization(organization_name,organization_address,organization_contact,place_id,organization_email,organization_logo,organization_proof,organization_password)values('".$name."','".$address."','".$contact."','".$place."','".$email."','".$logo."','".$proof."','".$password."')";

        if($Conn->query($insQry))
	     {
			
         ?>
         <script>
	     alert("Inserted");
	     </script>
         <?php
	}
	 
	else
	{
		 
?>
        <script>
		alert("Failed");
		</script>
       <?php
	}
}
 else
  {
	     ?>
         <script>
	     alert("Password missmatch");
	     </script>
         <?php  
 }
  }
 


?>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>OrganizationRegistration</title>
<!-- Copyright 2000-2006 Adobe Macromedia Software LLC and its licensors. All rights reserved. -->
<!-- Copyright 2000-2006 Adobe Macromedia Software LLC and its licensors. All rights reserved. -->
<!-- Copyright 2000-2006 Adobe Macromedia Software LLC and its licensors. All rights reserved. -->
</head>

<body>
<br /><br />
<br /><br />
<br /><br />
<br /><br />
<br /><br />
<br /><br />

<div align="center" id="tab">
<form action="" method="post" enctype="multipart/form-data" name="form1" id="form1">
  <table width="328" height="477" border="1" cellpadding="10" align="center">
    <tr>
      <td>Name</td>
      <td><label for="txt_name"></label>
      <input type="text" name="txt_name" id="txt_name" required autocomplete="off" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"/></td>
    </tr>
    <tr>
      <td>Address</td>
      <td><textarea name="txt_add" required></textarea></td>
    </tr>
    <tr>
      <td>Contact</td>
     <td>
        <label for="txt_cont"></label>
        <label for="txt_contact"></label>
        <input type="text" name="txt_contact" id="txt_contact" required pattern="([0-9 ]{10,10})" /></td>
      
    </tr>
     <tr>
      <td>State</td>
      <td><label for="sel_state2"></label>
        <select name="sel_state" id="sel_state2" onChange="getDistrict(this.value)">
        <option>--select state--</option>
         <?php
						$selQry="select * from tbl_state";
						$row=$Conn->query($selQry);
						while($data=$row->fetch_assoc())
							{
				?>
                <option value="<?php echo $data["state_id"]?>"><?php echo $data["state_name"]?></option>
                
                <?php
							}
							?>
      </select></td>
    </tr>
     <tr>
    <td>District</td>
      <td><label for="sel_dis"></label>
        <select name="sel_dis" id="sel_dis" onChange="getPlace(this.value)">
         <option>--select district--</option>
        <?php
						$selQry="select * from tbl_district";
						$row=$Conn->query($selQry);
						while($data=$row->fetch_assoc())
							{
				?>
        <option value="<?php echo $data["district_id"]?>"><?php echo $data["district_name"]?></option>
        <?php
							}
		?>
      </select></td>
    </tr>
     <tr>
      <td>Place</td>
      <td><label for="sel_place"></label>
        <select name="sel_place" id="sel_place">
        
        <option>--select place--</option>
      </select></td>
    </tr>
    <tr>
      <td>Email</td>
      <td><label for="txt_email"></label>
      <input type="email" name="txt_email" id="txt_email" required autocomplete="off" /></td>
    </tr>
    <tr>
      <td><p>Logo</p></td>
      <td><label for="file_logo"></label>
      <input type="file" name="file_logo" id="file_logo" required /></td>
    </tr>
    <tr>
      <td>Proof</td>
      <td><label for="file_proof"></label>
      <input type="file" name="file_proof" id="file_proof" required /></td>
    </tr>
    <tr>
      <td>Password</td>
      <td><label for="txt_pass"></label>
      <input type="password" name="txt_pass" id="txt_pass" required autocomplete="off" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" /></td>
    </tr>
   
    <tr>
      <td>Confirm Password</td>
      <td><label for="txt_confpass"></label>
      <input type="password" name="txt_confpass" id="txt_confpass" /></td>
    </tr>
    <tr>
      <td height="41" colspan="2"><input type="submit" name="btn_submit" id="btn_submit" value="Submit" />
      <input type="submit" name="btn_cancel" id="btn_cancel" value="Cancel" /></td>
    </tr>
  </table>
</form>
 </div>
</body>
<br /><br /><br /><br />
<br /><br />
<br /><br />
<br /><br />
<br /><br />

<?php
include("Foot.php");
?>

<script src="../Assets/JQuery/jQuery.js"></script>
<script>
function getDistrict(sid)
{
	$.ajax({
		url:"../Assets/AjaxPages/AjaxDistrict.php?did="+sid,
		success: function(html){
			$("#sel_dis").html(html);
		}
	});
}

function getPlace(pid)
{
	$.ajax({
		url:"../Assets/AjaxPages/AjaxPlace.php?did="+pid,
		success: function(html){
			$("#sel_place").html(html);
		}
	});
}
</script>
</html>
</html>