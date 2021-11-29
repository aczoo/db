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

    <h1> Food Tracker </h1>

    <form action="add_food.php" method="post">
     <p>Food Item: <input type="text" name="food" required/></p>
     <p>Quantity: <input type="number" name="quantity" min="1" required/></p>
     <p>Calories: <input type="number" name="calories" min="0" required/></p>
     <p><input class="btn btn-primary" type="submit" value="Add Food"/></p>
    </form>
    <br>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
    <div class="form-group">
        <label>Order By</label>
        <select type="text" name="order_by" class="form-control" style="width:20%;">
        <option value="quantity">quantity</option>
        <option value="calories">calories</option>
        <option value="date">date</option>
        </select>
    </div> 
     <p><input class="btn btn-primary" type="submit" value="Submit"/></p>
    </form>
    <p>
        <?php
        // Include config file
        require_once "config.php";

        $sql = "SELECT entry_id, food_item, quantity, calories, date FROM consumes NATURAL JOIN food WHERE username = ?";
        if($_SERVER["REQUEST_METHOD"] == "POST"){
            $order_by = $_POST["order_by"];
            if ($order_by == "quantity"){
                $sql = "SELECT entry_id, food_item, quantity, calories, date FROM consumes NATURAL JOIN food WHERE username = ? ORDER BY quantity DESC";
            }
            if ($order_by == "calories"){
                $sql = "SELECT entry_id, food_item, quantity, calories, date FROM consumes NATURAL JOIN food WHERE username = ? ORDER BY calories DESC";
            }
            if ($order_by == "date"){
                $sql = "SELECT entry_id, food_item, quantity, calories, date FROM consumes NATURAL JOIN food WHERE username = ? ORDER BY date";
            }
           
        }
        if($stmt = mysqli_prepare($conn, $sql)){

        mysqli_stmt_bind_param($stmt, "s", $param_username);

            // Set parameters
            $param_username = $_SESSION["username"];
        if(mysqli_stmt_execute($stmt)){
                $data = mysqli_stmt_get_result($stmt);
                // print table
                $output = "<table class='table mx-5'>";
                $output .= '<tr>';
                $output .= '<td><strong> Food </strong></td>';
                $output .= '<td><strong> Quantity  </strong></td>';
                $output .= '<td><strong> Calories  </strong></td>';
                $output .= '<td><strong> Date  </strong></td>';
                $output .= '</tr>';
                foreach($data as $key => $var) {
                    $output .= '<tr>';
                    $output .= '<td>' . $var['food_item'] . '</td>';
                    $output .= '<td>' . $var['quantity'] . '</td>';
                    $output .= '<td>' . $var['calories'] . '</td>';
                    $output .= '<td>' . $var['date'] . '</td>';
                    $output .= '<td><form action="delete_food.php" method="post">';
                    $output .= '<input type="hidden" name="entry_id" value="'. $var['entry_id'] .'">';
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
