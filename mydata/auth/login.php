<?php
// Database credentials
$host = 'localhost'; // or your database host/IP
$dbname = 'mydata';
$username = 'root';
$pass = '';

// DSN (Data Source Name)
$dsn = "mysql:host=$host;dbname=$dbname";

try {
    // Create a PDO instance
    $pdo = new PDO($dsn, $username, $pass);

    // Set PDO to throw exceptions on error
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Check if form is submitted
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Validate form data
        //$email = $_POST['email'];
        //$password = $_POST['password'];   
        $email = 'fadi@gmail.com';
        $password = 'fadi2024';

        // Prepare SQL statement to fetch user with given email
        $stmt = $pdo->prepare("SELECT * FROM users WHERE email = ?");
        $stmt->execute([$email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        // Check if user with the provided email exists
        if ($user) {
            // User exists, verify password
            if (password_verify($password, $user['password'])) {
                // Password is correct, login successful
                echo "Login successful";
            } else {
                // Invalid password
                echo "Invalid password";
            }
        } else {
            // No user found with the provided email
            echo "No user found with the provided email";
        }
    }
} catch (PDOException $e) {
    // If an error occurs, catch the PDOException and handle it
    echo "Connection failed: " . $e->getMessage();
}

