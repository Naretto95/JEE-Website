<%@page import="java.io.File"%>
<%@page import="model.User"%>
<%@page import="model.Produit"%>
<%@ page import="java.util.ArrayList" %>
<%@page import="enumeration.Categorie"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
          <h3><a href="/store">
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
          <li>
            <a class="scroll-link js-scroll-trigger" href="/focusOnCommande"><i class="fas fa-shopping-cart"></i>Panier</a>
        </li>
        <li class="active">
            <a href="#otherSections2" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle" role="button" aria-controls="otherSections">
                <i class="fas fa-sync"></i>Les articles
            </a>
            <ul class="collapse list-unstyled" id="otherSections2">
            	
         		<c:forEach items="<%= Categorie.values() %>" var="categorie">
                <li>
                    <a class="scroll-link js-scroll-trigger" href="#cat${categorie.ordinal() }">${categorie.toString()}</a>
                </li>
                </c:forEach>
            </ul>
        </li>
          
          <li>
          <a class="scroll-link js-scroll-trigger" href="/profile"><i class="fas fa-address-book"></i>Mon profile</a>
      </li>
          <li>
            <a class="scroll-link js-scroll-trigger" href="/contact"><i class="fas fa-envelope"></i> Contact</a>
        </li>
        <%  if (user!=null){%>
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
  <section class="content-section bg-light" id="debut">
    <div class="container text-center">
      <div class="row">
        <div class="col-lg-10 mx-auto">
          <h2>Les Articles</h2>
          <p class="lead mb-5">
          Découvrez notre catalogue de produits hors du commun !</p>
          <%String fade="";for (Categorie cat :Categorie.values()){ 
        		switch(cat.ordinal()%4){case 0:fade="fadeInLeft";break;case 1:fade="fadeInUp";break;case 2:fade="fadeInUp";break;case 3:fade="fadeInRight";break;default:break;}
        	 %>
          <a class="animated <%=fade %> wow btn btn-dark btn-xl js-scroll-trigger" href="#cat<%=cat.ordinal()%>"><%=cat.toString() %></a>
          <!-- 
          <a class="animated fadeInUp wow btn btn-xl btn-primary js-scroll-trigger" href="#cat2">Catégorie 2</a>
          <a class="animated fadeInRight wow btn btn-xl btn-dark js-scroll-trigger" href="#cat3">Catégorie 3</a>
          -->
          <%} %>
        </div>
      </div>
    </div>
  </section>


<!-- Catégories-->
<% String textcolor;String text="";String bg;for (Categorie cat :Categorie.values()){ 
	switch(cat.ordinal()%3){case 0:text="text-right";break;case 1:text="text-center";break;case 2:text="text-left";break;default:break;}
	bg=cat.ordinal()%2==0 ? "bg-primary" : "bg-light";
	textcolor=cat.ordinal()%2==0 ? "text-white":"";
%>

<section class="content-section <%=bg %>" id="cat<%=String.valueOf(cat.ordinal()) %>">
    <div class="container text-left">
      <div class="row justify-content-center">
        <div class="col-lg-10 mx-auto <%=textcolor%> <%=text%> ">
          <h2><%=cat.toString() %></h2>
          <p class="lead mb-5">
          <%=cat.getValue() %></p>
        </div>
        <%String encode="";
        for(Produit produit : ((ArrayList<Produit>)session.getAttribute("produits")) ){ 
        	if(produit.getCategorie().toString()==cat.toString() && produit.getDisponibleEnVente()==1){%>
        <div class="card" style="width: 12rem; margin: 0.5rem;">
            <div class="card-body" style="padding: 0;">
            <%
            if (produit.getImage()!=null){
                encode = produit.getImage();
            }
            if(encode!="" && encode!=null){
            %>
          	<img class="card-img-top" src="<%=encode %>"  width="286" height="180" alt="Card image cap"/>
          	<%}else{ %>
          	<img class="card-img-top" src="img/sample.svg"  alt="Card image cap"/>
          	<%} %>
          	<div style="padding: 1rem;">
          		<h5 class="card-title"><%=produit.getTitre() %></h5>
          		<%if (produit.getDescription().length() >= 50){ %>
              <p class="card-text "><%=produit.getDescription().substring(0,50)+"..."%></p>
              <%}else{ %>
              <p class="card-text"><%=produit.getDescription()%></p>
              <%} %>
              <a href="/showProduit?id=<%=produit.getId()%>" class="btn btn-primary">consulter</a>
            </div>
            </div>
         </div>
         <%}} %>
      </div>
    </div>
  </section>
          <%} %>
   <% if (user !=null && user.getAdmin()==1){ %>
  <!-- Call to Action -->
   <form id ="contact-form" name="contact-form" action="/insertProduit" method="POST"  enctype="multipart/form-data" onsubmit="return validateForm()">
         
    <section class="content-section bg-light " id="contact">
        <div class="container text-center">
          <section class="mb-4">
    	<div class="content-section-heading">
            <!--Section heading-->
            <h3 class="text-secondary mb-0">Administrateur</h3>
            <h2 class="mb-5">Ajouter un produit</h2>
            <!--Section description-->
            <p class="lead mb-5"></p>
          </div>
            <div class="row">
        
                <!--Grid column-->
                <div class="col-md-12 mb-md-0 mb-5">
                    
        
                        <!--Grid row-->
                        <div class="row">
        
                            <!--Grid column-->
                            <div class="col-md-6">
                                <div class="md-form mb-0">
                                <h5>Nom :</h5>
                                    <input type="text" id="name" name="titre" placeholder="Nom du produit" class="form-control">
                                </div>
                            </div>
                            <!--Grid column-->
	                        
	                        <!--Grid column-->
	                            <div class="col-md-6">
	                                <div class="md-form mb-0">
	                                <h5>Quantité :</h5>
	                                    <input type="number" id="subject" name="quantite" placeholder="La quantité disponible à la vente" class="form-control">
	                                </div>
	                            </div>
                        	<!--Grid column-->
        
        
                        </div>
                        <!--Grid row-->
                        
                        <div class="row">
	                        <!--Grid column-->
	                            <div class="col-md-6">
	                                <div class="md-form mb-0">
	                                <h5>Prix :</h5>
	                                    <input type="number" step=".01" id="subject" name="prix" placeholder="Le prix" class="form-control">
	                                </div>
	                            </div>
	                        <!--Grid column-->
	                        
                            <!--Grid column-->
                            <div class="col-md-6">
                                <div class="md-form mb-0">
                                <h5>Catégorie :</h5>
                                <select name="categorie" class="form-control">
                                	<%for(Categorie cat:Categorie.values()){ %>
                                	<option value=<%=cat.toString() %>><%=cat.toString() %></option>
                                	<%} %>
                                </select>
                                </div>
                            </div>
                            <!--Grid column-->
                        </div>
        
                        <!--Grid row-->
                        <div class="row">
        
                            <!--Grid column-->
                            <div class="col-md-12">
        
                                <div class="md-form">
                                <h5>Description :</h5>
                                    <textarea name="description" placeholder="Description du produit" rows="2" class="form-control md-textarea"></textarea>
                                </div>
        
                            </div>
                        </div>
                        <!--Grid row-->
                        
                         <!--Grid row-->
                        <div class="row">
        
                            <!--Grid column-->
                            <div class="col-md-12">
        
                                <div class="md-form">
                                <h5>Image :</h5>
                                    <input type="file" name="image" placeholder="Image" class="form-control md-textarea" accept="image/*"></input>
                                </div>
        
                            </div>
                        </div>
                        <!--Grid row-->
        
        
                    <div class="text-center text-md-left">
                        <button class="animated fadeInUp wow btn btn-dark " type="submit">Envoyer</button>
                        
                    </div>
                </div>
                <!--Grid column-->
        
            </div>
        </section>
        </div>
      </section>
        </form>

<%} %>
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
  <script>function validateForm() {
    formData = {
    	    'image'		:$('input[name=image]').val(),
            'categorie'     : $('select[name=categorie]').val(),
            'titre'		:$('input[name=titre]').val(),
            'prix'    : $('input[name=prix]').val(),
            'quantite'  : $('input[name=quantite]').val(),
            'description'  : $('textarea[name=description]').val()
    };


   $.ajax({
	content-type:"multipart/form-data,"
    url : "/insertProduit",
    type: "POST",
    data : formData,
    success: function(data, textStatus, jqXHR)
    {
        Location.reload();
        if (data.code) //If mail was sent successfully, reset the form.
        $('#contact-form').closest('form').find("input[type=text], textarea").val("");
    },
    error: function (jqXHR, textStatus, errorThrown)
    {
        alert(jqXHR);
    }
});
  }</script>
</body>

</html>
