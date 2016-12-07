<%-- 
    Document   : GenerarPago
    Created on : 17-nov-2016, 17:29:23
    Author     : Sistemas
--%>

<%@page import="serviciosweb.Persona"%>
<%@page import="serviciosweb.TLicencia"%>
<%@page import="serviciosweb.TpAuto"%>
<%@page import="serviciosweb.Estado"%>
<%@page import="java.util.List"%>
<%@page import="Datos.EstLista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/cssCombos.css">
        <script type="text/javascript" src="js/jquery-3.1.1.min (1).js"></script>        
        <script src="js/jquery-1.7.1.js"></script>        
        <script src="js/AjaxCmbOrigen.js"></script>
        <script src="js/AjaxCmbDestino.js"></script>
        <title>JSP Page</title>
    </head>
    <body style="background-image: url(img/d.jpg) ; background-size: 100vw 100vh;  background-attachment: fixed;">
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
        <div class="container">
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
                                                out.print("<a href='MobileBooth.jsp?cerrar=true'>Cerrar Sesion</a>");
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
            <%

                if (VariableSession.getAttribute("Idimagen") != null) {
                    String ida = VariableSession.getAttribute("Idimagen").toString();
                    VariableSession.setAttribute("idconsulta", ida);
                }


            %>

            <%                Persona per = null;

                try {
                    int var = Integer.valueOf(VariableSession.getAttribute("idconsulta").toString());
                    serviciosweb.WebServiceOP_Service service = new serviciosweb.WebServiceOP_Service();
                    serviciosweb.WebServiceOP port = service.getWebServiceOPPort();
                    // TODO initialize WS operation arguments here
                    int id = var;
                    // TODO process result here
                    serviciosweb.Persona result = port.nameID(id);
                    per = result;
                    VariableSession.setAttribute("DcPersona", per);
                } catch (Exception ex) {
                    // TODO handle custom exceptions here
                }
            %>
            <div style=" margin-top: 110px;">         
                <legend style="text-align: left;" ><b>&nbsp;&nbsp;&nbsp;Enter the required information in the following form - Step two&nbsp;&nbsp;&nbsp;</b></legend>
            </div>
            <div class="container row" style=" margin-top: 50px;">
                <form method="POST" action="GenerarOrden" style="padding-left: 185px;">
                    <h1 style="padding-left: 17px;">Generate Data Order !!!</h1>
                    <div class="form-group col-md-12" style="padding-right: 260px;">
                        <label for="nombre">Usuario</label>
                        <input type="text" class="form-control" id="nombre" onkeypress="return ValidarLetras(event)" disabled="disabled"  placeholder="Nombre" name="nombre" value=<%= per.getNombre()%>>
                    </div>
                    <div class="form-group col-md-12" style="padding-right: 260px;">
                        <label for="exampleInputPassword1">Apellidos</label>
                        <input type="text" class="form-control" id="apellidos" onkeypress="return ValidarLetras(event)" disabled="disabled" name="apellidos"  placeholder="Apellidos"  value=<%= per.getApellidos()%>>
                    </div>
                    <div class="form-group col-md-6 ">
                        <label for="exampleInputEmail1">Estado de Origen</label>
                        <br>
                        <div class="caja">
                            <select name="DtEstadoOrg" >
                                <option>-- Seleccione un Opcion</option>
                                <%
                                    EstLista etl = new EstLista();
                                    List<Estado> liEst = etl.StEstado();
                                    for (Estado E : liEst) {


                                %>
                                <option value=<%= E.getIdEstado()%>> <%= E.getNEstado()%> </option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-md-6 ">
                        <label for="exampleInputPassword1">Estado de Destino</label>
                        <br>
                        <div class="caja">
                            <select name="DtoEstadoDsn">
                                <option>-- Seleccione un Opcion</option>
                                <%
                                    EstLista Destino = new EstLista();
                                    List<Estado> estDest = Destino.StEstado();
                                    for (Estado D : estDest) {


                                %>
                                <option value=<%= D.getIdEstado()%>> <%= D.getNEstado()%> </option>
                                <%}%>
                            </select>
                        </div>
                    </div>  
                    <div class="form-group col-md-6">
                        <label for="exampleInputPassword1">Municipio de Origen</label>
                        <br>
                        <div class="caja">
                            <select  name="DtMunicipioOrg" >
                                <option>-- Seleccione un Opcion</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="exampleInputPassword1">Municipio de Destino</label>
                        <br>
                        <div class="caja">
                            <select name="DtoMunicipioDsn" >
                                <option>-- Seleccione una Opcion</option>
                            </select>
                        </div>
                    </div>  

                    <div class="form-group col-md-12" style="padding-right: 260px;">
                        <label for="nombre">Conductor</label>
                        <input type="text" class="form-control" id="Conductor" onkeypress="return ValidarLetras(event)" name="Conductor" placeholder="Conductor" value="" >
                    </div>
                    <div class="form-group col-md-6">
                        <label for="exampleInputEmail1">Tipo de Automovil</label>
                        <br>
                        <div class="caja">
                            <select name="TpAutomovil" >
                                <option>-- Seleccione un Opcion</option>
                                <%
                                    EstLista Auto = new EstLista();
                                    List<TpAuto> AutoList = Auto.Automovil();
                                    for (TpAuto M : AutoList) {


                                %>
                                <option value=<%= M.getIdAuto()%>> <%= M.getNAutomovil()%> </option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="exampleInputEmail1">Tipo de Licencia</label>
                        <br>
                        <div class="caja">
                            <select name="TpLicencia">
                                <option>-- Seleccione un Opcion</option>
                                <%
                                    EstLista Lic = new EstLista();
                                    List<TLicencia> LicList = Lic.Licencia();
                                    for (TLicencia L : LicList) {


                                %>
                                <option value=<%= L.getIdlicencia()%>> <%= L.getNLicencia()%> </option>
                                <%}%>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-9" style="padding-right: 25px; padding-top: 15px;">
                        <button type="submit" class="btn btn-primary btn-lg btn-block">Save Now</button>
                    </div>

                </form>


            </div>
        </div>



                            <div>
        <div  class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div id="datform"> 
                <form  name="Formulario" >
                    <div class="row">
                        <div class="col-md-7">
                            <div class="form-group">
                                <label for="nombre">Nombre</label>
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
        <div class="container" style="margin-top:120px; ">
            <footer >
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
