<?php

    include ("header.php");
    $time=date("H");
    if ($time<"10")
    { echo "Have a good morning!<br>";    }

    else if ($time<"20")
    { echo "Have a good day!<br>";   }

    else 
    { echo "Have a good night!<br>" ;  }

       
    $highIndex =8;
    $Index =0;

    do {
        $num_arr[$Index] = 5 * (1+$Index);
        $Index++;
        
    } while ($Index<$highIndex);

    foreach($num_arr as $value)
    {
        echo "$value <br>";
    }



?>