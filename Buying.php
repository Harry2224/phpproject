

<?php
include_once 'PHPfunctions.php';
$productcode = "";
$firstname = "";
$lastname = "";

$errorOccured = false;
$errorproductcode = "";
$errorfirstname = "";
$errorlastname = "";
$city = "";
$errorcity = "";
$comment = "";
$errorcomment = "";
$price = "";
$errorprice = "";
$quantity = "";
$errorquantity = "";
$confirmationmessage = "";
$pageTitle = "";


# validate the posted data
#check if the user clicked the submit button
if (isset($_POST["submitbutton"])) {
    #save the posted data into variables
    $productcode = htmlspecialchars(trim($_POST["productcode"]));
    $firstname = htmlspecialchars(trim($_POST["firstname"]));
    $lastname = htmlspecialchars(trim($_POST["lastname"]));
    $city = htmlspecialchars(trim($_POST["city"]));
    $comment = htmlspecialchars(trim($_POST["comment"]));
    $price = htmlspecialchars(trim($_POST["price"]));
    $quantity = htmlspecialchars(trim($_POST["quantity"]));
    if (mb_strlen($productcode) > 0) {
        if ($productcode[0] != 'p') {
            $errorOccured = "true";
            $errorproductcode = "The product code cannot be empty";
        } else if (strlen($productcode) > 12) {
            $errorOccured = "true";
            $errorproductcode = "The product code cannot be empty";
        } else {
            // valid
        }
    } else {
        $errorOccured = "true";
        $errorproductcode = "The product code cannot be empty";
    }

    #validate the firstname(not empty + no more than 10 chars)
    if (mb_strlen($firstname) == 0) {
        $errorOccured = "true";
        $errorfirstname = "The firstname cannot be empty";
    } else {
        if (mb_strlen($firstname) > 10) {
            $errorOccured = "true";
            $errorfirstname = "The firstname cannot... 10 characters";
        }
    }
    #this goes below in the <form>

    if (mb_strlen($lastname) == 0) {
        $errorOccured = "true";
        $errorfirstname = "The lastname cannot be empty";
    } else {
        if (mb_strlen($lastname) > 15) {
            $errorOccured = "true";
            $errorlastname = "The lastname cannot... 15 characters";
        }
    }

    if (mb_strlen($city) == 0) {
        $errorOccured = "true";
        $errorcity = "The city cannot be empty";
    } else {
        if (mb_strlen($city) > 8) {
            $errorOccured = "true";
            $errorcity = "The city name cannot... 8 characters";
        }
    }

    if (mb_strlen($comment) > 200) {
        $errorOccured = "true";
        $errorcomment = "The comment cannot... 200 characters";
    }


    if (is_numeric($price) == 0) {
        $errorOccured = "true";
        $errorprice = "price cannot be empty";
    } else {
        if (is_numeric($price) > 10000) {

            $errorOccured = "true";
            $errorprice = "price cannot be more than 10000";
        }
    }
    if (is_numeric($quantity))
    {
        if (strpos($quantity, '.') !== false)
        {
            echo "Your number is not an INTEGER ->" . $quantity;
        } 
        else
        {
            $quantity = (int) $quantity;
            if (is_integer($quantity))
            {
                if ($quantity <= 1 && $quantity >= 99) 
                {
                   
                    echo "You have to enter integer between " . 1 . " to " . 99;
                }
            }
            else
            {
                echo "Your number is not an INTEGER ->" . var_dump($quantity) . $quantity;
            }
        }
    } 
    else
    {
        echo "Your value is string ->" . var_dump($quantity) . $quantity;
    }

    if ($errorOccured == false) 
    {
        $productcode = "";
$firstname = "";
$lastname = "";


$city = "";

$comment = "";

$price = "";

$quantity = "";

        $confirmationmessage = "your info is correct";
    }
    #this goes below in the <form>
    // <span class = "validationerror">
    // <?php echo $errorfirstname;
} 
{
    ?><html>
        <head><meta charset ="UTF-8">

            <title><?php echo $pageTitle ?></title>
            <style type="text/css">
                body{
                    background-color:aquamarine;
                }
                table{
                    background-color:palegoldenrod;
                }
                h1{
                    color:green;
                }
                #buttonAlign {
                    padding-left:25px;
                }
            </style>
        </head>

        <body>
            <?php
            $myArray="";
            $Subtotal= (floatval($price)) * (floatval($quantity));
            
