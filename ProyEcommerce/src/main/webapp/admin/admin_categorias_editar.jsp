<%@page import="Entity.Categoria"%>
<%@page import="Controller.CategoriaController"%>
<%@ page import="Controller.ProductoController" %>
<%@ page import="Entity.Producto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CategoriaController cCategoria = new CategoriaController();
    Categoria categoria = cCategoria.obtenerCategoria(Integer.parseInt(request.getParameter("categoriaid")));
%>
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
                <div class="col-md-12 rounded p-4 mb-4" style="background: rgba(255,255,255, 0.85);backdrop-filter: blur(5px)">
                    <div class="text-center mb-3">
                    <h2 class="mb-3">Modificando Registro de Categoría</h2>
                    
                </div>
                <form action="/BodegaJavaWeb/CategoriaController" method="POST" autocomplete="off"> <!-- Cambiado 'ProductoController' a 'CategoriaController' -->
                    <input hidden="hidden" type="text" name="action" value="editar-categoria"> <!-- Cambiado 'editar-producto' a 'editar-categoria' -->
                    <div class="mb-3 row">
                        <label for="txtId" class="col-sm-2 col-form-label">ID</label>
                        <div class="col-sm-10">
                            <input type="text" name="categoria-id" readonly class="form-control-plaintext" id="txtId" 
                                   value="<%=categoria.getId()%>"> <!-- Cambiado 'producto-id' a 'categoria-id' -->
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="txtNameCat" class="col-sm-2 col-form-label">Nombre</label> <!-- Cambiado 'Nombre' a 'Nombre de la Categoría' -->
                        <div class="col-sm-10">
                            <input type="text" name="categoria-nombre" class="form-control" id="txtNameCat" 
                                   value="<%=categoria.getNombre()%>"> <!-- Cambiado 'producto-nombre' a 'categoria-nombre' -->
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="txtDescCat" class="col-sm-2 col-form-label">Descripción</label> <!-- Cambiado 'Descripción' a 'Descripción de la Categoría' -->
                        <div class="col-sm-10">
                            <input type="text" name="categoria-descripcion" required class="form-control" id="txtDescCat" 
                                   value="<%=categoria.getDescripcion()%>"> <!-- Cambiado 'producto-descripcion' a 'categoria-descripcion' -->
                        </div>
                    </div>
                    <div>
                        <input type="submit" class="btn btn-success mt-3" value="Modificar">
                        <a class="btn btn-secondary ms-2 mt-3" href="/BodegaJavaWeb/admin/admin_categorias.jsp">Cancelar</a> <!-- Cambiado 'admin_productos.jsp' a 'admin_categorias.jsp' -->
                    </div>
                </form>

            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
