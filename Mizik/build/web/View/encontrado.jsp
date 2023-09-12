<%-- 
    Document   : encontrado
    Created on : 9/09/2023, 04:47:03 PM
    Author     : lucciano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="img/principal.ico" />
        <title>Principal</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/bb229f5329.js" crossorigin="anonymous"></script>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Maven+Pro&display=swap');
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                text-decoration: none;
                font-family: 'Maven Pro', sans-serif;
            }

            header{
                width: 100%;
                height: 80px;
                background: #f5f5f5;
                display: flex;
                align-items: center;
                position: fixed;
                top: 0;
                z-index: 200;
            }

            main{
                margin-top: 80px;
                padding: 20px;
            }

            .icon_menu{
                width: 100px;
                height: 40px;
                display: flex;
                justify-content: center;
                align-items: center;
                transform: translateX(10px);
                background: #f5f5f5;
            }

            .icon_menu i{
                font-size: 35px;
                cursor: pointer;
            }

            .artist-card {
                width: 30%;
                display: inline-block;
                text-align: center;
            }

            .circular-image {
                border-radius: 50%;
                max-width: 100%;
            }

            .search-icon {
                border: 2px solid #ccc;
                color: #fff;
                background-color: #ccc;
                border-radius: 0 17px 17px 0;
                cursor: pointer;
                padding: 14px 19px;
            }
        </style>
    </head>
    <body>
        <%
            String q = request.getParameter("txtBuscar");
        %>
        <div>

            <h1> <%=q%> </h1>

        </div>
    </body>
</html>
