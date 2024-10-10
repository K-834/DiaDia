<%@page import="Entity.Categoria"%>
<%@page import="Controller.CategoriaController"%>

<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CategoriaController cCategoria = new CategoriaController();
    List<Categoria> categorias = cCategoria.obtenerCategorias();
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
                <div class="col-md-12 rounded p-3" style="background: rgba(255,255,255, 0.85);backdrop-filter: blur(5px)">
                    <h2 class="text-center">Tabla de Categorias</h2>
                    <div class="pb-3">
                        <a href="/BodegaJavaWeb/admin/admin_categorias_agregar.jsp" class="btn btn-primary">Agregar nueva categoria</a>
                    </div>

                   <table class="table container-fluid mt-2 table-striped">
                    <thead class="table-warning">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Descripción</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (categorias != null) { %> 
                            <% for(Categoria categoria : categorias) { %> 
                                <tr>
                                    <td><%=categoria.getId()%></td> 
                                    <td><%=categoria.getNombre()%></td>
                                    <td><%=categoria.getDescripcion()%></td> 
                                    <td>
                                        <a href="/BodegaJavaWeb/admin/admin_categorias_editar.jsp?categoriaid=<%=categoria.getId()%>" class="btn btn-success mb-1">Editar</a>

                                        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop<%=categoria.getId()%>">
                                            Eliminar
                                        </button>
                                           
                                        
                                    </td>
                                </tr>
                            <% } %>
                        <% } else { %>
                            <tr>
                                <td colspan="3" class="text-center">No hay categorías disponibles.</td> 
                            </tr>
                        <% } %>
                    </tbody>
                </table>
                    <% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
    <p style="color:red;"><%= error %></p>
<% } %>

                    
                </div>
            </div>
        </div>
        <% for(Categoria categoria : categorias) { %> 
            <!-- Modal -->
            <div class="modal fade" id="staticBackdrop<%=categoria.getId()%>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Advertencia!</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            ¿Seguro que deseas eliminar la categoría <%=categoria.getNombre()%>? Los datos eliminados no podrán recuperarse. 
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <a href="/BodegaJavaWeb/CategoriaController?action=delete&categoriaid=<%=categoria.getId()%>" type="button" class="btn btn-danger">Eliminar categoría</a> 
                        </div>
                    </div>
                </div>
            </div>
        <% } %>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
