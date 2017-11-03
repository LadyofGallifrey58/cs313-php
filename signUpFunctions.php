<?php

session_start();

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$dbUrl = getenv('DATABASE_URL');

if (empty($dbUrl)) {
   $dbUrl = "postgres://postgres:password@localhost:5432/mydb";
}

$dbopts = parse_url($dbUrl);

$dbHost = $dbopts["host"];
$dbPort = $dbopts["port"];
$dbUser = $dbopts["user"];
$dbPassword = $dbopts["pass"];
$dbName = ltrim($dbopts["path"], '/');

try
{
   $db = new PDO("pgsql:host=$dbHost;port=$dbPort;dbname=$dbName", $dbUser, $dbPassword);

   $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch (PDOException $ex)
{
   echo "<p>error: " . $ex->getMessage() . " </p>\n\n";
   die();
}
?>




<?php
$newUserEmail = $_REQUEST['newUserEmail'];


if (isset($newUserEmail))
{
   $statement = $db->prepare('SELECT email FROM accounts WHERE email =:email');
   $statement->bindValue(':email', $newUserEmail, PDO::PARAM_STR);
   $statement->execute();
   $result = $statement->fetch(PDO::FETCH_ASSOC);
   if ($result['email'])
   {
      echo "Email is already in use";
   }
   else if (!$result['email'])
   {
      echo "email is available";
   }
   else
   {
      echo "Required information";
   }
}

?>

<?php
$newFirstName = $_REQUEST['newFirstName'];
$newLastName = $_REQUEST['newLastName'];
$newUserEmail = $_REQUEST['newUserEmail'];
$newUserPassword = password_hash($REQUEST['newUserPassword'], PASSWORD_DEFAULT);

$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

if (isset($newUserEmail) && isset($newFirstName) && isset($newLastName) && isset($newUserPassword))
{
   try {
      $statement = $db->prepare('INSERT INTO accounts (first_name, last_name, email) VALUES (:first_name, :last_name, :email)');
      $statement->bindParam(':first_name', $newFirstName);
      $statement->bindParam(':last_name', $newLastName);
      $statement->bindParam(':email', $newUserEmail);
      
      statement->execute();

      $statement = $db->prepare('INSERT INTO passwords(password) VALUES (:password)');
      $statement->bindParam(':password', $newUserPassword);
      
      statement->execute();
   }
   catch (PDOException $e) {
      echo "Error: " . $e->getMessage();
   }
}
?>