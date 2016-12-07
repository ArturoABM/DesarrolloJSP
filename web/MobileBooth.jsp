
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/cssIndex.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">       
    </head>

    <body style="background-size: 100vw 100vh; background: white; background-attachment: fixed;"> 
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
        

        <div style="background-color: black;">
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
            <br>
            <br>
            <br>
        </div>
        <div style="margin-top: 35px; background:#100c0a; " id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div id="imagen" class="item active">
                    <img class="img-rounded " src="img/001_1.jpg" alt="...">
                    <div class="carousel-caption">
                        <h1>B3515 from Cheddar to Ashwick</h1>
                        <p> Reino Unido</p>
                    </div>
                </div>
                <div id="imagen" class="item">
                    <img class="img-rounded " src="img/005.jpg" alt="...">
                    <div class="carousel-caption">
                        <h1>Titisee a Bad Krozingen por la L126</h1>
                        <p> Alemania</p>
                    </div>
                </div>
                <div id="imagen" class="item">
                    <img class="img-rounded" src="img/002.jpg" alt="...">
                    <div class="carousel-caption">
                        <h1> Zumaia a Zarauz por la N-634</h1>
                        <p>España</p>
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <div id="divmapa" style="background-image: url(img/bnc.jpg)" class="container-fluid">
            <div  class="row ">

                <div id="divbacia" style=" background-image: url(img/hhhh.jpg); background-size: 100vw 100vh;" class="col-xs-12 col-sm-6 col-md-6">
                    <form name="Formulario" >
                        <div class="R1" style="color: black;"> Crea una cuenta</div>
                        <div class="R2" style="color: black;"> Sus datos personales</div>
                        <div class="parrafo form-group">
                            <label for="exampleInputEmail1" id="color01">Sexo*</label>
                            <div class="checkbox form-group " style="color:  black;">
                                <input type="radio" id="Sexo" name="Sexo" value="Hombre"  > Hombre
                                <input type="radio" id="Sexo" name="Sexo" value="Mujer"  > Mujer
                            </div>
                        </div>
                        <div class="parrafo form-group">
                            <label for="exampleInputEmail1" id="color01">Nombre*</label>
                            <input type="text" name="Nombre" class="form-control cajadetexto" id="Nombre"  onkeypress="return ValidarLetras(event)" placeholder="Nombre" required>
                            <span id="ValidarNombre" class="form_hint"></span>
                        </div>
                        <div class=" parrafo form-group">
                            <label for="exampleInputEmail1" id="color01">Apellidos*</label>
                            <input type="text" name="Apellidos" class="form-control cajadetexto"   onkeypress="return ValidarLetras(event)" id="Apellidos" placeholder="Apellidos" required>
                            <span id="ValidarApellidos" class="form_hint"></span>
                        </div>
                        <div class="parrafo form-group">
                            <label for="exampleInputEmail1" id="color01">Email address*</label>
                            <input type="email" name="Email" class="form-control cajadetexto"  onkeypress="return alpha(event, email + bksp + alt)" id="Email" placeholder="Email" required>
                            <span id="ValidarEmail" class="form_hint"></span>
                        </div>
                        <div class="parrafo form-group">
                            <label for="exampleInputPassword1" id="color01">Password*</label>
                            <input type="password" name="Contrasena" class="form-control cajadetexto" id="Contrasena" placeholder="Password" required>
                            <span id="ValidarPassword" class="form_hint"></span>
                        </div>
                        <button type="button" class="botonguardar" id="btnguardar" name="btnguardar">Registrar</button>
                        <br>
                        <span id="ValidarFormularios" class="form_hint"></span>
                    </form>
                </div>
                <div id="contimg" class="col-xs-12 col-sm-6 col-md-6"> 
                    <label id="map"> </label>
                </div>
            </div>
        </div>
        <br>
        <div style=" background: black;  "  class="container-fluid" id="miniaturascontenedor">
            <br>
            <div id="miniaturas" class="row">
                <div class="col-xs-6 col-md-3">
                    <div style=" background-image: url(img/pp.jpg);background-size: 100vw 100vh;  box-shadow: 0 0 8px white ; border: 1px solid #100c0a;" class="thumbnail">
                        <img src="img/autopista001.jpg" class="img-rounded" alt="">
                        <div class="caption">
                            <h3 class="hidden-xs " style="color: black;">Titulo de la foto </h3> 
                            <p class="hidden-xs  text-justify"  style="color: black;">La autopista Cámpora (AU7) estará cerrada de noche hasta el jueves por obras para mejorar la circulación en la zona, según informó la empresa estatal Autopistas Urbanas (AUSA).
                        </div>
                    </div> 
                </div>
                <div class="col-xs-6 col-md-3">
                    <div style=" background-image: url(img/pp.jpg);background-size: 100vw 100vh; box-shadow: 0 0 8px white ;" class="thumbnail">
                        <img src="img/autopista001.jpg" class="img-rounded" alt="">
                        <div class="caption">
                            <h3 class="hidden-xs "  style="color: black;" >Titulo de la foto </h3> 
                            <p class="hidden-xs text-justify " style="color: black;">La autopista Cámpora (AU7) estará cerrada de noche hasta el jueves por obras para mejorar la circulación en la zona, según informó la empresa estatal Autopistas Urbanas (AUSA).
                        </div>
                    </div> 
                </div>
                <div class="col-xs-6 col-md-3">
                    <div style=" background-image: url(img/pp.jpg);background-size: 100vw 100vh; box-shadow: 0 0 8px white ;" class="thumbnail">
                        <img src="img/autopista001.jpg" class="img-rounded" alt="">
                        <div class="caption">
                            <h3 class="hidden-xs" style="color: black;">Titulo de la foto </h3> 
                            <p class="hidden-xs text-justify" style="color: black;">La autopista Cámpora (AU7) estará cerrada de noche hasta el jueves por obras para mejorar la circulación en la zona, según informó la empresa estatal Autopistas Urbanas (AUSA).
                        </div>
                    </div> 
                </div>
                <div class="col-xs-6 col-md-3">
                    <div style=" background-image: url(img/pp.jpg);background-size: 100vw 100vh; box-shadow: 0 0 8px white ;" class="thumbnail">
                        <img src="img/003.jpg" class="img-rounded" alt="">
                        <div class="caption">
                            <h3 class="hidden-xs " style="color: black;">Titulo de la foto </h3> 
                            <p class="hidden-xs text-justify" style="color: black;">La autopista Cámpora (AU7) estará cerrada de noche hasta el jueves por obras para mejorar la circulación en la zona, según informó la empresa estatal Autopistas Urbanas (AUSA).
                        </div>
                    </div> 
                </div>
            </div>
        </div>




        <div  class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div id="datform"> 
                <form  name="Formulario" >
                    <div class="row">
                        <div class="col-md-7">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Nombre</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" onkeypress="return ValidarLetras(event)" value="" placeholder="Nombre">
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
                                <input type="email" class="form-control" id="email"  onkeypress="return alpha(event, email + bksp + alt)" name="email" value="" placeholder="Email">
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
      
        <footer>
            <div id="piepagina" >
                <div class="col-xs-6">  
                    <p> Redes Sociales </p>
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

        <%

            if (request.getParameter("cerrar") != null) {
                VariableSession.invalidate();
                response.sendRedirect("MobileBooth.jsp");
            }


        %>

        <script src="js/jquery-1.8.2.js"></script>
        <script type="text/javascript" src="js/jquery-3.1.1.min (1).js"></script>        
        <script async defer src="https://maps.googleapis.com/maps/api/js?callback=initMap&key=AIzaSyBSd2LqkRXcHGBRlwWWgHRxIwnfnivm5ZU"></script>
        <script type="text/javascript" src="js/ValidacionRegistro.js"></script> 
        <script src="js/FormDimamico.js"></script>
        <script src="js/Localizacion.js"></script>        
        <script src="js/bootstrap.min.js"></script>        
    </body>
</html>
