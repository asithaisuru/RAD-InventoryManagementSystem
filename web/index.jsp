<%-- Document : index Created on : May 6, 2024, 3:29:58 PM Author : Asitha --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Welcome - Inventory Management System</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
       
        <form action="login.jsp" method="post">
        
        
       <section class="text-center text-lg-start">
    <!-- Jumbotron -->
    <div class="container py-4">
      <nav class="navbar navbar-expand-lg navbar-light bg-white">
        <div class="container">
          <a class="navbar-brand d-flex justify-content-between" href="index.html">
          
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          
        </div>
      </nav>

      <div class="row g-0 align-items-center">
        <div class="col-lg-6 mb-5 mb-lg-0">
          <div class="card cascading-right"
            style="background: hsla(0, 0%, 100%, 0.55); backdrop-filter: blur(30px);">
            <div class="card-body p-5 shadow-5 text-center">
              <h2 class="fw-bold mb-5">Sign In</h2>
              <form>
                <!-- Email input -->
                <div class="form-outline mb-4">
                  <input type="text" id="emailInput" name="username" class="form-control" placeholder="Username" required/>
                </div>

                <!-- Password input -->
                <div class="form-outline mb-4">
                  <input type="password" id="passwordInput" name="password" class="form-control" placeholder="Password" required/>
                </div>

                <!-- Submit button -->
                <button type="submit" class="btn btn-primary btn-block mb-4">
                  Sign In
                </button>

                <div class="text-center">
                  <p>Don't have an account? <a href="sign_up.jsp">Sign up</a></p>
                </div>
              </form>
            </div>
          </div>
        </div>

        <div class="col-lg-6 mb-5 mb-lg-0">
          <img src="images/main-image.png" class="w-100 d-none d-lg-block" alt="" />
        </div>
      </div>
    </div>
    <!-- Jumbotron -->
  </section>
  <!-- Section: Design Block -->
  


  <!-- Bootstrap JS -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </form>
    </body>
</html>
