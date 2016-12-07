<%-- 
    Document   : DetalleQR
    Created on : 04-dic-2016, 18:51:19
    Author     : Sistemas
--%>


<%@page import="Datos.Licencia"%>
<%@page import="serviciosweb.TLicencia"%>
<%@page import="serviciosweb.TpAuto"%>
<%@page import="serviciosweb.Estado"%>
<%@page import="Datos.EstadoRun"%>
<%@page import="serviciosweb.ResultadoProcedure"%>
<%@page import="Datos.DatosDetalle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet" href="css/bootstrap.min.css">         
    </head>
    <body style="background-image: url(img/d.jpg) ; background-size: 100vw 100vh;  background-attachment: fixed;">
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
                                            out.print("<a href='DetalleQR.jsp?cerrar=true'>Cerrar Sesion</a>");
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
        <%
            ResultadoProcedure instance = null;
            if (VariableSession.getAttribute("Url") != null) {
                String Param = VariableSession.getAttribute("Url").toString();
                DatosDetalle Detalle = new DatosDetalle();
                instance = Detalle.DatoProPErson(Param);

            }
        %>
        <%
            Licencia li = new Licencia();
            TLicencia TL = li.ListaLicencia(Integer.valueOf(instance.getTipoLicencia()));
            EstadoRun es = new EstadoRun();
            Estado ex = es.ListaEstado(Integer.valueOf(instance.getEstadoDestino()));
            EstadoRun est = new EstadoRun();
            Estado Est = est.ListaEstado(Integer.valueOf(instance.getEstadoOrigen()));

        %>
        <h1 style=" margin-top: 110px; margin-left: 310px;">Request Details !!!</h1>
        <div class="container " style=" margin-top: 50px; padding-right: 220px; padding-left: 220px;">

            <form>
                <div class="row">
                    <div class="col-md-6">
                        <img style="padding-left: -120;" class="img-thumbnail" src="./ImagenDetalla?Img=true">
                    </div>
                    <div class="form-group col-md-6" >
                        <label for="exampleInputPassword1">Usuario</label>
                        <input type="text" class="form-control" id="exampleInputPassword1" disabled="disabled" value=<%=instance.getNombreCuenta()%>>
                    </div>
                    <div class="form-group col-md-6 ">
                        <label for="exampleInputPassword1">Apellidos</label>
                        <input type="text" class="form-control" id="A" disabled="disabled" value=<%=instance.getApellidosCuenta()%>>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="exampleInputPassword1">Estado De Origen</label>
                        <input type="text" class="form-control" id="B" disabled="disabled" value="<%out.print(Est.getNEstado().toString());%>">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="exampleInputPassword1">Municipio De Origen</label>
                        <input type="text" class="form-control" id="C" disabled="disabled" value=<%=instance.getMunicipioOrigen()%>>
                    </div>
                    <div class="form-group  col-md-6 ">
                        <label for="exampleInputPassword1">Automovil</label>
                        <input type="text" class="form-control" id="G" disabled="disabled" value="<% EstadoRun aut = new EstadoRun();
                            TpAuto TP = aut.ListaAuto(Integer.valueOf(instance.getTipoTranspirte()));
                            out.print(TP.getNAutomovil().toString());%>">
                    </div>

                    <div class="form-group  col-md-6 ">
                        <label for="exampleInputPassword1">Estado De Destino</label>
                        <input type="text" class="form-control" id="D" disabled="disabled" value="<%out.print(ex.getNEstado().toString());%>">
                    </div>

                    <div class="form-group  col-md-6 ">
                        <label for="exampleInputPassword1">Conductor</label>
                        <input type="text" class="form-control" id="F" disabled="disabled" value=<%=instance.getConductor()%>>
                    </div>


                    <div class="form-group  col-md-6 ">
                        <label for="exampleInputPassword1">Municipio De Destino</label>
                        <input type="text" class="form-control" id="E" disabled="disabled" value=<%=instance.getMunicipioDestino()%>>
                    </div>
                    <div class="form-group  col-md-12 ">
                        <label for="exampleInputPassword1">Licencia</label>
                               <input type="text" class="form-control" id="H" disabled="disabled" value="<%
                            out.print( "Licencia de : "+TL.getNLicencia().toString()); %>">
                    </div>
                </div>
            </form>
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
