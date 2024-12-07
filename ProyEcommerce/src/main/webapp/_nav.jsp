<%@page import="Entity.Categoria"%>
<%@page import="java.util.List"%>
<%
    List<Categoria> listaCategorias = (List<Categoria>) session.getAttribute("listaCategorias");
    
%>


<nav class="categorias">
    <c:forEach var="categoria" items="${listaCategorias}">
        <button class="btn-categoria" data-categoria="${categoria.nombre}">
            ${categoria.nombre}
        </button>
    </c:forEach>
</nav>