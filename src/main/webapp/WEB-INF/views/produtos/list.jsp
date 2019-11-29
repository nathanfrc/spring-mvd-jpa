<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<% 
boolean logado = false;
Long id ;
String nome;

try{
		 id = (Long) session.getAttribute("id");
		 nome = (String) session.getAttribute("nome");
		
		if(nome != null && id != null)
		{
			String s = new String(nome);
			String	nomeMaior = s.toUpperCase();
			out.print("Seja bem vindo ... "+nomeMaior);
			logado = true;
		}else{
			
			
			response.sendRedirect("http://localhost:9090/intro-spring-jpa/");
		}
  }catch(Exception e)
  {
	 //boolean logado = false;
	 out.print("erro");
  }
%>

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
  
  
    <spring:url value="/usuarios/cadastro" var="cadastro"/>
    <spring:url value="/usuarios/login" var="login"/>
    <spring:url value="/" var="home"/>
   
    <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="user-menu">
                        <ul>
                          <spring:url value="/" var="home"/>
                            <spring:url value="/logar/logout" var="sair"/>
                            <spring:url value="/produto/all/" var="buscar"/>
                            <li><a href="${home}"><i class="fa fa-user"></i>Home</a></li>
                           <% if(logado == true)
                        	   {%> 
		                            <li><a href="${buscar}${id}"><i class="fa fa-user"></i>Meus Produtos</a></li>
		                            <li><a href="cart.html"><i class="fa fa-user"></i>Carrinho</a></li>
		                            <li><a href="${sair}"><i class="fa fa-user"></i> Sair</a></li>
                            
                            <% } else{%>

									<li><a href="${cadastro }"><i class="fa fa-user"></i>Cadastro</a></li>                            
		                            <li><a href="${login}"><i class="fa fa-user"></i> Login</a></li>
                            <%} %>
                        </ul>
                    </div>
                </div>
                
            </div>
        </div>
    </div> <!-- End header area -->
    
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
                        <h1><a href="./"><img src="${caminho}/img/logo.png"></a></h1>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End site branding area -->
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
	   	
	   <h1>Lista de Produtos</h1>
    <hr>
    <div>

		<spring:url value="/produto/cadastro" var="cadastro"/>
        <a class="btn btn-default" href="${cadastro}">Novo Produto</a>
    </div>
    <hr>

    <div class="${message == null ? 'panel-default' : 'panel-success'}">

        <div class="panel-heading">
            <span>${message == null ? '&nbsp;' : message}</span>
        </div>

        <table class="table table-striped table-condensed">
            <thead>
            <tr>
                <th>ID</th>
                <th>NOME</th>
                <th>DESCRIÇÃO</th>
                <th>VALOR</th>
                <th>AÇÃO</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="produto" items="${produtos}">
                <tr>
                    <td>${produto.id }</td>
                    <td>${produto.nome }</td>
                     <td>${produto.descricao }</td>
                      <td>R$ ${produto.valor }</td>
                    
                    <td>                        
                    	<spring:url value="/produto/update/${produto.id }" var="update"/>
                        <a class="btn btn-info" href="${update}" >Editar</a>
                        <spring:url value="/produto/delete/${produto.id }" var="delete"/>
                        <a class="btn btn-danger" href="${delete }" >Excluir</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    
   </div>
   </div>
</div>
    
   
    
    <div class="brands-area">
        <div class="zigzag-bottom"></div>
    </div> <!-- End brands area -->
    
    
    <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
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