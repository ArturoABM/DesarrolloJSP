<%-- 
    Document   : HistorialQr
    Created on : 17-nov-2016, 17:44:31
    Author     : Sistemas
--%>

<%@page import="serviciosweb.Persona"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet" href="css/bootstrap.min.css"> 

        <script type="text/javascript" async="" src="http://www.google-analytics.com/ga.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js" type="text/javascript"></script>
        <script src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.js" type="text/javascript"></script>
        <script src="/resources/scripts/mysamplecode.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
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
                                            out.print("<a href='CodeQR.jsp?cerrar=true'>Cerrar Sesion</a>");
                                        }%></li>
                                </ul>

                            </li>

                            <%
                                int section;
                                if (VariableSession.getAttribute("SessionConstrulle02") != null) {
                                    section = Integer.valueOf(VariableSession.getAttribute("SessionConstrulle02").toString());
                                    out.print("<li><a class='navbar-brand' href='PerfilUsuario.jsp'  style=' padding-top: 14px;'><img alt='Brand' class='img-circle' src='./Img?idProducto=${producto.idProducto}' height='64' width='64'></a></li>");
                                }%>

                        </ul>
                    </div>
                </div>     
            </nav>
        </header>
     
        <Div style="margin-top: 110px; padding-top: 0px;">
            <div style="padding: 0px;">
                <form method="POST" action="GenerateQRCode">
                    <div><fieldset>
                            <legend><b>&nbsp;&nbsp;&nbsp;Your QR code was successfully generated - step three&nbsp;&nbsp;&nbsp;</b></legend>
                            <img style=" margin: auto; display: block; " src="./GenerateQRCode?qrText=true">
                        </fieldset>
                    </div>
                    <div style="padding-top: 0px; ">
                        <button type="submit" name="BtnGuardar" class="btn btn-success btn-lg btn-block " style="width: 315px; margin-left: 515px;"> Save QR</button>     
                    </div>

                </form>
            </div> 

        </Div>





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
                                <input type="email" class="form-control" id="email" onkeypress="return alpha(event, email + bksp + alt)" name="email" value="" placeholder="Email">
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


        <footer style="margin-top: 40px; ">
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
