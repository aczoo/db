<?php
    // Initialize the session
    session_start();

    // Check if the user is logged in, if not then redirect him to login page
    if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
        header("location: login.php");
        exit;

    }

    require_once "config.php";

    $sql = "INSERT INTO food(food_item, date, quantity, calories) VALUES (?, ?, ?, ?)";

    // Close connection
    mysqli_close($conn);
?>
