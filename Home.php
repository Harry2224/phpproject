

<?php
include_once 'PHPfunctions.php';
define("PICTURE_A1", FOLDER_PICTURES . "a1.jpg");
define("PICTURE_A2", FOLDER_PICTURES . "a2.jpg");
define("PICTURE_A3", FOLDER_PICTURES . "a3.jpg");
define("PICTURE_A4", FOLDER_PICTURES . "a4.jpg");
define("PICTURE_B4", FOLDER_PICTURES . "b4.jpeg"); {
    ?>
     <!DOCTYPE html>
     <html>
        <head><meta charset ="UTF-8">

            <title><?php echo $pageTitle ?></title>
            <style type="text/css">
                body{
                    background-color:purple;
                }
                table{
                    background-color:highlighttext;
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
            <table width="100%">
                <tr>

                    <td> <img src="<?php echo FILE_LOGO; ?>"
                              class="logo"
                              alt="company logo" height="200" width="600"> </td>
                    <td align="center"><h1 style="font-family:Lucida Handwriting;">Indoor Plants</h1> 
                        <p style="font-family:Lucida Handwriting;">Indoor plants improve air quality in other ways as well.
                            Plants release water vapor into the air, which increases humidity,                            
                            and this can help improve respiratory and skin health by offsetting the drying effects of heating systems.</p></td></tr>


                <tr><td> <a href="<?php echo FILE_INDEX; ?>">Homepage</a></td></tr>
                <tr><td><a href="<?php echo FILE_BUYING; ?>">Buying</a></td></tr>
                <tr><td><a href="<?php echo FILE_ORDERS; ?>">Orders</a></td></tr>
    <?php
    $myArray = array(PICTURE_A1, PICTURE_A2, PICTURE_A3, PICTURE_A4, PICTURE_B4);
    shuffle($myArray);
    ?> 

                      <td>
                    <a href="https://foli.ca/collections/small-plant-pot-combo">
                        <img src="<?php echo $myArray[0]; ?>" class ="advertising" alt="advertising" height ="400" width="650"><\a?>
                        </td>

                        </table>


                        </body>
                        <footer class="footer">
                            <div class="footerContainer">
                                  <p class="copyright">COPYRIGHT HARJINDER KAUR 2111536 (<?php echo date("Y"); ?>)</p>
                            </div>
                        </footer>
                        </html>
    <?php
}
?>