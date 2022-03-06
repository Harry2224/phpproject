

<?php
include_once 'PHPfunctions.php'; {
    ?>
    <!DOCTYPE html>
    <html>
        <head><meta charset ="UTF-8">

            <title><?php echo $pageTitle ?></title>
            <link rel="stylesheet" type="text/css">
            <style type="text/css">

                .whitebackground {
                    background-color: white;
                }
                .pinkbackground {
                    background-color: purple;
                }

                table{
                    background-color:plum;
                }
                h1
                {
                    color:green;
                }
                #buttonAlign {
                    padding-left:25px;
                }
            </style>
        </head>

        <body class="<?php
    $backgroundcolor = "pinkbackground";

    if (isset($_GET["command"])) {
        if ($_GET["command"] == "print") {
            $backgroundcolor = "whitebackground";
        } else {
            if ($_GET["command"] == "green") {
                $backgroundcolor = "greenbackground";
            }
        }
    }
    echo $backgroundcolor;
    ?>">
              <?php
                  header("Content-type: text/html");
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
            <table border="1">

                <tr>
                    <th>Product ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>City</th>
                    <th>Comments</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                    <th>Taxes</th>
                    <th>Grand</th>


                </tr>

                <?php
                $file = fopen("jft.txt", "r") or die("Error");

                while (!feof($file)) {
                    $fileLine = fgets($file);
                    if (($fileLine) != "") {
                        $dataArray = json_decode($fileLine);
                        echo"<tr>";
                        foreach ($dataArray as $key => $value) {
                            if ($key == 5) {
                                echo "<td>" . $value . "$</td>";
                            } else if ($key == 7) {
                                echo "<td>" . $value . "$</td>";
                            } else if ($key == 8) {
                                echo "<td>" . $value . "$</td>";
                            } else if ($key == 9) {
                                echo "<td>" . $value . "$</td>";
                            } else {
                                echo "<td>" . $value . "</td>";
                            }
                        }
                        echo"</tr>";
                    }
                }
                ?>

            </table>






            <a   href="\2111536\cheatsheet.txt" download>Download link</a>
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