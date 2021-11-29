<?php
    // Initialize the session
    session_start();

    // Check if the user is logged in, if not then redirect him to login page
    if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
        header("location: login.php");
        exit;
    }
    // Include config file
    require_once "config.php";
    // Define variables and initialize with empty values
    $sql1 = "SELECT name, activity_level, gender, birthday FROM user WHERE username = ?";

    if($stmt = mysqli_prepare($conn, $sql1)){
        // Bind variables to the prepared statement as parameters
        mysqli_stmt_bind_param($stmt, "s", $param_username);

        // Set parameters
        $param_username = $_SESSION["username"];
        if(mysqli_stmt_execute($stmt)){
            // Store result
            mysqli_stmt_store_result($stmt);
            mysqli_stmt_bind_result($stmt, $name, $activity_level, $gender, $birthday);
            mysqli_stmt_fetch($stmt);
        }
    }
    $birthday_dt = new DateTime($birthday);
    $now = new DateTime('now');
    $age = $birthday_dt ->diff($now)->y;
    $sql2 = "SELECT recommended_calories FROM health_guidelines WHERE age = ? and gender = ? and activity_level = ?";
    if($stmt = mysqli_prepare($conn, $sql2)){
        mysqli_stmt_bind_param($stmt, "isi", $age, $gender, $activity_level);
        if(mysqli_stmt_execute($stmt)){
            // Store result
            mysqli_stmt_store_result($stmt);
            mysqli_stmt_bind_result($stmt, $recommended_calories);
            mysqli_stmt_fetch($stmt);

        }
    }
    $name_err = $birthday_err = $gender_err = "";
    // Processing form data when form is submitted
    if($_SERVER["REQUEST_METHOD"] == "POST"){
        // Validate name
        if(empty(trim($_POST["name"]))){
            $name_err = "Please enter a name.";
        }else{
            $name_update = trim($_POST["name"]);
        }

        // Validate birthday
        if(empty(trim($_POST["birthday"]))){
            $birthday_err = "Please enter a birthday.";
        } else{
            $birthday_update = trim($_POST["birthday"]);
            if(strlen($birthday_update)!=10 || $birthday_update[4] !='-' || $birthday_update[7] != '-'){
                $birthday_err = "Please follow the format YYYY-MM-DD.";
            }
        }
        if(!empty($_POST["activity_level"])){
            $activity_level = $_POST["activity_level"];
        }
        if(!empty($_POST["gender"])){
            $gender = $_POST["gender"];
        }

        // Check input errors before inserting in database
        if(empty($name_err)&& empty($birthday_err)&& empty($gender_err)){
            // Prepare an insert statement
            $sql = "UPDATE user SET name = ?, activity_level = ?, gender = ?, birthday = ? WHERE username = ?";
            if($stmt = mysqli_prepare($conn, $sql)){
                // Bind variables to the prepared statement as parameters
                mysqli_stmt_bind_param($stmt, "sisss", $name_update, $activity_level, $gender, $birthday_update, $_SESSION["username"]);
                // Attempt to execute the prepared statement
                if(mysqli_stmt_execute($stmt)){
                    // Refresh
                    header("Refresh:0");

                } else{
                    echo "Oops! Something went wrong. Please try again later.";
                }

                // Close statement
                mysqli_stmt_close($stmt);

            }
        }
    }
    mysqli_close($conn);
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

    <h1> Profile Page</h1>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="form-group">
                <label>Name</label>
                <input type="text" name="name" class="form-control" style="width:20%; text-align:center; margin-left:auto; margin-right:auto;" <?php echo (!empty($name_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $name;?>" required>
                <span class="invalid-feedback"><?php echo $name_err; ?></span>
            </div>
            <div class="form-group">
                <label>Birthday (YYYY-MM-DD)</label>
                <input type="date" name="birthday" class="form-control" style="width:20%; text-align:center; margin-left:auto; margin-right:auto;" <?php echo (!empty($birthday_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $birthday; ?>" required>
                <span class="invalid-feedback"><?php echo $birthday_err; ?></span>
            </div>
            <div class="form-group">
                <label>Sex</label>
                <select type="text" name="gender" class="form-control" style="width:20%; text-align:center; margin-left:auto; margin-right:auto;">
                <?php
                    $values = array("M", "F");
                    foreach ($values as $value) {
                        if ($value == $gender) {
                        echo('<option selected="selected" value='.$value.'>'.$value.'</option>');
                        }
                        else{
                        echo('<option value='.$value.'>'.$value.'</option>');
                        }
                }
                ?>
                </select>
            </div>
            <div class="form-group">
                <label>Activity Level</label>
                <select type="text" name="activity_level" class="form-control" style="width:20%; text-align:center; margin-left:auto; margin-right:auto;">
                <?php
                    $values = array("1", "2", "3");
                    foreach ($values as $value) {
                        if ($value == $activity_level) {
                        echo('<option selected="selected" value='.$value.'>'.$value.'</option>');
                        }
                        else{
                        echo('<option value='.$value.'>'.$value.'</option>');
                        }
                }
                ?>
                </select>
            </div>
            <div class="form-group">
                <label>Recommended Calorie Intake </label>
                <input type="text" name="recommended_calories" class="form-control" style="width:20%; text-align:center; margin-left:auto; margin-right:auto;" value="<?php echo $recommended_calories; ?>" readonly>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Update">
            </div>
        </form>
    <?php

    ?>
    <p>
    </p>
</body>
</html>
