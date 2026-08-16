<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <h3><a href="/">
          </a></h3>
      </div>

      <ul class="list-unstyled menu-elements">
          <li class="active">
              <a class="scroll-link js-scroll-trigger" href="#top-content"><i class="fas fa-home"></i>Home</a>
          </li>
          <% User user = (User)session.getAttribute("user"); if (user==null){%>
          <li>
              <a class="scroll-link js-scroll-trigger" href="/login"><i class="fas fa-user"></i>Connexion / Inscription</a>
          </li>
          <%} %>
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
        
        <% if (user!=null){%>
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

  <!-- Header -->
  <header class="masthead d-flex" id="top-content">
    <div class="animated fadeIn container text-center my-auto slow">
      <h1 class="mb-1">EISTI  <a class="nom">E-Commerce</a></h1>
      <h3 class="mb-5">
        <em>L'e-commerce des eistiens</em>
      </h3>
      <a class="btn btn-primary btn-xl js-scroll-trigger" href="#about">En savoir plus</a>
    </div>
  </header>

<!-- About -->
  <section class="content-section bg-light" id="about">
    <div class="container text-center">
      <div class="row">
        <div class="col-lg-10 mx-auto">
          <h2>À Propos</h2>
          <p class="lead mb-5">
          EISTI E-commerce est une plateforme de commerce pour les eistiens, par les eistiens, vous y trouverez divers produits utiles à la vie d'un eistien.</p>
          <a class="animated fadeInUp wow btn btn-dark btn-xl js-scroll-trigger" href="/login">Connexion / Inscription</a>
          <a class="animated fadeInUp wow btn btn-xl btn-primary js-scroll-trigger" href="/getAllProduit">Nos articles</a>
        </div>
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
