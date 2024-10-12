<%@page import="Entity.Categoria"%>
<%@page import="java.util.List"%>
<%
    List<Categoria> listaCategorias = (List<Categoria>) session.getAttribute("listaCategorias");
    
%>


 <nav class="categorias">
    <c:forEach var="categoria" items="${listaCategorias}">
        <a href="productos.jsp?categoria=${categoria.nombre}">
            <button>${categoria.nombre}</button>
        </a>
    </c:forEach>
</nav>
