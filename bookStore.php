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

<!DOCTYPE html>
<html>
<head>
   <title>Book Store</title>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">   
</head>
   <link rel="stylesheet" href="bookStore.css">

<body>

<?php
if ((!isset($_SESSION['userEmail']) && !isset($_SESSION['userPassword'])) && (isset($_POST['userEmail']) && isset($_POST['userPassword'])))
{
   $_SESSION['userEmail'] = filter_var($_POST['userEmail'], FILTER_SANITIZE_EMAIL);
   $_SESSION['userPassword'] = filter_var($_POST['userPassword'], FILTER_SANITIZE_STRING);

   $passwordHash = password_hash($_SESSION['userPassword'], PASSWORD_DEFAULT);
   $statement = $db->prepare('SELECT passwords.password, accounts.first_name, accounts.last_name FROM accounts, passwords WHERE accounts.password = passwords.password_id AND accounts.email=:email');
   $statement->bindValue(':email', $_SESSION['userEmail'], PDO::PARAM_STR);
   $result;

   $statement->execute();
   $result = $statement->fetch(PDO::FETCH_ASSOC);

   if (password_verify($result['password'], $passwordHash))
   {
      $_SESSION['first_name'] = $result['first_name'];
      $_SESSION['last_name'] = $result['last_name'];
   }
}
?>

   <div id="header">
      <?php
      if (!(isset($_SESSION['first_name']) && isset($_SESSION['last_name'])))
      { ?>
         <div class="dropdown headerButton">
            <button class="btn dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My Account</button>
            <div class="dropdown-menu">
               <form class="px-4 py-3">
                  <div class="form-group">
                     <label for="userEmail">Email address</label>
                     <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="email@example.com">
                  </div>
                  <div class="form-group">
                     <label for="userPassword">Password</label>
                     <input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="Password">
                  </div>
                  <div class="form-check">
                     <label class="form-check-label">
                     <input type="checkbox" class="form-check-input">
                     Remember me
                     </label>
                  </div>
                  <button type="submit" class="btn btn-primary">Sign in</button>
               </form>
            <div class="dropdown-divider"></div>
               <a class="dropdown-item" href="signUp.php">Sign up</a>
               <a class="dropdown-item" href="#">Forgot password?</a>
            </div>
         </div>
      <?php } 
      else { ?>
         <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
               My Account
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
               <h4><?php echo "Welcome, " . $_SESSION['first_name']?></h4>
               <div class="dropdown-divider"></div>
               <a class="dropdown-item" href="#">Account Info</a>
               <a class="dropdown-item" href="#">My Cart</a>
               <a class="dropdown-item" href="#"><?php echo "Not " . $_SESSION['first_name'] . "? Sign Out" ?></a>
            </div>
         </div>
<?php } ?>
           
      <form action="" method="post" class="headerButton">
      <div class="btn-group">
         <button type="submit" class="btn" id="choice" name="choice" value="author_id">Browse By</button>
         <button type="button" class="btn dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="sr-only">Toggle Dropdown</span>
         </button>
         <div class="dropdown-menu dropdown-menu-right">
            <h6 class="dropdown-header">Browse by:</h6>
            <button class="dropdown-item browse" type="button" name="browse" value="author_id">Author</button>
            <button class="dropdown-item browse" type="button" name="browse" value="book_name">Title</button>
            <button class="dropdown-item browse" type="button" name="browse" value="release_date">Release Date</button>
            <button class="dropdown-item browse" type="button" name="browse" value="price">Price</button> 
            <!— reverse order? —>
         </div>
      </div>
      </form>
   </div>


   <?php
   if (isset($_POST['choice']))
   {
      if ($_POST['choice'] == 'author_id')
      {
         $sort = '(authors.last_name, authors.first_name, authors.middle_name)';
      }
      else
      {
         $sort = $_POST['choice'];
      }
   }
   if (!isset($_POST['choice']))
   {
      $sort = '(authors.last_name, authors.first_name, authors.middle_name)'; //CHECK HERE
   }

   $statement = $db->prepare('SELECT authors.last_name, authors.first_name, authors.middle_name, books.book_name, books.price, books.release_date, books.picture_links, books.book_id FROM books LEFT OUTER JOIN books_authors ON books.book_id = books_authors.book_id LEFT OUTER JOIN authors ON authors.author_id = books_authors.author_id ORDER BY ' .  $sort . ', (authors.last_name, authors.first_name, authors.middle_name), books.book_name, books.release_date, books.price');

   $statement->execute();

   $card_count = 0;
   while($result = $statement->fetch(PDO::FETCH_ASSOC))
   { 
      if ($card_count == 0)
      {
         echo '<div class="card-deck">';
      }
  ?>   
      <div class="card" id=$result['book_id']>
         <img class="card-img-top" src="<?php echo $result['picture_links']?>">
         <h4 class="card-title text-center"><?php echo $result['book_name']; ?></h4>
         <p class="card-text">
            <?php
            echo '<span class="authorName">';
            echo $result['first_name'] . '&nbsp;';
            if ($result['middle_name']) { echo $result['middle_name'] . '&nbsp;';}
            echo $result['last_name'] . "</span><br/>";
            echo $result['price'] . "<br/>";
            echo $result['release_date'];
            ?>
         </p>
      </div>
      
      <?php
      $card_count++;
      if ($card_count == 3)
      {
         echo '</div>';
         $card_count = 0;
      }  
   }
   if ($card_count == 1 || $card_count == 2)
   {
   ?>
      <div class="card">
         <img class="card-img-top" src="">
         <h4 class="card-title text-center"></h4>
         <p class="card-text"></p>
      </div>
   <?php
   } 
   ?>


   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

   <script src="bookStore.js"></script>

  <!—for now —>
   <?php
   session_unset();
   session_destroy(); ?>
</body>
</html>

