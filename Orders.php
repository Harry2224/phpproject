

<?php
include_once 'PHPfunctions.php'; {
    ?><html>
        <head><meta charset ="UTF-8">

            <title><?php echo $pageTitle ?></title>
            <style type="text/css">
                body{
                    background-color:purple;
                }
                table{
                    background-color:plum;
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
            header("Content-type: text/html");

            $file = fopen("jft.txt", "r") or die("Error");
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

while(($row = fgets($file)) != false) {

$col = explode(',',$row);

foreach($col as $data) {

echo "<td>". trim($data)."</td>\n";

}

}

?>

                



            </table>

        </body>
    </html>
    <?php
}
?>