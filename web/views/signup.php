<?php
// Initialize the session
session_start();

// Check if the user is already logged in, if yes then redirect him to welcome page
if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
    header("location: welcome.php");
    exit;
}
require_once "config.php";
// Define variables and initialize with empty values
$username = $password = $confirm_password = $name = $birthday = $gender = "";
$activity_level = 1;
$username_err = $password_err = $confirm_password_err = $name_err = $birthday_err = "";
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){

    // Validate username
    if(empty(trim($_POST["username"]))){
        $username_err = "Please enter a username.";
    } elseif(!preg_match('/^[a-zA-Z0-9_]+$/', trim($_POST["username"]))){
        $username_err = "Username can only contain letters, numbers, and underscores.";
    } else{
        // Prepare a select statement
        $sql = "SELECT name FROM user WHERE username = ?";

        if($stmt = mysqli_prepare($conn, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "s", $param_username);

            // Set parameters
            $param_username = trim($_POST["username"]);

            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                /* store result */
                mysqli_stmt_store_result($stmt);

                if(mysqli_stmt_num_rows($stmt) == 1){
                    $username_err = "This username is already taken.";
                } else{
                    $username = trim($_POST["username"]);
                }
            } else{
                echo "Oops! Something went wrong. Please try again later.";
            }

            // Close statement
            mysqli_stmt_close($stmt);
        }
    }

    // Validate password
    if(empty(trim($_POST["password"]))){
        $password_err = "Please enter a password.";
    } elseif(strlen(trim($_POST["password"])) < 6){
        $password_err = "Password must have atleast 6 characters.";
    } else{
        $password = trim($_POST["password"]);
    }

    // Validate confirm password
    if(empty(trim($_POST["confirm_password"]))){
        $confirm_password_err = "Please confirm password.";
    } else{
        $confirm_password = trim($_POST["confirm_password"]);
        if(empty($password_err) && ($password != $confirm_password)){
            $confirm_password_err = "Password did not match.";
        }
    }
    // Validate name
    if(empty(trim($_POST["name"]))){
        $name_err = "Please enter a name.";
    }else{
        $name = trim($_POST["name"]);
    }

    // Validate birthday
    if(empty(trim($_POST["birthday"]))){
        $birthday_err = "Please enter a birthday.";
    } else{
        $birthday = trim($_POST["birthday"]);
        if(strlen($birthday)!=10 || $birthday[4] !='-' || $birthday[7] != '-'){
            $birthday_err = "Please follow the format YYYY-MM-DD.";
        }
        }
    // Validate gender
    if(empty(trim($_POST["gender"]))){
        $gender = "M";
    }else{
        $gender = trim($_POST["gender"]);

    }

    // Check input errors before inserting in database
    if(empty($username_err) && empty($password_err) && empty($confirm_password_err)&& empty($name_err)&& empty($birthday_err)){

        // Prepare an insert statement
        $sql1 = "INSERT INTO login_credentials(username, password) VALUES (?, ?)";
        $sql2 = "INSERT INTO user (username, name, activity_level, gender, birthday) VALUES (?, ?, ?, ?, ?)";

        if(($stmt1 = mysqli_prepare($conn, $sql1)) && ($stmt2 = mysqli_prepare($conn, $sql2))){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt1, "ss", $param_username, $param_password);
            mysqli_stmt_bind_param($stmt2, "ssiss", $param_username, $param_name, $param_activity_level, $param_gender, $param_birthday);
            // Set parameters
            $param_username = $username;
            $param_password = password_hash($password, PASSWORD_DEFAULT); // Creates a password hash
            $param_name = $name;
            $param_activity_level = $activity_level;
            $param_gender = $gender;
            $param_birthday = $birthday;

            // Attempt to execute the prepared statement
            if((mysqli_stmt_execute($stmt2)) && (mysqli_stmt_execute($stmt1))){
                // Redirect to login page
                header("location: login.php");

            } else{
                echo "Oops! Something went wrong. Please try again later.";
            }

            // Close statement
            mysqli_stmt_close($stmt1);
            mysqli_stmt_close($stmt2);

        }
    }

    // Close connection
   mysqli_close($conn);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body{ font: 14px sans-serif; }
        .wrapper{ width: 360px; padding: 20px; }
    </style>
</head>
<body>
    <div class="wrapper">
        <h2>Sign Up</h2>
        <p>Please fill this form to create an account.</p>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" class="form-control <?php echo (!empty($username_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $username; ?>" required>
                <span class="invalid-feedback"><?php echo $username_err; ?></span>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" class="form-control <?php echo (!empty($password_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $password; ?>" required>
                <span class="invalid-feedback"><?php echo $password_err; ?></span>
            </div>
            <div class="form-group">
                <label>Confirm Password</label>
                <input type="password" name="confirm_password" class="form-control <?php echo (!empty($confirm_password_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $confirm_password; ?>" required>
                <span class="invalid-feedback"><?php echo $confirm_password_err; ?></span>
            </div>
            <div class="form-group">
                <label>Name</label>
                <input type="text" name="name" class="form-control <?php echo (!empty($name_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $name; ?>" required>
                <span class="invalid-feedback"><?php echo $name_err; ?></span>
            </div>
            <div class="form-group">
                <label>Birthday</label>
                <input type="date" name="birthday" class="form-control <?php echo (!empty($birthday_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $birthday; ?>" required>
                <span class="invalid-feedback"><?php echo $birthday_err; ?></span>
            </div>
            <div class="form-group">
                <label>Sex</label>
                <select type="text" name="gender" class="form-control">
                <option value="M">M</option>
                <option value="F">F</option>
                </select>
            </div>   
            <div class="form-group">
                <label>Activity Level</label>
                <select type="text" name="activity_level" class="form-control">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                </select>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Submit">
                <input type="reset" class="btn btn-secondary ml-2" value="Reset">
            </div>
            <p>Already have an account? <a href="login.php">Login here</a>.</p>
        </form>
    </div>
</body>
</html>
