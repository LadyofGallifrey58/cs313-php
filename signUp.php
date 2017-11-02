<?php
session_start();
?>

<!DOCTYPE html>
<html>
<head>
   <title>Sign Up</title>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">   
   <link rel="stylesheet" href="bookStore.css">
</head>
<body>
   <form>
      <div class="form-row">
         <div class="form-group col-md-6">
            <label for="newFirstName">First Name</label>
            <input type="text" class="form-control" id="newFirstName" placeholder="John">
         </div>
         <div class="form-group col-md-6">
            <label for="newLastName">Last Name</label>
            <input type="text" class="form-control" id="newLast_name" placeholder="Smith">
         </div>
      </div>

      <div class="form-row">
         <div class="form-group col-md-6">
            <label for="newUserEmail">Email address</label>
            <input type="email" class="form-control" id="newUserEmail" aria-describedby="emailHelp" placeholder="Enter email" onfocusout="loadDoc('signUpFunctions.php', 'checkEmail', 'newUserEmail=document.getElementById(&quot;newUserEmail&quot;).val()')">
            <div class="small" id="nUEmailInvalid">
            </div>
         </div>
         <div class="form-group col-md-6">
            <label for="newUserPassword">Password</label>
            <input type="password" class="form-control" id="newUserPassword" placeholder="Password">
         </div>
      </div>
      <button type="submit" class="btn btn-primary">Sign Up!</button>
   </form>

   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

   <script src="bookStore.js"></script>
</body>
</html>