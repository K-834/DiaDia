<%@page import="Entity.CarritoItem"%>
<%@page import="Entity.Usuario"%>
<%
    Usuario usuario = (Usuario)session.getAttribute("usuario");
    if(usuario == null){
    request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-788SX13VCY"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-788SX13VCY');
</script>
<header>
    <div class="header-left">
        <div class="logo-contenedor">
            <a href="index.jsp" id="logo-header"><img src="assets/img/perfumes/perfume-logo.png" alt="logo"></a>
        </div>
        <a href="productos.jsp">Productos</a>
        <% if(usuario != null) {%>
        <% if (usuario.getUsuarioTipo().equals("ADMINISTRADOR")){%>
         <a href="admin/admin_home.jsp">ADMIN</a>
        <% } %>
                <a href="UsuarioController?action=logout">Cerrar Sesion</a>
                <a class="nombre-usuario">Hola <%=usuario.getNombre()%>!</a>
            
        <% } %>
    </div>
    <div class="header-right">
        <div class="buscador">
            <button data-buscarproducto="buscarproducto"><i class="bi bi-search" data-buscarproducto="buscarproducto"></i></button>
            <input type="text" name="buscador-txt" id="producto-buscado" placeholder="Buscar productos...">
        </div>
        <% if(usuario != null) {%>
        <a href="carrito.jsp" class="carrito" id="carrito-header" ><i class="bi bi-cart2"></i></a>
            <a href="perfil.jsp" class="user"><i class="bi bi-person-circle"></i></a>
        <% } else { %>
            <button class="carrito" id="carrito-header" data-login="login"><i class="bi bi-cart2" data-login="login"></i></button>
            <button class="user" data-login="login"><i class="bi bi-person-circle" data-login="login"></i></button>
        <% } %>


    </div>
</header>
