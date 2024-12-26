<%-- 
    Document   : index
    Created on : Dec 25, 2024, 6:48:02 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page Karyawan</title>
    </head>
    <body>
        <main>
            <h1>Selamat datang di</h1>
            <h1>Hotel Management System!</h1>
            
            <div class="login">
                <form action="process.jsp" method="post">
                    <label for="username">username:</label>
                    <input type="text" id="username" name="username" required>
                    <br><br>
                    <label for="password">password:</label>
                    <input type="password" id="password" name="password" required>
                    <br><br>
                    <button type="enter">Enter</button>
            </div>
        </main>
    </body>
</html>
