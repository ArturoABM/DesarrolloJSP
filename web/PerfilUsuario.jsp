<%-- 
    Document   : PerfilUsuario
    Created on : 02-oct-2016, 3:02:44
    Author     : Sistemas
--%>

<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="serviciosweb.EliminarUsuario"%>
<%@page import="Datos.MostrarDatos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="serviciosweb.Persona"%>
<%@page import="serviciosweb.MostrarUsuarios"%>
<%@page import="Datos.SessionGenerica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <head>                             
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css"> 
        <link rel="stylesheet" href="css/BtnInput.css"> 
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
                                            out.print("<a href='PerfilUsuario.jsp?cerrar=true'>Cerrar Sesion</a>");
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

        <div style="margin-top: 95px;">
            <div style="background-image: url(img/image2.jpg); background-size: 100vw 100vh;  background-attachment: fixed;">
                <div class="row container">
                    <div class="col-md-5" style="padding-top: 0px; padding-bottom:0px;">
                        <a href="HistorialQr.jsp" ><img alt='Brand' class="img-responsive img-rounded"  src='img/medical-history (1).png'></a> 
                    </div>
                    <div class="col-md-7">
                        <h1 style="padding-left: 0px; padding-top: 100px; color: black;">Consult your history now !!!!</h1>
                        <h5 style="padding-left: 120px; color: black;">This option allows you to view all the Qr codes that have been generated..</h5>
                    </div>
                </div>    
            </div>
            <div style="background-image: url(img/b_1.jpg); background-size: 100vw 100vh;  background-attachment: fixed;">
                <div class="row container" >
                    <div class="col-md-5">
                        <a href="GenerarPago.jsp"><img alt='Brand' class="img-responsive"  src='img/car.png'></a> 
                    </div>
                    <div class="col-md-7">                     
                        <h1 style="padding-left: 0px; padding-top: 100px; color: black;">Make your car payment now !!!!</h1>
                        <h5 style="padding-left: 120px; color: black;">In this option allows you to make the payment of your ticket for any automobile stand..</h5>
                    </div>     
                </div>
            </div>
        </div>
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
                if (letras.indexOf(teclado) == -1 && !tecladoespecial) {
                    return false;
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
                <form  name="Formulario" action="PerfilUsuaro" method="POST"  enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-md-7">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Nombre</label>
                                <input type="text" class="form-control" id="nombre" onkeypress="return ValidarLetras(event)"  name="nombre" value="" placeholder="Nombre" >
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Apellidos</label>
                                <input type="text" class="form-control" id="apellidos"onkeypress="return ValidarLetras(event)" name="apellidos" value="" placeholder="Apellidos">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Sexo</label>
                                <input type="text" class="form-control" id="sexo" name="sexo" value="" placeholder="Sexo">
                            </div>    
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                                <input type="hidden" value="${param.idProducto}" name="idProducto">
                                <img id="ImageFoto" class="img-rounded" src='./Img?idProducto=${producto.idProducto}' style=" display:block; margin: auto;" height='180' width='165'>
                                <label for="archivo" style="padding-top:  5px; padding-left: 27px;" class="upload-button"><a  style="background-color: #ebebeb" class="btn  btn-default" >Select new image <img style="padding-left:6px;" src="img/camera.png"></a></label>              

                                <input type="file" id="archivo" name="archivo" style="display:none" value="" onchange="ImagePreviw(this);" >

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