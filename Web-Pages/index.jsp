<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="media/css/style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>EATitHere</title>
    </head>
    <body>
        
    	<nav class="navbar navbar-custom">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.html">
		       	<img alt="Brand" src="...">
                    </a>
		</div>
                <form class="navbar-form navbar-right " action="LoginServlet" method="POST" role="search">
                    <div class="form-group">
                      <input type="text" class="form-control" name="username" placeholder="Username">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control" name="password" placeholder="Password">
                    </div>
                    <button type="submit" class="btn btn-warning">Sign In</button>
                    <a class="btn btn-danger" href="#registration page">Register </a>
                </form>
            </div>
    	</nav>
    </body>
</html>

