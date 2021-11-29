<?php
    // Initialize the session
    session_start();

    // Check if the user is logged in, if not then redirect him to login page
    if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
        header("location: login.php");
        exit;

    }

    require_once "config.php";

    // Validate food
    if(empty(trim($_POST["food"]))){
        $food_err = "Please enter a food item.";
    }else{
        $food = trim($_POST["food"]);
    }

    // Validate quantity
    if(empty($_POST["quantity"])){
        $quantity_err = "Please enter a quantity.";
    }else{
        $quantity = $_POST["quantity"];
    }

    // Validate quantity
    if(empty($_POST["calories"])){
        $calories_err = "Please enter calories.";
    }else{
        $calories = $_POST["calories"];
    }

    $today = date("Y-m-d");
    mysqli_begin_transaction($conn);
    try {
        if(empty($food_err) && empty($quantity_err) && empty($calories_err)){
            // Prepare an insert statement
            $sql1 = "INSERT INTO food(food_item, date, quantity, calories) VALUES (?, ?, ?, ?)";
            if($stmt1 = mysqli_prepare($conn, $sql1)){
                // Bind variables to the prepared statement as parameters
                mysqli_stmt_bind_param($stmt1, "ssii", $param_food, $param_date, $param_quantity, $param_calories);
                // Set parameters
                $param_food = $food;
                $param_date = $today;
                $param_quantity = $quantity;
                $param_calories = $calories;

                // Attempt to execute the prepared statement
                mysqli_stmt_execute($stmt1);
                mysqli_stmt_close($stmt1);
            }

            $sql2 = "INSERT INTO consumes(username, entry_id) VALUES (?, LAST_INSERT_ID())";
            if($stmt2 = mysqli_prepare($conn, $sql2)){
                $param_username = $_SESSION["username"];
                mysqli_stmt_bind_param($stmt2, "s", $param_username);

                // Attempt to execute the prepared statement
                if(mysqli_stmt_execute($stmt2)){
                    header("location: food.php");
                } else{
                    echo "Oops! Something went wrong. Please try again later.";
                }
                mysqli_stmt_close($stmt2);
            }
        }

        mysqli_commit($conn);
    } catch (mysqli_sql_exception $exception) {
        mysqli_rollback($conn);
        throw $exception;
    }

    // Close connection
    mysqli_close($conn);
?>
