<?php
    // Initialize the session
    session_start();

    // Check if the user is logged in, if not then redirect him to login page
    if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
        header("location: login.php");
        exit;

    }

    require_once "config.php";

    $type = $_POST["type"];
    $details = $_POST["details"];
    mysqli_begin_transaction($conn);
    try {
        // Prepare an insert statement
        $sql1 = "INSERT INTO goals(type, details) VALUES (?, ?)";
        if($stmt1 = mysqli_prepare($conn, $sql1)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt1, "ss", $param_type, $param_details);
            // Set parameters
            $param_type = $type;
            $param_details = $details;

            // Attempt to execute the prepared statement
            mysqli_stmt_execute($stmt1);
            mysqli_stmt_close($stmt1);
        }

        $sql2 = "INSERT INTO has_goals(username, goal_id) VALUES (?, LAST_INSERT_ID())";
        if($stmt2 = mysqli_prepare($conn, $sql2)){
            $param_username = $_SESSION["username"];
            mysqli_stmt_bind_param($stmt2, "s", $param_username);

            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt2)){
                header("location: goals.php");
            } else{
                echo "Oops! Something went wrong. Please try again later.";
            }
            mysqli_stmt_close($stmt2);
        }
        mysqli_commit($conn);
    } catch (mysqli_sql_exception $exception) {
        mysqli_rollback($conn);
        throw $exception;
    }

    // Close connection
    mysqli_close($conn);
?>
