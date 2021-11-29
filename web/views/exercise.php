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
            <a href="food.php">Food Tracker</a>
          </li>
          <li class="navbar-right">
            <a href="exercise.php">Exercise Tracker</a>
          </li>
          <li class="navbar-right">
            <a href="goals.php">Goals</a>
          </li>
          <li class="navbar-right">
            <a href="welcome.php"> Home</a>
          </li>
        </ul>
      </div>
    </nav>

    <h1> Exercise Tracker </h1>

    <form action="add_exercise.php" method="post">
     <p>Activity Type: <input type="text" name="activity_type" required/></p>
     <p>Time Spent (minutes): <input type="number" name="time_spent" required/></p>
     <p>Calories Burnt: <input type="number" name="calories" required/></p>
     <p><input class="btn btn-primary" type="submit" value="Add Exercise"/></p>
    </form>

    <p>
        <?php
        // Include config file
        require_once "config.php";

        $sql = "SELECT exercise_id, activity_type, date, time_spent, calories FROM does NATURAL JOIN exercise WHERE username = ?";

        if($stmt = mysqli_prepare($conn, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "s", $param_username);

            // Set parameters
            $param_username = $_SESSION["username"];
            if(mysqli_stmt_execute($stmt)){
                $data = mysqli_stmt_get_result($stmt);

                // print table
                $output = "<table class='table mx-5'>";
                $output .= '<tr>';
                $output .= '<td><strong> Activity Type </strong></td>';
                $output .= '<td><strong> Time Spent </strong></td>';
                $output .= '<td><strong> Calories </strong></td>';
                $output .= '<td><strong> Date </strong></td>';
                $output .= '</tr>';
                foreach($data as $key => $var) {
                    $output .= '<tr>';
                    $output .= '<td>' . $var['activity_type'] . '</td>';
                    $output .= '<td>' . $var['time_spent'] . '</td>';
                    $output .= '<td>' . $var['calories'] . '</td>';
                    $output .= '<td>' . $var['date'] . '</td>';
                    $output .= '<td><form action="delete_exercise.php" method="post">';
                    $output .= '<input type="hidden" name="exercise_id" value="'. $var['exercise_id'] .'">';
                    $output .= '<input type="submit" class="btn btn-danger" value="Delete">';
                    $output .= '</form></td>';
                    $output .= '</tr>';
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
