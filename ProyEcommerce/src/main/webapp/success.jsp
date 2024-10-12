<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success</title>
        <link rel="stylesheet" href="styles.css">
        <!-- ICON CDN (BOOTSTRAP ICON) -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    </head>
    <body>

        <div class="bg-black-wall" id="bg-black-wall-finalizacion" data-compraexito="compraexito">

        </div>
         <div class="popup popup-star" id="popup-star" style="height: 40%;">
            <img src="assets/img/pedido/Star.png" alt="star">
            <h1>¡Muchas gracias!</h1>
            <p>tu pedido está siendo procesado</p> 
            
            <p> "Click" en la pantalla para continuar</p>
            <p><b style="color: red;">Recuerda que tienes 24 horas</b></p>
            <p><b style="color: red;">para cancelar tu pedido</b></p>
        </div>
<%@include file="_footer.jsp" %>
