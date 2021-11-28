<?php
// Initialize the session
session_start();

// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;

}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <style>
        body{ font: 14px sans-serif; text-align: center; }
    </style>
</head>
<body>
    <nav class="navbar navbar-default navbar-static-top navbar-inverse">
      <div class="container">
        <ul class="nav navbar-nav navbar-right">
          <li class="navbar-right">
            <a href="logout.php">Sign Out</a>
          </li>
          <li class="navbar-right">
            <a href="profile.php"><span class="glyphicon glyphicon-user"></span> Hi, <b><?php echo htmlspecialchars($_SESSION["username"]); ?></b></a>
          </li>
          <li class="navbar-right">
            <a href="welcome.php"> Home</a>
          </li>
        </ul>
      </div>
    </nav>

    <h1> Food Tracker </h1>
    <p>
        <?php
        // Include config file
        require_once "config.php";

        $sql = "SELECT food_item, quantity, calories, date FROM consumes NATURAL JOIN food WHERE username = ?";

        if($stmt = mysqli_prepare($conn, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "s", $param_username);

            // Set parameters
            $param_username = $_SESSION["username"];
            if(mysqli_stmt_execute($stmt)){
                $data = mysqli_stmt_get_result($stmt);

                // print table
                $output = "<table class='table mx-5'>";
                foreach($data as $key => $var) {
                    if($key===0) {
                        $output .= '<tr>';
                        foreach($var as $col => $val) {
                            $output .= "<td>" . $col . '</td>';
                        }
                        $output .= '</tr>';
                        foreach($var as $col => $val) {
                            $output .= '<td>' . $val . '</td>';
                        }
                        $output .= '</tr>';
                    }
                    else {
                        $output .= '<tr>';
                        foreach($var as $col => $val) {
                            $output .= '<td>' . $val . '</td>';
                        }
                        $output .= '</tr>';
                    }
                }
                $output .= '</table>';
                echo $output;
            }
        }
        mysqli_close($conn);
        ?>
    </p>
</body>
</html>