$Taxesamount= ($Subtotal*13.45)/100;
$Grandtotal=$Subtotal+$Taxesamount;
            
            $myarray = array("$productcode", "$firstname", "$lastname", "$city","$comment", "$price", "$quantity",  "$Subtotal",
                "$Taxesamount", "$Grandtotal");
            $JSONstring = json_encode($myarray);

            $anotherArray = json_decode($JSONstring);
            #var_dump($anotherArray);

            $anotherArray[0];
            $fileHandle = fopen("jft.txt", "a")
                    or die('cannot open the data file');
            fwrite($fileHandle, "$myArray");
            
            #close the file
            fclose($fileHandle);

            #open/write/close file in one step
            file_put_contents("jft.txt", $JSONstring,
                    FILE_APPEND);
            ?> 
            <table width="100%">
                <tr>

                    <td> <img src="<?php echo FILE_LOGO; ?>"
                              class="logo"
                              alt="company logo" height="200" width="600"> </td>
                    <td align="center"> </td></tr>


                <tr><td> <a href="<?php echo FILE_INDEX; ?>">Homepage</a></td></tr>
                <tr><td><a href="<?php echo FILE_BUYING; ?>">Buying</a></td></tr>
                <tr><td><a href="<?php echo FILE_ORDERS; ?>">Orders</a></td></tr> 

            </table>
            <?php
            // echo phpinfo();
            # echo "<br>Method 1):" . filter_input(INPUT_POST, "firstname", FILTER_SANITIZE_STRING);
#echo "<br>Method 2):" . filter_input(INPUT_POST, "firstname", FILTER_SANITIZE_SPECIAL_CHARS);
#echo "<br>Method 3):" . htmlspecialchars($_POST ["firstname"]);
#echo "<br>Method 4):" . htmlentities($_POST ["firstname"]);
#echo "<br> Original):" . ($_POST ["firstname"]);
            echo $confirmationmessage;
            ?>
            <form action="Buying.php" method="POST">

                <p>
                    <label>Product Code *:</label>
                    <input type ="text" name="productcode"
                           value="<?php echo $productcode; ?>">
                    <span class = "validationError">
                        <?php echo $errorproductcode; ?> </span>
                </p>
                <p>
                    <label>Customer First Name:</label>
                    <input type ="text" name="firstname"
                           value="<?php echo $firstname; ?>">
                    <span class = "validationError">
                        <?php echo $errorfirstname; ?> </span>
                </p>

                <p>
                    <label>Customer Last Name:</label>
                    <input type ="text" name="lastname" 
                           value="<?php echo $lastname; ?>">
                    <span class = "validationError">
                        <?php echo $errorlastname; ?> </span>


                </p>
                <p>
                    <label>Customer City:</label>
                    <input type ="text" name="city" 
                           value="<?php echo $city; ?>">
                    <span class = "validationError">
                        <?php echo $errorcity; ?> </span>


                </p>
                <p>
                    <label>Comments:</label>
                    <input type ="text" name="comment" 
                           value="<?php echo $comment; ?>">
                    <span class = "validationError">
                        <?php echo $errorcomment; ?> </span>


                </p>
                <p>
                    <label>Product price:</label>
                    <input type ="text" name="price" 
                           value="<?php echo $price; ?>">
                    <span class = "validationError">
                        <?php echo $errorprice; ?> </span>


                </p><!-- comment -->
                <p>
                    <label>Product Quantity:</label>
                    <input type ="text" name="quantity" 
                           value="<?php echo $quantity; ?>">
                    <span class = "validationError">
                        <?php echo $errorquantity; ?> </span>


                </p>

                <p>
                    <input type= "submit" name ="submitbutton" value="Submit"  />
                    <input type="reset" value="clear all fields"  /><!-- comment -->
                </p>

            </form>


        </body>
    </html>
    <?php
}
?>