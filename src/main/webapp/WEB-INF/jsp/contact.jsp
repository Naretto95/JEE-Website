<%@page import="model.User"%>
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

  <!-- Wrapper -->
<div class="wrapper">
 
  <!-- Sidebar -->
  <nav class="sidebar">

      <!-- close sidebar menu -->
      <div class="dismiss">
          <i class="fas fa-arrow-left"></i>
      </div>

      <div class="logo">
          <h3><a href="/contact">
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
        <li>
            <a class="scroll-link js-scroll-trigger" href="/getAllProduit"><i class="fas fa-tags"></i>Nos articles</a>
        </li>
         
          <li>
          <a class="scroll-link js-scroll-trigger" href="/profile"><i class="fas fa-address-book"></i>Mon profile</a>
      </li>
          <li class="active">
            <a class="scroll-link js-scroll-trigger" href="#contact"><i class="fas fa-envelope"></i> Contact</a>
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

    <!-- Call to Action -->
    <section class="content-section bg-light " id="contact">
        <div class="container text-center">
          <section class="mb-4">
    
    
          <div class="content-section-heading">
            <!--Section heading-->
            <h3 class="text-secondary mb-0">Information</h3>
            <h2 class="mb-5">Nous contacter</h2>
            <!--Section description-->
            <p class="lead mb-5">Vous avez des questions? N'hésitez pas à nous contacter directement, nous ferons de notre mieux pour répondre au plus vite.</p>
          </div>
          <% Integer envoye= ((Integer)session.getAttribute("envoye"));if (envoye!=null){ if (envoye.intValue()==1){%>
          <div class="alert alert-success" role="alert">
  			Email Envoyé !
		</div>
		<% }else{ %>
        <div class="alert alert-danger" role="alert">
  			Email incorrect !
		</div>
		<%}} %>
            <div class="row">
        
                <!--Grid column-->
                <div class="col-md-9 mb-md-0 mb-5">
                    <form id ="contact-form" name="contact-form" action="mail.php" method="POST"  onsubmit="return validateForm()">
        
                        <!--Grid row-->
                        <div class="row">
        
                            <!--Grid column-->
                            <div class="col-md-6">
                                <div class="md-form mb-0">
                                <h5>Nom :</h5>
                                    <input type="text" id="name" name="name" placeholder="Votre nom" class="form-control">
                                </div>
                            </div>
                            <!--Grid column-->
        
                            <!--Grid column-->
                            <div class="col-md-6">
                                <div class="md-form mb-0">
                                <h5>Email :</h5>
                                    <input type="email" id="email" name="email" placeholder="Votre email" class="form-control">
                                </div>
                            </div>
                            <!--Grid column-->
        
                        </div>
                        <!--Grid row-->
        
                        <!--Grid row-->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="md-form mb-0">
                                <h5>Objet :</h5>
                                    <input type="text" id="subject" name="subject" placeholder="Objet" class="form-control">
                                </div>
                            </div>
                        </div>
                        <!--Grid row-->
        
                        <!--Grid row-->
                        <div class="row">
        
                            <!--Grid column-->
                            <div class="col-md-12">
        
                                <div class="md-form">
                                <h5>Message :</h5>
                                    <textarea type="text" id="message" name="message" placeholder="Votre message" rows="2" class="form-control md-textarea"></textarea>
                                </div>
        
                            </div>
                        </div>
                        <!--Grid row-->
        
                    </form>
        
                    <div class="text-center text-md-left">
                        <a class="animated fadeInUp wow btn btn-dark " onclick="validateForm()">Envoyer</a>
                    </div>
                </div>
                <!--Grid column-->
        
                <!--Grid column-->
                <div class="col-md-3 text-center">
                    <ul class="list-unstyled mb-0">
                        <li><i class="fas fa-map-marker-alt fa-2x"></i>
                            <p>Avenue du Parc, 95000 Cergy</p>
                        </li>
        
                        <li><i class="fas fa-phone mt-4 fa-2x"></i>
                            <p>01 34 25 10 10</p>
                        </li>
        
                        <li><i class="fas fa-envelope mt-4 fa-2x"></i>
                            <p>vivejee@cytech.com</p>
                        </li>
                    </ul>
                </div>
                <!--Grid column-->
        
            </div>
        
        </section>
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
  <script>function validateForm() {
    formData = {
        'name'     : $('input[name=name]').val(),
        'email'    : $('input[name=email]').val(),
        'subject'  : $('input[name=subject]').val(),
        'message'  : $('textarea[name=message]').val()
    };


   $.ajax({
    url : "mail",
    type: "POST",
    data : formData,
    success: function(data, textStatus, jqXHR)
    {
        alert(data.message);
        location.reload();
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
