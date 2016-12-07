<%-- 
    Document   : LogeoPerfil
    Created on : 02-oct-2016, 2:56:43
    Author     : Sistemas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/cssLogin.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script type="text/javascript" src="js/jquery-3.1.1.min (1).js"></script>
        <script type="text/javascript" src="js/ValidacionLogin.js"></script>
    </head>
    <body>
        <header>
            <nav style="height:95px; background:black; " id="menu" class="navbar navbar-default navbar-fixed-top navbar-inverse ">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-1" >                               <span class="sr-only">Menu</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>

                        </button> 

                        <img style="padding-top: 9px;" alt='Brand' src='img/geolocalization.png'>

                    </div>
                    <div class="collapse navbar-collapse" id="navbar-1">
                        <ul class="nav navbar-nav">
                            <li>  <a href="MobileBooth.jsp" style="font-size: 33px;  padding-top: 35px;"> MobileBooth</a> </li>
                            <li><a href="MobileBooth.jsp"  id="inicio" style="font-size:14px; padding-top: 35px; padding-left: 26px;" ><img  alt='Brand' src='img/drop (4).png'> HOME</a></li>
                            <li><a href="LogeoPerfil.jsp"  id="Login" style="font-size:14px; padding-top: 35px; padding-left: 26px;" ><img alt='Brand' src='img/drop.png'>LOGIN</a></li>
                            <li><a href=""  style=" padding-top: 33px; font-size:14px; padding-left: 26px;"><img alt='Brand' src='img/drop (1).png'> RECORD</a></li>
                            <li class="dropdown">


                                <ul  class="dropdown-menu"> 

                                    <li><a href="#" >Item #1</a></li>
                                    <li><a href="#" >Item #1</a></li>
                                    <li><a href="#" >Item #1</a></li>

                                </ul>
                            </li>
                        </ul>

                        <ul class="nav navbar-nav navbar-right">


                            <li class="dropdown">

                                <a href="" id="a" class="dropdown-toggle"  style=" font-size:14px; padding-top: 35px;" data-toggle="dropdown" role="button"><img alt='Brand' src='img/drop (6).png'>
                                    <%
                                        HttpSession VariableSession = request.getSession();
                                        String Usuario = "";
                                        String idimg = "";
                                        int iconoa = 0;
                                        if (VariableSession.getAttribute("validaUsuario") != null) {
                                            Usuario = VariableSession.getAttribute("validaUsuario").toString();
                                            idimg = VariableSession.getAttribute("Idimagen").toString();
                                            out.print(Usuario);
                                            iconoa = 1;
                                            VariableSession.setAttribute("SessionConstrulle02", iconoa);

                                        } else {
                                            Usuario = "MY ACCOUNT";
                                            out.print(Usuario);
                                        }

                                    %>


                                    <samp class="caret"></samp>
                                </a>
                                <ul  class="dropdown-menu"> 

                                    
                                    <li><%if (iconoa == 1) {
                                            out.print("<a href='LogeoPerfil.jsp?cerrar=true'>Cerrar Sesion</a>");
                                        }%></li>
                                </ul>

                            </li>

                            <%         int section;
                                if (VariableSession.getAttribute("SessionConstrulle02") != null) {
                                    section = Integer.valueOf(VariableSession.getAttribute("SessionConstrulle02").toString());
                                    out.print("<li><a class='navbar-brand' href='PerfilUsuario.jsp'  style=' padding-top: 14px;'><img alt='Brand' class='img-circle' src='./Img?idProducto=${producto.idProducto}' height='64' width='64'></a></li>");
                                }%>

                        </ul>
                    </div>
                </div>     
            </nav>
        </header>
        <script type="text/javascript">
            function ImagePreviw(input) {
                if (input.files && input.files[0]) {
                    var fildr = new FileReader();
                    fildr.onload = function (e) {
                        $('#ImageFoto').attr('src', e.target.result);
                    };
                    fildr.readAsDataURL(input.files[0]);

                }
            }
                function ValidarLetras(e) {
                    var key = e.keyCode || e.which;
                    var teclado = String.fromCharCode(key).toLowerCase();
                    var letras = " abcdefghijklmnñopqrstuvwxyz";
                    var especiales = "8-37-38-46-164";
                    var tecladoespecial = false;
                    for (var i in especiales) {
                        if (key == especiales[i]) {
                            tecladoespecial = true;
                            break;

                        }
                    }

                }
                
                var email = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.@_';
                var bksp = 'backspace';
                var alt = 'alt';

                function alpha(e, allow) {
                    var k;
                    k = document.all ? parseInt(e.keyCode) : parseInt(e.which);
                    return (allow.indexOf(String.fromCharCode(k)) != -1);
                }
        </script>
