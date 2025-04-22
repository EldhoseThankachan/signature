<?php
session_start();
include("../Connection/Connection.php");
?>
<table align="center" cellpadding="60">
    <tr>
    <?php
      $sel="select * from tbl_tournament t inner join tbl_place p on p.place_id=t.place_id inner join tbl_district d on d.district_id=p.district_id inner join tbl_state s on s.state_id=d.state_id inner join tbl_tournamenttype tt on tt.tournamenttype_id=t.tournament_type inner join tbl_gametype gt on gt.gametype_id=t.tournament_gtype where True";
	  //echo $sel;
	  if($_GET["sid"]!=null)
	  {
		  $sel.=" and s.state_id='".$_GET["sid"]."'";
	  }
	  if($_GET["did"]!=null)
	  {
		  $sel.=" and d.district_id='".$_GET["did"]."'";
	  }
	  if($_GET["pid"]!=null)
	  {
		  $sel.=" and p.place_id='".$_GET["pid"]."'";
	  }
	  
	  if($_GET["tid"]!=null)
	  {
		  $sel.=" and t.tournament_type='".$_GET["tid"]."'";
	  }
	  $row=$Conn->query($sel);
	  $i=0;
	  while($data=$row->fetch_assoc())
	  {
		$i++;		  
	
	  ?>
      <td><p style="border:1px solid black;padding:10px;">
      
      NAME:<?php echo $data["tournament_name"]; ?> <br />
      Type:<?php echo $data["tournamenttype_name"]; ?> <br />
      GameType:<?php echo $data["gametype_name"]; ?> <br />
      Fee :<?php echo $data["tournament_fee"]; ?> <br />
      Landmark :<?php echo $data["tournament_landmark"]; ?> <br />
     <a href="Booking.php?rid=<?php echo $data["tournament_id"]?>">Book</a>
       </p>
      </td>
      <?php
	  
	  if($i==4)
	  {
		  ?>

		  </tr>
		  <tr>
           <?php
		   $i=0;
	  }}
	  
	  ?>
    </tr>
   
  </table>