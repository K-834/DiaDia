
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>DiaDia</title>
        <link rel="stylesheet" href="styles.css">
        <!-- ICON CDN (BOOTSTRAP ICON) -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


        <link rel="stylesheet" href="index.css">
        <%--<link rel="stylesheet" href="/AV1_Proyecto/ViewCliente/styles.css">
        <link rel="stylesheet" href="/AV1_Proyecto/ViewCliente/IniciarSesion/CitaEstilo.css">
        <link rel="stylesheet" href="/AV1_Proyecto/ViewCliente/IniciarSesion/modalG.css">
        <!-- ICON CDN (BOOTSTRAP ICON) -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="index.css">
        <script src="https://kit.fontawesome.com/cefc19ce63.js" crossorigin="anonymous"></script>--%>   
        <style>
            .popup-login img {
                position: absolute;
                top: -60px; /* Ajusta la posición vertical según sea necesario */
                left: 50%;
                transform: translateX(-50%);
                width: 40%;
                
                z-index: 5; /* Imagen detrás del formulario */
            }
        </style>
    </head>
    <body>

    <center>
        <br>
        <br>
        <br>
    </center>

    <div class="bg-black-wall hidden" id="bg-black-wall" data-black="black">

    </div>
    <div class="popup popup-login" id="popup-login">
        <img src="assets/img/fondo/Logo_diadia.png" alt="alt"/>
        <form action="UsuarioController" class="form" method="POST" value="login">
            <br>
            <input hidden type="text" name="action" value="login">
            <input type="email" placeholder="Correo" name="correo" required>
            <input type="password" placeholder="Contraseña" name="password" required>
            <br>
            <button type="submit">INGRESAR</button>
            <p>¿No tienes cuenta? <span data-registrate="registrate">Regístrate</span></p>
        </form>
    </div>

    <div class="bg-black-wall hidden" id="bg-black-wall" data-black="black"></div>


    <div class="popup popup-registrate hidden" id="popup-registrate" style="height: 520px;">
        <form action="UsuarioController" class="form" method="POST">
            <input hidden type="text" name="action" value="register">
            <h1 style="margin-top: 20px">REGISTRO</h1>
            <input type="text" placeholder="Ingrese su nombre" name="nombre" required>
            <input type="text" placeholder="Ingrese apellido" name="apellido" required>
            <input type="email" placeholder="Ingrese correo" name="correo" required>
            <input type="password" placeholder="Ingrese contraseña" name="password" required>
            <button>REGISTRATE</button>
            <div style="text-align: center; margin-top: 5px;">
                <a href="index.jsp" style="color: #000; display: flex; justify-content: center; align-items: center;">Tengo cuenta - Login</a>
            </div>

        </form>
    </div>

    <script src="index.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="script.js"></script>
</body>
</html>