<div style=" margin-top: 110px;">         
                <legend style="text-align: left;" ><b>&nbsp;&nbsp;&nbsp;To generate your QR code you must start Session - Step one&nbsp;&nbsp;&nbsp;</b></legend>
            </div>
        <div  style="margin-top: 50px; " class="container">

            <div class="container row">
                <div class="col-md-4"></div>
                <div id="login" style="box-shadow: 0 0 11px black ;  background-image: url(img/ffff.jpg); background-attachment: fixed; background-size: 100vw 100vh;" class="col-xs-12 col-md-4">

                    <form name="Formulario" style="margin-top: 18px;">
                        <img class="img-circle img-responsive" style="display:block; margin:auto;  " src="img/black-male-user-symbol (1).png" alt="...">
                        <div style="margin-top: 10px;" class="parrafo form-group">
                            <label for="exampleInputEmail1">Email address*</label>
                            <input type="email" name="Email" id="Email" class="form-control cajadetexto" onkeypress="return alpha(event, email + bksp + alt)" placeholder="Email" required="">

                            <span id="ValidarEmail" class="form_hint"></span>
                        </div>
                        <div class="parrafo form-group">
                            <label for="exampleInputPassword1">Password*</label>
                            <input type="password" name="Contrasena" id="Contrasena" class="form-control cajadetexto" placeholder="Password" required=""  >

                            <span id='validacionPassword' class='form_hint'></span>
                        </div>

                        <input type="button" class="botonguardar"  id="guardar" value="Ingresar">
                        <br>
                        <br>
                        <span id="validacionFormulario" class="form_hint"> </span>
                    </form>
                </div>
                <div class="col-md-4"></div>

            </div>



        </div>






        <div  class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div id="datform"> 
                <form  name="Formulario" >
                    <div class="row">
                        <div class="col-md-7">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Nombre</label>
                                <input type="text" class="form-control" id="nombre" onkeypress="return ValidarLetras(event)" name="nombre" value="" placeholder="Nombre">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Apellidos</label>
                                <input type="text" class="form-control" id="apellidos" onkeypress="return ValidarLetras(event)" name="apellidos" value="" placeholder="Apellidos">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Sexo</label>
                                <input type="text" class="form-control" id="sexo" onkeypress="return ValidarLetras(event)" name="sexo" value="" placeholder="Sexo">
                            </div>    
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                                <img id="ImageFoto" class="img-rounded" style=" display: block; margin: auto;" height='180' width='165'>
                                <label for="archivo" style="padding-top:  5px; padding-left: 27px;" class="upload-button"><a  style="background-color: #ebebeb" class="btn  btn-default" >Select new image <img style="padding-left:6px;" src="img/camera.png"></a></label>                    
                                <input type="file"  id="archivo" name="archivo" style="display:none" onchange="ImagePreviw(this);" >
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="exampleInputPassword1">Email</label>
                                <input type="email" class="form-control"  onkeypress="return alpha(event, email + bksp + alt)" id="email" name="email" value="" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" class="form-control" id="contrasena" name="contrasena" value="" placeholder="Password">
                            </div>

                        </div>

                    </div>
                </form>              
            </div>
        </div>

        <footer style="margin-top:90px; ">
            <div id="piepagina"  >
                <div class="col-xs-6">  
                    <p> Redes Sociales</p>
                </div>
                <div class="col-xs-6">
                    <ul  class="list-inline text-right">
                        <li>
                            <a href="#">Facebook
                            </a>
                        </li>
                        <li>
                            <a href="#">Google API
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </footer>

         <%      if (request.getParameter("cerrar") != null) {
                VariableSession.invalidate();
                response.sendRedirect("MobileBooth.jsp");
                   }
        %>
        <script src="js/jquery-1.8.2.js"></script>
        <script src="js/jquery-3.1.0.min.js"></script>
        <script src="js/FormDimamico.js"></script>        
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>

