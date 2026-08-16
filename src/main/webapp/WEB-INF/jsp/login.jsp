<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="E-Commerce" content="">
  <meta name="Lilian Naretto" content="">

  <title>E-commerce</title>

  <!-- Bootstrap Core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
  <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link rel="stylesheet" href="css/style.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/animate.min.css" rel="stylesheet">
</head>

<body id="page-top">

  <!-- Wrapper -->
<div class="wrapper">
 
  <!-- Sidebar -->
  <nav class="sidebar">

      <!-- close sidebar menu -->
      <div class="dismiss">
          <i class="fas fa-arrow-left"></i>
      </div>

      <div class="logo">
          <h3><a href="/login">
          </a></h3>
      </div>

      <ul class="list-unstyled menu-elements">
          <li>
              <a class="scroll-link js-scroll-trigger" href="/"><i class="fas fa-home"></i>Home</a>
          </li>
          <li class="active">
              <a class="scroll-link js-scroll-trigger" href="/login"><i class="fas fa-user"></i>Connexion / Inscription</a>
          </li>
          <li>
            <a class="scroll-link js-scroll-trigger" href="/focusOnCommande"><i class="fas fa-shopping-cart"></i>Panier</a>
        </li>
        <li>
            <a class="scroll-link js-scroll-trigger" href="/getAllProduit"><i class="fas fa-tags"></i>Nos articles</a>
        </li>
          
          <li>
          <a class="scroll-link js-scroll-trigger" href="/profile"><i class="fas fa-address-book"></i>Mon profile</a>
      </li>
          <li>
            <a class="scroll-link js-scroll-trigger" href="/contact"><i class="fas fa-envelope"></i> Contact</a>
        </li>
        
        <% User user = (User)request.getSession(false).getAttribute("user"); if (user!=null){%>
        <li>
          <a class="scroll-link js-scroll-trigger" href="/disconnect"><i class="fas fa-sign-out-alt"></i>Se déconnecter</a>
      </li>
      <%} %>
      </ul>

      <div class="dark-light-buttons">
          <a class="btn btn-primary btn-customized-4 btn-customized-dark" href="#" role="button">Dark</a>
          <a class="btn btn-primary btn-customized-4 btn-customized-light" href="#" role="button">Light</a>
      </div>

  </nav>
  <!-- End sidebar -->
  
<!-- Content -->
<div class="content">
<!-- login -->
    <section class="content-section bg-light" id="login">
        <div class="container text-center">
          <div class="row justify-content-center">
            <form class="form-signin" style="margin: 3rem;" action="/getUser" method="POST">
                <h1 class="h3 mb-3 font-weight-normal">Se connecter</h1>
                <label for="inputEmail" class="sr-only">Adresse email</label>
                <input type="email" id="inputEmail" class="form-control" placeholder="Adresse email" name="email" required autofocus>
                <label for="inputPassword" class="sr-only">Mot de passe</label>
                <input type="password" id="inputPassword" class="form-control" placeholder="Mot de passe" name="mdp" required>
                <button class="animated fadeInLeft wow btn btn-lg btn-primary btn-block" type="submit">Connexion</button>
              </form>
            <form:form class="form-registration" style="margin: 3rem;" method="POST" action="/insertUser" modelAttribute="user">
                <h1 class="h3 mb-3 font-weight-normal">S'inscrire</h1>
                <label for="inputEmail" class="sr-only">Adresse email</label>
                <form:input type="email" id="inputEmail" class="form-control" placeholder="Adresse email" path="adresseMail" name="email" required="required" autofocus="autofocus" />
                <label for="inputPassword" class="sr-only">Mot de passe</label>
                <form:input path="mdp" type="password" name="pass" id="inputPassword" class="form-control" placeholder="Mot de passe" required="required" />
                <label for="inputPassword" class="sr-only">Confirmation mot de passe</label>
                <input type="password" id="inputconfirmPassword" class="form-control" placeholder="Confirmation mot de passe" required>
                <button class="animated fadeInRight wow btn btn-lg btn-dark btn-block" type="submit">Inscription</button>
              </form:form>
        </div>
    </div>
      </section>


 
  <!-- open sidebar menu -->
  <a class="animated fadeInLeft btn btn-primary btn-customized open-menu slow" href="#" role="button" id="side">
      <i class="fas fa-align-left"></i> <span>Menu</span>
  </a>

  <!-- Footer -->
  <footer class="footer text-center">
    <div class="container">
        <ul class="list-inline mb-5">
            <li class="list-inline-item">
              <a class="social-link rounded-circle text-white mr-3" href="" target="_blank">
                <i class="icon-social-facebook"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a class="social-link rounded-circle text-white" href="" target="_blank">
                <i class="icon-social-twitter"></i>
              </a>
            </li>
          </ul>
      <p class="text-muted small mb-0">Copyright &copy; Lilian Naretto 2021</p>
    </div>
  </footer>

</div>
<!-- End content -->
<a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
  <i class="fas fa-angle-up"></i>
</a>

</div>
<!-- End wrapper -->


  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts -->

  <script src="js/wow.js"></script>
  <script>new WOW().init();</script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/scripts.js"></script>
</body>

</html>
