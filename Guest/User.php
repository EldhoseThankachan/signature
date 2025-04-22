<?php include("../Assets/Connection/Connection.php");
include("Head.php");
  if(isset($_POST["btn_save"]))
  
  {
	  $name=$_POST["txt_name"];
	  $address=$_POST["txt_add"];
	  $contact=$_POST["txt_cont"];
	  $email=$_POST["txt_mail"];
	  $gender=$_POST["rdbgender"];

	
	  $place=$_POST["sel_place"];

	  $password=$_POST["txt_password"];
	  $confirmpassword=$_POST["txt_confirmpass"];
	  
	  
	  $photo=$_FILES["filepic"]['name'];
	  $temp=$_FILES['filepic']['tmp_name'];
	  move_uploaded_file($temp,"../Assets/UserPhoto/".$photo);
	  
	   $proof=$_FILES["fil_proof"]['name'];
	  $temp=$_FILES['fil_proof']['tmp_name'];
	  move_uploaded_file($temp,"../Assets/UserProof/".$proof);
	  if($password== $confirmpassword)
	  {
$insQry="insert into tbl_user(user_name,user_address,user_contact,user_email,user_gender,place_id,user_Photo,user_Proof,user_Password)values('".$name."','".$address."','".$contact."','".$email."','".$gender."','".$place."','".$photo."','".$proof."','".$password."')";
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
<title>Esports Management-Users</title>

</head>

<body>
<br /><br />
<br /><br />
<br /><br />
<br /><br />
<br /><br />
<br /><br />
<br /><br />
<br /><br />
<div align="center" id="tab">
<form action="" method="post" enctype="multipart/form-data" name="form1" id="form1">
  <table border="1" cellpadding="10" align="center">
    <tr>
      <td>Name</td>
      <td><label for="txt_name"></label>
      <input type="text" name="txt_name" id="txt_name" required autocomplete="off" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"/></td>
    </tr>
    <tr>
      <td>Address</td>
      <td><textarea name="txt_add" required ></textarea></td>
    </tr>
    <tr>
      <td>Contact</td>
      <td><label for="txt_cont"></label>
      <input type="text" name="txt_cont" id="txt_cont" required pattern="([0-9 ]{10,10})" /></td>
    </tr>
    <tr>
      <td>Email</td>
      <td><label for="txt_mail"></label>
      <input type="email" name="txt_mail" id="txt_mail" required autocomplete="off" /></td>
    </tr>
    <tr>
      <td>Gender</td>
      <td>
            <input type="radio" name="rdbgender" id="rdbgender" value="Male" checked="checked" />Male
            <input type="radio" name="rdbgender" id="rdbgender" value="Female" />Female
     </td>
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
      <td>Photo</td>
      <td><label for="filepic"></label>
      <input type="file" name="filepic" id="filepic" required autocomplete="off" /></td>
    </tr>
    <tr>
      <td>Proof</td>
      <td><label for="fil_proof"></label>
      <input type="file" name="fil_proof" id="fil_proof" required autocomplete="off" /></td>
    </tr>
    <tr>
      <td>Password</td>
      <td><label for="txt_password"></label>
      <input type="password" name="txt_password" id="txt_password" required autocomplete="off" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" />
      
   </td>
    </tr>
    <tr>
      <td>ConfirmPassword</td>
      <td><label for="txt_confirmpass"></label>
      <input type="password" name="txt_confirmpass" id="txt_confirmpass" /></td>
    </tr>
    <tr>
      <td colspan="2"><input type="submit" name="btn_save" id="btn_save" value="Submit" />
      <input type="submit" name="btn_can" id="btn_can" value="Cancel" /></td>
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