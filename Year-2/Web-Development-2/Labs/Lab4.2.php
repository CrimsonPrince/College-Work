<html>
<body>
    
<?php include ("header.php"); ?>

  Hour = <?php echo $_POST["hour"]; ?><br>
    
    <?php
        if ($_POST["hour"] <10)
        { echo "have a good morning";       }

        else if ($_POST["hour"] <18)
        { echo "have a good day"; }
	
        else if ($_POST["hour"] <23)
        { echo "good evening";        }

        else 
        { echo "switch off computer";   }
     
    ?>
                                                    
</body>
</html>