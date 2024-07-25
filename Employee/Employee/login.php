<?php
session_start();
include 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM users WHERE username = '$username'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();

        echo password_verify($password, $row['password']);

        if ($password==$row['password']) {
            $_SESSION['username'] = $username;
            header("Location: index.php");
        } else {
            echo "Invalid password.";
        }
    } else {
        echo "No user found.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Login Page</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <div class="login_form">
    <!-- Login form container -->
    <form action="login.php" method="post">
      <h3>Log in with</h3>

      <!-- Email input box -->
      <div class="input_box">
        <label for="email">Email</label>
        <input type="email" id="email" name="username" placeholder="Enter email address" required />
      </div>

      <!-- Paswwrod input box -->
      <div class="input_box">
        <div class="password_title">
          <label for="password">Password</label>
        </div>

        <input type="password" id="password" name="password" placeholder="Enter your password" required />
      </div>

       <!-- Login button -->
      <button type="submit">Log In</button>

    </form>
  </div>
</body>
</html>