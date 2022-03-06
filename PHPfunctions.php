

<?php
define("FILE_INDEX", "index.php");
define("FILE_HOME", "Home.php");
define("FILE_BUYING", "Buying.php");
define("FILE_ORDERS", "Orders.php");

define("FOLDER_PICTURES", "pictures/");

define("FILE_LOGO", FOLDER_PICTURES . "plant.png");
define("FOLDER_CSS", "CSS/");
define("FILE_CSS", FOLDER_CSS . "style.css");

//define ("FILE_CSS_BIG", FOLDER_CSS . "contact.php");

$pageTitle = "";

function pageTop($pageTitle) {
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
                    background-color:aqua;
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
                              alt="company logo" height="200" width="600" opacity="0.3"> </td>
                    <td align="center"> <h1 style="font-family:Lucida Handwriting;">Indoor Plants</h1> 
                        <p style="font-family:Lucida Handwriting;">Indoor plants improve air quality in other ways as well.
                            Plants release water vapor into the air, which increases humidity,                            
                            and this can help improve respiratory and skin health by offsetting the drying effects of heating systems.</p></td>
                </tr>
                <tr> <?php
    navigationMenu();
}

function navigationMenu() {
    ?>

                <tr><td> <a href="<?php echo FILE_HOME; ?>">Homepage</a></td></tr>
                <tr><td><a href="<?php echo FILE_BUYING; ?>">Buying</a></td></tr>
                <tr><td><a href="<?php echo FILE_ORDERS; ?>">Orders</a><?php
                $myArray = array(PICTURE_A1, PICTURE_A2, PICTURE_A3, PICTURE_A4, PICTURE_B4);
                shuffle($myArray);
    ?> 
                        <a href="https://foli.ca/collections/small-plant-pot-combo">
                            <img src="<?php echo $myArray[0]; ?>" class ="advertising" alt="advertising" height ="400" width="650">
                            </td></tr> 

    <?php
}

function pageBottom() {
    ?>
                            </tr>

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