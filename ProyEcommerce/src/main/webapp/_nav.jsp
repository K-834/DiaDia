<%@page import="Entity.Categoria"%>
<%@page import="java.util.List"%>
<%
    List<Categoria> listaCategorias = (List<Categoria>) session.getAttribute("listaCategorias");
    
%>


<nav class="categorias">
    

        <c:forEach var="categoria" items="${listaCategorias}">
            <a href="ProductoController?action=filtrarPorCategoria&categoriaNombre=${categoria.nombre}">${categoria.nombre}</a>
        </c:forEach>


</nav>
        
<style>
    .categorias a {
        text-decoration: none;      
        color: white;              
        font-size: 16px;           
        font-weight: bold;         
        padding: 5px 10px;           
        border-radius: 5px;          
        transition: background-color 0.3s ease; 
    }

    .categorias a:hover {
        color: #000;      
    }
</style>
        
        
    
