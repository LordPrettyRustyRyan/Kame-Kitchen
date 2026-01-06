<?php
$conn = new mysqli("localhost", "root", "mysql", "kame_recipes");

if ($conn->connect_error) {
    die("DB Connection failed: " . $conn->connect_error);
}
?>
