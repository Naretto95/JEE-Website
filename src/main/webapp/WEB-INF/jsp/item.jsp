<%@page import="java.util.Base64"%>
<%@page import="model.User"%>
<%@page import="model.Produit"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
 
<!-- Content -->
<div class="content">
<% Produit produit = ((Produit) session.getAttribute("produit")); %>

<!-- About -->
  <section class="content-section bg-light" id="about">
    <div class="container">
      <div class="row justify-content-center">       
        <div class="col-lg-9">

            <div class="card mt-4">
            <%
            String encode="";
            if (produit.getImage()!=null){
                encode = produit.getImage();
            }
            if(encode!="" && encode!=null){
            %>
          	<img class="card-img-top" src="<%=encode %>"   width="900" height="400" alt="Card image cap">
          	<%}else{ %>
            <img class="card-img-top img-fluid" src="http://placehold.it/900x400" alt="">
          	<%} %>
            <div class="card-body">
                <h3 class="card-title"><%=produit.getTitre()%></h3>
                <h4>$<%=produit.getPrix()%></h4>
                <p class="card-text text-left"><%=produit.getDescription() %></p>
                <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
                4.0 stars
            </div>
            </div>
            <div style="display:inline-flex;">
            <form method="POST" action="/addProduit">
            <button type="submit" class=" animated fadeIn btn btn-primary" style="margin: 1rem;">Ajouter au panier</button>
			</form>
            <% if (session.getAttribute("user")!=null && ((User)session.getAttribute("user")).getAdmin()==1){ %>
            <form method="POST" action="/deleteProduit">
            <button type="submit" class=" animated fadeIn btn btn-dark" style="margin: 1rem;">Supprimer le produit</button>
            </form>
			<% } %>
			</div>
        </div>
        <!-- /.col-lg-9 -->
      </div>
    </div>
  </section>


 
  <!-- retour -->
  <a class="animated fadeInLeft btn btn-primary btn-customized " href="/getAllProduit" id="side2">
    <i class="fas fa-arrow-left"></i> <span>Retour</span>
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