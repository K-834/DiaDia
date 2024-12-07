<%@ page import="Entity.Pedido" %>
<%@ page import="java.util.List" %>
<%@ page import="Controller.PedidoController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    PedidoController cPedido = new PedidoController();
%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Perfil</title>
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="sweetalert2.min.js"></script>
        <link rel="stylesheet" href="sweetalert2.min.css">
        <style>
            button {
                font-family: 'Average Sans';
                color: var(--colorPerfume);
                display: block;
                width: 100%;
                border-radius: 5px;
                font-size: 0.60rem;
                padding: 0.55em 0;
                margin: 0.5em 0;
                cursor: pointer;
                text-align: center;
                text-decoration: none;
                border: 2px solid rgba(128,128,128,0.25);
            }
            #cancelation-poput-btn:hover {
                background-color: #3e28d1;
                color: white;
                transition: linear;
            }

        </style>
    </head>
    <body>
        <%@include file="_header.jsp" %>
        <main class="main-perfil">
            <%@include file="_nav.jsp" %>
            <h1>Mi Perfil</h1>
            <div class="perfil-campos">
                <div class="perfil-campo">
                    <label for="perfil-nombre">NOMBRE</label>
                    <p class="perfil-input" id="perfil-nombre"><%=usuario.getNombre()%></p>
                </div>
                <div class="perfil-campo">
                    <label for="perfil-apellido">APELLIDO</label>
                    <p class="perfil-input" id="perfil-apellido"><%=usuario.getApellido()%></p>
                </div>
                <div class="perfil-campo">
                    <label for="perfil-correo">CORREO</label>
                    <p class="perfil-input" id="perfil-correo"><%=usuario.getCorreo()%></p>
                </div>
                <div class="perfil-campo">
                    <label for="perfil-documento">DOCUMENTO</label>
                    <p class="perfil-input" id="perfil-documento"><%=(usuario.getDocumentoNumero() != null) ? usuario.getDocumentoNumero() : ""%></p>
                </div>
                <div class="perfil-campo">
                    <label for="perfil-telefono">TELEFONO</label>
                    <p class="perfil-input" id="perfil-telefono"><%=(usuario.getTelefono() != null) ? usuario.getTelefono() : ""%></p>
                </div>
                <div class="perfil-campo">
                    <button class="btn-editar-datos" data-abrireditardatos="abrireditardatos">EDITAR DATOS</button>
                </div>
            </div>
            <h2>PEDIDOS REALIZADOS</h2>
            <table class="tabla-pedidos-perfil">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Fecha</th>
                        <th>Hora</th>
                        <th>Codigo</th>
                        <th>Pago Total</th>
                        <th>Estado</th>
                        <th colspan="2">Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <% List<Pedido> pedidos = cPedido.obtenerPedidos(usuario.getId()); %>
                    <% for (int i = 0; i < pedidos.size(); i++) {%>
                    <tr>
                        <td><%=i + 1%></td>
                        <td><%=pedidos.get(i).getFecha().split(" ")[0]%></td>
                        <td><%=pedidos.get(i).getFecha().split(" ")[1]%></td>
                        <td><%=pedidos.get(i).getCodigoUnico()%></td>
                        <td>S/ <%=String.format("%.2f", pedidos.get(i).getTotalPago())%></td>
                        <td><%=pedidos.get(i).getEstado()%></td>
                        <td><a href="PedidoController?pedidoid=<%=pedidos.get(i).getId()%>"><i class="bi bi-arrow-right-square-fill"></i>Ver</a></td>
                        <td>
                            <form action="/BodegaJavaWeb/PedidoController" method="POST" onsubmit="return validateCancellation(event, '<%=pedidos.get(i).getFecha()%>', '<%=pedidos.get(i).getEstado()%>');">
                                <input type="hidden" name="action" value="actualizar-estado">
                                <input type="hidden" name="pedido-id" value="<%=pedidos.get(i).getId()%>">
                                <input type="hidden" name="estado-pedido" value="CANCELADO">
                                <input type="hidden" name="vista" value="extra">
                                <button type="submit"><i class="bi bi-x-circle-fill"></i>Cancelar</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                    <% if (pedidos.size() == 0) {%>
                    <tr>
                        <td class="txt-sinpedidos" colspan="7">Aún no has realizado ningún pedido!</td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </main>
        <div class="bg-black-wall hidden" id="bg-black-wall" data-black="black"></div>
        <div class="popup popup-editar-datos hidden" id="popup-editar-datos">
            <h1>Datos de Usuario</h1>
            <input class="hidden" id="id-editar-datos" type="text" value="<%=usuario.getId()%>">
            <input class="hidden" id="correo-editar-datos" type="text" value="<%=usuario.getCorreo()%>">
            <input id="documento-editar-datos" type="text" placeholder="Número de DNI" value="<%=(usuario.getDocumentoNumero() != null) ? usuario.getDocumentoNumero() : ""%>">
            <input id="telefono-editar-datos" type="text" placeholder="Número de Teléfono" value="<%=(usuario.getTelefono() != null) ? usuario.getTelefono() : ""%>">
            <input class="password-editar-datos" id="password-editar-datos" type="password" placeholder="Contraseña">
            <p class="password-fail hidden">*Contraseña incorrecta</p>
            <button data-editardatos="editardatos">EDITAR DATOS</button>
            <p class="ad-editar-datos">*Para editar tus datos es necesario que ingreses tu contraseña</p>
        </div>

        <div class="popup hidden" id="cancelation-popup" style="height: 35%; width: 800px;">
            <div style="margin: 20px">
                <h2 id="cancelation-title">Cancelación de Pedido</h2>
                <p id="cancelation-message">Ya ha pasado el plazo suficiente para cancelar el pedido.</p>
                <button onclick="closePopup()" id="cancelation-poput-btn" style="width: center/50%">Aceptar</button>
            </div>
        </div>



        <script>
            function validateCancellation(event, fechaPedido, estadoPedido) {
                const pedidoDate = new Date(fechaPedido);
                const currentDate = new Date();
                const hoursDifference = (currentDate - pedidoDate) / (1000 * 60 * 60);

                console.log("Fecha del pedido:", fechaPedido);
                console.log("Diferencia de horas:", hoursDifference);

                if (estadoPedido === 'CANCELADO') {
                    event.preventDefault();
                    document.getElementById("cancelation-title").innerText = "Cancelación de Pedido";
                    document.getElementById("cancelation-message").innerText = "El pedido ya está cancelado.";
                    document.getElementById("cancelation-popup").classList.remove("hidden");
                    return false;
                } else if (hoursDifference > 24) {
                    event.preventDefault();
                    document.getElementById("cancelation-title").innerText = "Cancelación de Pedido";
                    document.getElementById("cancelation-message").innerText = "Ya ha pasado el plazo suficiente para cancelar el pedido.";
                    document.getElementById("cancelation-popup").classList.remove("hidden");
                    return false;
                }

                return true;
            }
            
            function closePopup() {
                document.getElementById("cancelation-popup").classList.add("hidden");
            }

        </script>

        <%@include file="_footer.jsp" %>
    </body>
</html>
