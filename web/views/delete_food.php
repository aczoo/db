<?php
    // Initialize the session
    session_start();

    // Check if the user is logged in, if not then redirect him to login page
    if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
        header("location: login.php");
        exit;

    }

    require_once "config.php";

    $entry_id = $_POST["entry_id"];
    $sql = "DELETE FROM food WHERE entry_id = ?";
    if($stmt = mysqli_prepare($conn, $sql)){
        // Bind variables to the prepared statement as parameters
        mysqli_stmt_bind_param($stmt, "i", $param_id);
        // Set parameters
        $param_id = $entry_id;
        // Attempt to execute the prepared statement
        if(mysqli_stmt_execute($stmt)){
            header("location: food.php");
        } else{
            echo "Oops! Something went wrong. Please try again later.";
        }
        mysqli_stmt_close($stmt);
    }
    // Close connection
    mysqli_close($conn);
?>
