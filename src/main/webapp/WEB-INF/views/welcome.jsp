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
		
		if(nome != null)
		{
			String s = new String(nome);
			String	nomeMaior = s.toUpperCase();
			out.print("Seja bem vindo ... "+nomeMaior);
			logado = true;
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
   
   <spring:url value="/cliente/cadastro" var="cadastro"/>
   <spring:url value="/cliente/login" var="login"/>
  
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
                 
                 <% if(logado == true){ %>
	                <div class="col-sm-6">
	                    <div class="shopping-item">
	                        <a href="cart.html">Carrinho - <span class="cart-amunt">R$ 100</span> <i class="fa fa-shopping-cart"></i> <span class="product-count">5</span></a>
	                    </div>
	                </div>
	               <%} %>
               

         
            </div>
        </div>
    </div> <!-- End site branding area -->
    
    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div> 
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.html">Home</a></li>
                        <li><a href="shop.html">Cadastro</a></li>
                        <li><a href="checkout.html">Contato</a></li>
                        <li><a href="#">Produtos</a></li>
                        <li><a href="#">Sobre nos</a></li>
                        <li><a href="#">Sair</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div> <!-- End mainmenu area -->
  
    <div class="promo-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo1">
                        <i class="fa fa-refresh"></i>
                        <p>30 Dias Para Retorno</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo2">
                        <i class="fa fa-truck"></i>
                        <p>Frete Free</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo3">
                        <i class="fa fa-lock"></i>
                        <p>Segurança</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo4">
                        <i class="fa fa-gift"></i>
                        <p>Novos Produtos</p>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End promo area -->
                         <div class="${message == null ? 'panel-default' : 'panel-success'}">
					        <div class="panel-heading">
					            <span>${message == null ? '&nbsp;' : message}</span>
					        </div>
                        </div>
    <div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
               <div class="col-md-12">
                    <div class="latest-product">
                        <h2 class="section-title">Produtos</h2>
                        <div class="product-carousel">
                        
                        
                        
                        
              <spring:url value="/produto/prod/" var="adicionar"/>
             <c:forEach var="produto" items="${produtos}">
                
               			<div class="col-md-8 col-sm-8">
                 			<div class="single-product">
                                <div class="product-f-image">
                                    <img src="${caminho}/img/3d.jpg" alt="" width="20%" height="40%">
                                    <div class="product-hover">
      

                                     
          		       <a href="${adicionar}${produto.id}" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Adicionar</a>
          
                                         <a href="single-product.html" class="view-details-link"><i class="fa fa-link"></i>Contato</a>
                                    </div>
                                </div>
                                <h2><a href="single-product.html">${produto.nome} - ${produto.descricao}</a></h2>
                                <div class="product-carousel-price">
                                    <ins>R$ ${produto.valor}</ins>
                                </div> 
                            </div>
                          </div>
            </c:forEach>
                            
                        
                            
                         
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End main content area -->
    
    <div class="brands-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="brand-wrapper">
                        <div class="brand-list">
                            <img src="${caminho}/img/brand1.png" alt="">
                            <img src="${caminho}/img/brand2.png" alt="">
                            <img src="${caminho}/img/brand3.png" alt="">
                            <img src="${caminho}/img/brand4.png" alt="">
                            <img src="${caminho}/img/brand5.png" alt="">
                            <img src="${caminho}/img/brand6.png" alt="">
                            <img src="${caminho}/img/brand1.png" alt="">
                            <img src="${caminho}/img/brand2.png" alt="">                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End brands area -->
    
    <div class="footer-top-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="footer-about-us">
                        <h2>u<span>3D</span></h2>
                        <p></p>
                        <div class="footer-social">
                            <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
                
                <spring:url value="/" var="home"/>
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Navegação</h2>
                        <ul>
                            <li><a href="${login}">Login</a></li>
                            <li><a href="${cadastro}">Cadastro</a></li>
                            <li><a href="${home}">Home</a></li>
             
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Categories</h2>
                        <ul>
                            <li><a href="#">Impressora 3D</a></li>
                            
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-newsletter">
                        <h2 class="footer-wid-title">Newsletter</h2>
                        <p>Assine nossa newsletter e receba ofertas exclusivas que você não encontrará em nenhum outro lugar diretamente na sua caixa de entrada!</p>
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
    
      <!-- Latest jQuery form server -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    
    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <!-- jQuery sticky menu -->
    <link type="text/javascript"  src="${caminho}/js/owl.carousel.min.js"/>
    <script src="${caminho}/js/jquery.sticky.js"></script>
    
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