<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Vendas 3D</title>
    
    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>
    
     <!-- Bootstrap -->
    <spring:url var="caminho" value="/static"/>
    <link type="text/css" rel="stylesheet" href="${caminho}/css/bootstrap.css"/>
    
    <!-- Font Awesome -->
     <link type="text/css" rel="stylesheet" href="${caminho}/css/font-awesome.min.css"/>
    
     <!-- Custom CSS -->
     <link type="text/css" rel="stylesheet" href="${caminho}/css/owl.carousel.css"/>
     
     <link type="text/css" rel="stylesheet" href="${caminho}/style.css"/>
     
     <link type="text/css" rel="stylesheet" href="${caminho}/css/responsive.css"/> 
    

  </head>
  <body>
  
    <spring:url value="/cliente/cadastro" var="cadastro"/>
    <spring:url value="/cliente/login" var="login"/>
    <spring:url value="/" var="home"/>
   
    <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="user-menu">
                        <ul>
                        	<spring:url value="/" var="home"/>
                            <li><a href="${home}"><i class="fa fa-user"></i>Home</a></li>
							<li><a href="${cadastro }"><i class="fa fa-user"></i>Cadastro</a></li>                            
		                    <li><a href="${login}"><i class="fa fa-user"></i> Login</a></li>
                            
                        </ul>
                    </div>
                </div>
                
            </div>
        </div>
    </div> <!-- End header area -->
<style>
/* Bordered form */
form {
  /*border: 3px solid #f1f1f1;*/
}

/* Full-width inputs */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

/* Add a hover effect for buttons */
button:hover {
  opacity: 0.8;
}

/* Extra style for the cancel button (red) */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the avatar image inside this container */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

/* Avatar image */
img.avatar {
  width: 10%;
  border-radius: 50%;
}

/* Add padding to containers */
.container {
  padding: 16px;
}

/* The "Forgot password" text */
span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
    display: block;
    float: none;
  }
  .cancelbtn {
    width: 100%;
  }
}
</style> 

<div class="container">
    <div class="row">
        <div class="col-md-10">
        
        <div class="${message == null ? 'panel-default' : 'panel-danger'}">

		        <div class="panel-heading">
		            <span>${message == null ? '&nbsp;' : message}</span>
		        </div>
        
        </div>
        
        <spring:url value="/cliente/logar" var="save"/>
         <form action="${save}" method="post">
		        <div class="imgcontainer">
		          <img src="${caminho}/img/avatar.png" alt="Avatar" class="avatar">
		        </div>
		      
		
		          <label for="uname"><b>Email:</b></label>
		          <input type="text" placeholder="email@email.com" name="email" required>
		      
		          <label for="psw"><b>Password:</b></label>
		          <input type="password" placeholder="Password" name="senha" required>
		      
		          <button type="submit">Login</button>
		          <label>
		            <input type="checkbox" checked="checked" name="remember"> Remember me
		          </label>
       
      </form>
        
 
      
  <%--     <spring:url value="/logar/efetuar" var="save"/>
        <form:form action="${save}" method="post">
        	 <div class="imgcontainer">
          		<img src="${caminho}/img/avatar.png" alt="Avatar" class="avatar">
       			 </div>
            <div class="form-group">
                <label for="email">Email: </label>
                <form:input path="email" class="form-control"/>   
                <form:errors path="email" cssClass="label label-danger"/>             
            </div>
            <div class="form-group">
                <label for="senha">Senha: </label>
                <form:password path="senha"  class="form-control"/>    
                <form:errors path="senha" cssClass="label label-danger"/>          
            </div>
             
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>
            
        </form:form> --%>

   </div>
   </div>
</div>
    
   
    
    <div class="brands-area">
        <div class="zigzag-bottom"></div>
        
    </div> <!-- End brands area -->
    
    <div class="footer-top-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="footer-about-us">
                
                        <div class="footer-social">
                            <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Navegação </h2>
                        <ul>
                            <li><a href="${cadastro}">Minha conta</a></li>
                            <li><a href="${home}">Home</a></li>
                            <li><a href="${login}">Login</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Categorias</h2>
                        <ul>
                            <li><a href="#">Máquinas 3-D</a></li>
                         
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-newsletter">
                        <h2 class="footer-wid-title">Newsletter</h2>
                        <p>
Assine nossa newsletter e receba ofertas exclusivas que você não encontrará em nenhum outro lugar diretamente na sua caixa de entrada!</p>
                        <div class="newsletter-form">
                            <form action="#">
                                <input type="email" placeholder="Type your email">
                                <input type="submit" value="Subscribe">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End footer top area -->
    
    <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="copyright">
                        <p>&copy; 2019 Vendas 3D. All Rights Reserved. <a href="" target="_blank">vendas-3D</a></p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="footer-card-icon">
                        <i class="fa fa-cc-discover"></i>
                        <i class="fa fa-cc-mastercard"></i>
                        <i class="fa fa-cc-paypal"></i>
                        <i class="fa fa-cc-visa"></i>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End footer bottom area -->
   
    <!-- Latest jQuery form server -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    
    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <!-- jQuery sticky menu -->
    <link type="text/javascript"  src="${caminho}/js/owl.carousel.min.js"/>
    
   <!-- <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>-->
    
    <!-- jQuery easing -->
    <link type="text/javascript"  src="${caminho}/js/jquery.easing.1.3.min.js"/>
   <!--  <script src="js/jquery.easing.1.3.min.js"></script>-->
    
    <!-- Main Script -->
    <link type="text/javascript"  src="${caminho}/js/main.js"/>
   <!-- <script src="js/main.js"></script>-->
    
    <!-- Slider -->
     <link type="text/javascript"  src="${caminho}/js/bxslider.min.js"/>
    
     <link type="text/javascript"  src="${caminho}/js/script.slider.js"/>
  </body>
</html>