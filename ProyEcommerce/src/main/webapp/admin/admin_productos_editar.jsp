<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="Controller.ProductoController"%>
<%@page import="Entity.Producto"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ProductoController cProducto = new ProductoController();
    Producto producto = cProducto.obtenerProducto(Integer.parseInt(request.getParameter("productoid")));
%>

<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Administrador - Modificación de Producto</title>
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
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-12 rounded p-4" style="background: rgba(255,255,255, 0.85); backdrop-filter: blur(5px)">
                    <h2 class="text-center mb-3">Modificar Registro</h2>
                    <div class="text-center mb-3">
                        <img width="180" src="/BodegaJavaWeb/ImgController?id=<%= producto.getId()%>" alt="<%= producto.getNombre()%>">
                    </div>
                    <form action="/BodegaJavaWeb/ProductoController" method="POST" autocomplete="off" enctype="multipart/form-data">
                        <input type="hidden" name="action" value="editar-producto">

                        <!-- ID -->
                        <div class="mb-3 row">
                            <label for="txtId" class="col-sm-2 col-form-label">ID</label>
                            <div class="col-sm-10">
                                <input type="text" name="producto-id" readonly class="form-control-plaintext" id="txtId" value="<%= producto.getId()%>">
                            </div>
                        </div>

                        <!-- Nombre -->
                        <div class="mb-3 row">
                            <label for="txtNameProd" class="col-sm-2 col-form-label">Nombre</label>
                            <div class="col-sm-10">
                                <input type="text" name="producto-nombre" class="form-control" id="txtNameProd" value="<%= producto.getNombre()%>" required>
                            </div>
                        </div>

                        <!-- Imagen -->
                        <div class="mb-3 row">
                            <label for="txtImgProd" class="col-sm-2 col-form-label">Imagen</label>
                            <div class="col-sm-10">
                                <input type="file" name="producto-imagen" class="form-control" id="txtImgProd" accept=".png, .jpg, image/png, image/jpeg, .webp">
                            </div>
                        </div>

                        <!-- Descripción -->
                        <div class="mb-3 row">
                            <label for="txtDescProd" class="col-sm-2 col-form-label">Descripción</label>
                            <div class="col-sm-10">
                                <input type="text" name="producto-descripcion" required class="form-control" id="txtDescProd" value="<%= producto.getDescripcion()%>">
                            </div>
                        </div>

                        <!-- Categoría -->
                        <div class="mb-3 row">
                            <label for="txtCateProd" class="col-sm-2 col-form-label">Categoría</label>
                            <div class="col-sm-10">
                                <select class="form-select" id="txtCateProd" name="producto-categoria" required>
                                    <c:forEach var="categoria" items="${listaCategorias}">
                                        <option value="${categoria.nombre}">${categoria.nombre}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <!-- Proveedor -->
                        <div class="mb-3 row">
                            <label for="txtProvProd" class="col-sm-2 col-form-label">Proveedor</label>
                            <div class="col-sm-10">
                                <input type="text" name="producto-proveedor" class="form-control" id="txtProvProd" value="<%= producto.getProveedor()%>" required>
                            </div>
                        </div>

                        <!-- Precio -->
                        <div class="mb-3 row">
                            <label for="txtCostProd" class="col-sm-2 col-form-label">Precio</label>
                            <div class="col-sm-10">
                                <input type="text" name="producto-precio" class="form-control" id="txtCostProd" pattern="^\d*\.?\d+$" value="<%= String.format("%.2f", producto.getPrecio())%>" required>
                            </div>
                        </div>

                        <!-- Stock -->
                        <div class="mb-3 row">
                            <label for="txtCantProd" class="col-sm-2 col-form-label">Stock</label>
                            <div class="col-sm-10">
                                <input type="number" name="producto-stock" class="form-control" id="txtCantProd" min="0" max="1000" value="<%= producto.getStock()%>" required>
                            </div>
                        </div>

                        <!-- Botones -->
                        <div class="text-center">
                            <input type="submit" class="btn btn-success mt-3" value="Modificar">
                            <a class="btn btn-secondary ms-2 mt-3" href="/BodegaJavaWeb/admin/admin_productos.jsp">Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
