<option value="">---select---</option>
        <?php
		include("../Connection/Connection.php");
		$selD="select * from tbl_district where state_id='".$_GET["did"]."'";
		$rowD=$Conn->query($selD);
		while($dataD=$rowD->fetch_assoc())
		{
			?>
            <option value="<?php echo $dataD["district_id"]?>"><?php echo $dataD["district_name"]?></option>
            <?php
		}
		?>