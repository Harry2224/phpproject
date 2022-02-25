

<?php
include_once 'PHPfunctions.php';
$productcode="";
$firstname = "";
$lastname ="";
$gender ="";
$errorOccured = false;
$errorproductcode="";
$errorfirstname ="";
$errorlastname ="";
$city="";
$errorcity="";
$comment="";
$errorcomment="";
$price="";
$errorprice="";
$quantity="";
$errorquantity="";
$confirmationmessage="";


# validate the posted data

#check if the user clicked the submit button
if(isset($_POST["submitbutton"]))
{
    #save the posted data into variables
    $productcode= htmlspecialchars(trim($_POST["productcode"]));
 $firstname = htmlspecialchars(trim($_POST["firstname"]));
 $lastname = htmlspecialchars(trim($_POST["lastname"]));
 if(mb_strlen($_POST["productcode"]))
 {
    $gender = $_POST["gender"]; 
 }
 
 #validate the firstname(not empty + no more than 10 chars)
 if(mb_strlen($firstname)== 0)
 {
     $errorOccured = "true";
     $errorfirstname = "The firstname cannot be empty";
 }
 else {
     if(mb_strlen($firstname) > 10)
     {
         $errorOccured = "true";
         $errorfirstname = "The firstname cannot... 10 characters";
     }
 }
 #this goes below in the <form>
        
  if(mb_strlen($lastname)== 0)
 {
      $errorOccured = "true";
     $errorfirstname = "The lastname cannot be empty";
 }
 else {
     if(mb_strlen($lastname) > 15)
     {
         $errorOccured ="true";
         $errorlastname = "The lastname cannot... 15 characters";
     }
 }
 if($errorOccured == false)
 {
  // header('location:confirmation.php');
  // die();
     $firstname="";
     $lastname="";
     $confirmationmessage="your info is correct";
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
 body{ background-color:aquamarine; }
 table{ background-color:palegoldenrod; }
 h1{ color:green; }
 #buttonAlign {	padding-left:25px; }
</style>
    </head>
    
    <body>
        <table width="100%">
            <tr>
                
                <td> <img src="<?php echo FILE_LOGO; ?>"
             class="logo"
             alt="company logo" height="200" width="600"> </td>
                <td align="center"> </td></tr>
             
    
       <tr><td> <a href="<?php echo FILE_INDEX;?>">Homepage</a></td></tr>
       <tr><td><a href="<?php echo FILE_BUYING;?>">Buying</a></td></tr>
       <tr><td><a href="<?php echo FILE_ORDERS;?>">Orders</a></td></tr> 
   
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
        <form action="index.php" method="POST">
            
            <p>
            <label>Product Code:</label>
            <input type ="text" name="productcode"
                   value="<?php echo $productcode; ?>">
            <span class = "validationError">
               <?php echo $errorproductcode;?> </span>
        </p>
        <p>
            <label>Customer First Name:</label>
            <input type ="text" name="firstname"
                   value="<?php echo $firstname; ?>">
            <span class = "validationError">
               <?php echo $errorfirstname;?> </span>
        </p>
        
        <p>
            <label>Customer Last Name:</label>
            <input type ="text" name="lastname" 
                   value="<?php echo $lastname; ?>">
             <span class = "validationError">
               <?php echo $errorlastname;?> </span>

            
        </p>
        <p>
            <label>Customer City:</label>
            <input type ="text" name="city" 
                   value="<?php echo $city; ?>">
             <span class = "validationError">
               <?php echo $errorcity;?> </span>

            
        </p>
        <p>
            <label>Comments:</label>
            <input type ="text" name="comment" 
                   value="<?php echo $comment; ?>">
             <span class = "validationError">
               <?php echo $errorcomment;?> </span>

            
        </p>
        <p>
            <label>Product price:</label>
            <input type ="text" name="price" 
                   value="<?php echo $price; ?>">
             <span class = "validationError">
               <?php echo $errorprice;?> </span>

            
        </p><!-- comment -->
        <p>
            <label>Product Quantity:</label>
            <input type ="text" name="quantity" 
                   value="<?php echo $quantity; ?>">
             <span class = "validationError">
               <?php echo $errorquantity;?> </span>

            
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