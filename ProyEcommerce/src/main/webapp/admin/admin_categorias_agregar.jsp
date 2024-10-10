<%@page import="Entity.Categoria"%>
<%@page import="Controller.CategoriaController"%>

<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Administrador</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

        <style>
            body {
                background-image: url('https://cloudappi-web.s3.eu-west-1.amazonaws.com/wp-content/uploads/2022/02/02090502/imagenes-blog.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <%@include file="admin_header.jsp" %>
        <div class="container">
            <br>
            <div class="row">
                <h3 class="text-light text-center mb-4">Agregar nueva categoría</h3> 
                <div class="col-md-12 me-4">
                    <div class="row rounded bg-light" style="box-shadow: -10px 10px 10px rgba(255,255,255,0.5)">
                        <form class="p-4" action="/BodegaJavaWeb/CategoriaController" method="POST" autocomplete="off">
                            <input hidden="hidden" type="text" name="action" value="agregar-categoria"> 
                            <div class="infoCategoria" style="display: grid; grid-template-columns: 50% 50%;"> 
                                <div>
                                    <div class="mb-3 me-4">
                                        <label for="txtNameCat" class="form-label">Nombre de la Categoría:</label> 
                                        <input type="text" name="categoria-nombre" required class="form-control border-secondary-subtle" id="txtNameCat"> 
                                    </div>

                                    <div class="mb-3 me-4">
                                        <label for="txtDescCat" class="form-label">Descripción de la Categoría:</label> 
                                        <input type="text" name="categoria-descripcion" required class="form-control border-secondary-subtle" id="txtDescCat"> 
                                    </div>
                                </div>
                                <div>
                                    <div class="ms-4" style="margin-top: 44px;">
                                        <button type="submit" class="btn btn-primary mt-1">Guardar</button>
                                        <a href="admin_categorias.jsp" class="btn btn-secondary mt-1">Cancelar</a> 
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>

            </div>
        
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>