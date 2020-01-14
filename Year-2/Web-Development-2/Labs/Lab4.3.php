<html>
<body>
<?php include ("header.php"); ?>
    
  Index = <?php echo $_POST["maxIndex"]; ?><br>
    
    <?php
        for ($Index = 0; $Index<=$_POST["maxIndex"]; $Index++)
        { echo '<span style="font-size: $Index pt">HELLO PHP!<br></span>';}
    ?>
                                                    
</body>
</html>