<%@page import="model.Commentaire"%>
<%@page import="model.LigneCommande"%>
<%@ page import="java.util.List" %>
<%@page import="model.Commande"%>
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
          <h3><a href="/profile">
          </a></h3>
      </div>

      <ul class="list-unstyled menu-elements">
          <li>
              <a class="scroll-link js-scroll-trigger" href="/"><i class="fas fa-home"></i>Home</a>
          </li>
          <% User user = (User)request.getSession(true).getAttribute("user"); if (user==null){%>
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
        <li class="active">
            <a class="scroll-link js-scroll-trigger" href="#profile"><i class="fas fa-address-book"></i>Mon profile</a>
        </li>
          <li>
            <a class="scroll-link js-scroll-trigger" href="/contact"><i class="fas fa-envelope"></i> Contact</a>
        </li>
        <%  if (user!=null){%>
        <li>
          <a class="scroll-link js-scroll-trigger" href="/disconnect"><i class="fas fa-sign-out-alt"></i>Se déconnecter</a>
      </li>
      <%} %>
        <%User user2 = ((User) session.getAttribute("user2"));%>
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
  <section class="content-section bg-light" id="profile">
    <div class="container">
      <div class="row">
        <div class="container light-style flex-grow-1 container-p-y">

            <h4 class="font-weight-bold py-3 mb-4">
              Mes Paramètres
            </h4>
        
            <div class="card overflow-hidden">
              <div class="row no-gutters row-bordered row-border-light">
                <div class="col-md-3 pt-0">
                  <div class="list-group list-group-flush account-settings-links">
                    <a class="list-group-item list-group-item-action active" data-toggle="list" href="#account-general">General</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-change-password">Changer de mot de passe</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-historique">Mon historique</a>
                  </div>
                </div>
                <div class="col-md-9">
                  <div class="tab-content">
                    <div class="tab-pane fade active show" id="account-general">
                        <form >
                            <hr class="border-light m-0">
        
                      <div class="card-body">
                        <div class="form-group">
                          <label class="form-label">E-mail</label>
                          <input type="text" class="form-control mb-1" value="<%=user.getAdresseMail() %>" required>
                        </div>
                      </div>
                      <div class="text-right mt-3" style="margin: 1rem;">
                        <button type="submit" class=" animated fadeIn btn btn-primary">Sauvegarder</button>&nbsp;
                        <button type="reset" class="animated fadeIn btn btn-dark">Annuler</button>
                      </div>
                </form>
                    </div>

                    <div class="tab-pane fade" id="account-change-password">
                        <form action="/changePass" method="POST">
                            <div class="card-body pb-2">
        
                                <div class="form-group">
                                  <label class="form-label">Mot de passe actuel</label>
                                  <input type="password" name="oldPass" class="form-control" required>
                                </div>
                
                                <div class="form-group">
                                  <label class="form-label">Nouveau mot de passe</label>
                                  <input type="password" name="newPass" class="form-control" required>
                                </div>
                
                                <div class="form-group">
                                  <label class="form-label">Confirmation du nouveau mot de passe</label>
                                  <input type="password" name="newPass2" class="form-control" required>
                                </div>
                
                              </div>
                              <div class="text-right mt-3" style="margin: 1rem;">
                                <button type="submit" class="animated fadeIn btn btn-primary">Sauvegarder</button>&nbsp;
                                <button type="reset" class="animated fadeIn btn btn-dark">Annuler</button>
                              </div>
                        </form>
                    </div>
                    <div class="tab-pane fade" id="account-historique">
                      <div style="margin: 2rem;">
                        <h2>Historique</h2>
                        <div class="table-responsive">
                          <table class="table table-striped table-sm">
                            <thead>
                              <tr>
                                <th>#</th>
                                <th>Nom</th>
                                <th>Prix</th>
                                <th>Date</th>
                              </tr>
                            </thead>
                            <tbody>
                            	<%double montant=0; for(Commande commande: user2.getCommandes()) {
                            	montant =0;
                            	for (LigneCommande lc : commande.getLigneCommandes()){
                            		montant += ((double)lc.getQuantite())*((double)lc.getProduit().getPrix());
                            	}
                            	%>
                              <tr>
                                <td><%=commande.getId() %></td>
                                <td><%=user2.getAdresseMail() %></td>
                                <td><%=montant %></td>
                                <td><%=commande.getDatePassageCommande() %></td>
                              </tr>
                              <%} %>
                              
                            </tbody>
                          </table>
                        </div>
                      </div>
        
                      </div>
                  </div>
                </div>
              </div>
            </div>
        
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
