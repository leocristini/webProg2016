<!--

TODO: 
- mettere jsp di "se connesso mostra nome utente se no mostra login"
- mettere logo
- sistemare barra ricerca
- mettere mappa sotto
- mettere 5 migliori ristoranti nelle vicinanze

-->
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


	<link rel="stylesheet" href="media/css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="media/css/style.css"> <!-- Gem style -->
	<script src="media/js/modernizr.js"></script> <!-- Modernizr -->
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>EATitHere</title>
    </head>
    <body>
        <!-- navbar con logo a sinistra e a destra i tasti per pop-up login / registrazione-->
    	<nav class="navbar navbar-custom">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.html">
                        <!-- TODO : mettere logo-->
		       	<img alt="Brand" src="...">
                    </a>
		</div>
                <nav class="main-nav">
                    <ul>
                    <!-- inser more links here -->
			<li><a class="cd-signin" href="#0">Sign in</a></li>
			<li><a class="cd-signup" href="#0">Sign up</a></li>
                    </ul>
		</nav>
            </div>
    	</nav>
        
        <div class="cd-user-modal">
            <div class="cd-user-modal-container">
                <ul class="cd-switcher">
                    <li><a class="cd-signup" href="#0">Sign in</a></li>
                    <li><a class="cd-signup" href="#0">Sign up</a></li>
                </ul>
                
                <div id="cd-login">  <!-- login form -->
                    <form class="cd-form" action="LoginServlet" method="POST">
                        <p class="fieldset">
                            <label class="image-replace cd-email" for="signin-email">E-mail</label>
                            <input class="full-width has-padding has-border" id="signin-email" type="email" name="username" placeholder="E-mail / Username">
                            <span class="cd-error-message">Error message here!</span>
                        </p>
                        <p class="fieldset">
                            <label class="image-replace cd-password" for="signin-password">Password</label>
                            <input class="full-width has-padding has-border" id="signin-password" type="password" name="password" placeholder="Password">
                            <a href="#0" class="hide-password">Show</a>
                            <span class="cd-error-message">Error message here!</span>
                        </p>
                        <p class="fieldset">
                            <input type="checkbox" id="remember-me" checked>
                            <label for="remember-me">Remember me</label>
                        </p>
                        <p class="fieldset">
                            <input class="full-width" type="submit" value="Login">
                        </p>
                    </form>
                    <p class="cd-form-bottom-message"><a href="#0">Forgot your password?</a></p>
                    
                    <a href="#0" class="cd-close-form">Close</a>
                </div>  <!-- chiudo login div -->
                
                <div id="cd-signup"> <!-- resgister form -->
                    <form class="cd-form">
                        <p class="fieldset">
                            <label class="image-replace cd-username" for="signup-username">Username</label>
                            <input class="full-width has-padding has-border" id="signup-username" type="text" placeholder="Username" name="username">
                            <span class="cd-error-message">Error message here!</span>
                        </p>
                        
                        <p class="fieldset">
                            <label class="image-replace cd-username" for="signup-name">First Name</label>
                            <input class="full-width has-padding has-border" id="signup-name" type="text" placeholder="First Name" name="firstname">
                            <span class="cd-error-message">Error message here!</span>
                        </p>
                        
                        <p class="fieldset">
                            <label class="image-replace cd-username" for="signup-surname">Last Name</label>
                            <input class="full-width has-padding has-border" id="signup-surname" type="email" placeholder="Last Name" name="lastname">
                            <span class="cd-error-message">Error message here!</span>
                        </p>
                        
                        <p class="fieldset">
                            <label class="image-replace cd-email" for="signup-email">E-mail</label>
                            <input class="full-width has-padding has-border" id="signup-email" type="email" placeholder="E-mail" name="email">
                            <span class="cd-error-message">Error message here!</span>
                        </p>

                        <p class="fieldset">
                            <label class="image-replace cd-password" for="signup-password">Password</label>
                            <input class="full-width has-padding has-border" id="signup-password" type="text"  placeholder="Password" name="password">
                            <a href="#0" class="hide-password">Hide</a>
                            <span class="cd-error-message">Error message here!</span>
                        </p>

                        <p class="fieldset">
                            <input type="checkbox" id="accept-terms">
                            <label for="accept-terms">I agree to the <a href="#0">Terms</a></label>
                        </p>

                        <p class="fieldset">
                            <input class="full-width has-padding" type="submit" value="Create account">
                        </p>
                    </form>
                    <a href="#0" class="cd-close-form">Close</a>
                </div> <!-- chiudo register form -->
                
                
                <div id="cd-reset-password"> <!-- reset password form -->
                    <p class="cd-form-message">Lost your password? Please enter your email address. You will receive a link to create a new password.</p>

                    <form class="cd-form">
			<p class="fieldset">
                            <label class="image-replace cd-email" for="reset-email">E-mail</label>
                            <input class="full-width has-padding has-border" id="reset-email" type="email" placeholder="E-mail">
                            <span class="cd-error-message">Error message here!</span>
			</p>

			<p class="fieldset">
                            <input class="full-width has-padding" type="submit" value="Reset password">
			</p>
                    </form>

                    <p class="cd-form-bottom-message"><a href="#0">Back to log-in</a></p>
                    
		</div> <!-- cd-reset-password -->
		<a href="#0" class="cd-close-form">Close</a>

            </div>
        </div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="media/js/main.js"></script> <!-- Gem jQuery -->
        
        <!-- questo mostra il campo di ricerca -->
        <div class="jumbotron">
            <div class="container">
                <h1>Find the best restourant</h1>
                <!-- 
                Questo form è quello che manda alla servlet che maneggia tutto
                il luogo da cercare e il ristorante
                id Luogo == location
                id ristorante == 
                -->
                <form action="getSwag" method="POST">
                    <div class="form-group">
                        <label for="search">Where you want to eat?</label>
                        <div class="row"
                            <div class="col-lg-6">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Where?">
                                    <span class="input-group-btn">
                                        <button class="btn btn-secondary" type="button">Go!</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            </div>
        </div>
        
        
    </body>
</html>
