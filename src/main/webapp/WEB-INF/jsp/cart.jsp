<%@page import="model.User"%>
<%@page import="model.LigneCommande"%>
<%@ page language="java" import="model.Commande" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
          <h3><a href="/focusOnCommande">
          </a></h3>
      </div>

      <ul class="list-unstyled menu-elements">
          <li>
              <a class="scroll-link js-scroll-trigger" href="/"><i class="fas fa-home"></i>Home</a>
          </li>
          <% User user = (User)session.getAttribute("user"); if (user==null){%>
          <li>
              <a class="scroll-link js-scroll-trigger" href="/login"><i class="fas fa-user"></i>Connexion / Inscription</a>
          </li>
          <%} %>
          <li class="active">
            <a class="scroll-link js-scroll-trigger" href="#panier"><i class="fas fa-shopping-cart"></i>Panier</a>
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


<!-- About -->
<form action="/saveTheCommande" method="POST">
  <section class="content-section bg-light" id="panier">
    <div class="container text-center">
      <div class="row justify-content-center">
           <!--Section: Block Content-->
        <section>

            <!--Grid row-->
            <div class="row">
  
              <!--Grid column-->
              <div class="col-lg-8">
  
                <!-- Card -->
                <div class="card wish-list mb-3">
                  <div class="card-body">
  
                    <h5 class="mb-4">Panier (<span><%= ((Commande) session.getAttribute("commande")).getLigneCommandes().size() %></span> produits)</h5>
  					
  					<% 
  					int i=-1;
  					double somme;
  					double montant=0;
  					for (LigneCommande lc: ((Commande) session.getAttribute("commande")).getLigneCommandes()) {
  						i++;
  						somme=lc.getProduit().getPrix()*((double)lc.getQuantite());
  						montant+=Math.round(somme*100.0)/100.0;
  						
  					%>
                    <div class="row mb-4">
                      <div class="col-md-5 col-lg-3 col-xl-3">
                        <div class="view zoom overlay z-depth-1 rounded mb-3 mb-md-0">
                          <img class="img-fluid w-100"
                            src="<%=lc.getProduit().getImage() %>" alt="Sample">
                        </div>
                      </div>
                      <div class="col-md-7 col-lg-9 col-xl-9">
                        <div>
                          <div class="d-flex justify-content-between">
                            <div>
                              <h5><%= lc.getProduit().getTitre()%></h5>
                            </div>
                            <div>
                              <div class="def-number-input number-input safari_only mb-0 w-100">
                                <button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"
                                  class="minus"></button>
                                <input class="quantity" min="0" name="<%=i%>" value="<%= lc.getQuantite() %>" type="number">
                                <button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
                                  class="plus"></button>
                              </div>
                              <small id="passwordHelpBlock" class="form-text text-muted text-center">
                                (Nombre de pièces)
                              </small>
                            </div>
                          </div>
                          <div class="d-flex justify-content-between align-items-center">
                            <div>
                              <a href="/removeLigne?numLigne=<%=i%>" type="button" class="card-link-secondary small text-uppercase mr-3"><i
                                  class="fas fa-trash-alt mr-1"></i> Supprimer le produit </a>
                            </div>
                            <p class="mb-0"><span><strong><%=Math.round(somme*100.0)/100.0 %> €</strong></span></p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <hr class="mb-4">
                    <%} %>
                    
  
                  </div>
                </div>
                <!-- Card -->
  
                <!-- Card -->
                <div class="card mb-3">
                  <div class="card-body">
  
                    <h5 class="mb-4">options de paiement</h5>
  
                    <img class="mr-2" width="45px"
                      src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
                      alt="Visa">
                    <img class="mr-2" width="45px"
                      src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"
                      alt="American Express">
                    <img class="mr-2" width="45px"
                      src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
                      alt="Mastercard">
                  </div>
                </div>
                <!-- Card -->
  
              </div>
              <!--Grid column-->
  
              <!--Grid column-->
              <div class="col-lg-4">
  
                <!-- Card -->
                <div class="card mb-3" style="width: 18rem;">
                  <div class="card-body">
  
                    <h5 class="mb-3">Total</h5>
  
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                        Montant temporaire
                        <span><%= montant %> €</span>
                      </li>
                      <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                        Livraison
                        <span>Gratuit</span>
                      </li>
                      <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                        <div>
                          <strong>Montant total</strong>
                          <strong>
                            <p class="mb-0">(Avec TVA)</p>
                          </strong>
                        </div>
                        <span><strong><%= Math.round(100.0*montant*1.2)/100.0 %> €</strong></span>
                      </li>
                    </ul>
  
                    <button type="button" class="btn btn-primary btn-block waves-effect waves-light">Paiement</button>
                    <% if (user!=null){ %>
                    <button type="submit" onclick="alert('Votre panier a été correctement sauvegardé');" class="btn btn-dark btn-block waves-effect waves-light">Sauvegarder mon panier</button>
  					<% } %>
                  </div>
                </div>
                <!-- Card -->
  
              </div>
              <!--Grid column-->
  
            </div>
            <!--Grid row-->
  
          </section>
          <!--Section: Block Content-->
  
      </div>
    </div>
  </section>
</form>

 
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