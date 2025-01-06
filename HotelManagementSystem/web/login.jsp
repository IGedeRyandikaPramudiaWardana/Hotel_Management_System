<%-- 
    Document   : index
    Created on : Dec 25, 2024, 6:48:02 PM
    Author     : Ryandika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page Karyawan</title>
        
        <style>
            /* Reset default styles */
            body, h1, h2, form, input, button {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: Arial, sans-serif;
                background: linear-gradient(to bottom, #74ebd5, #acb6e5);
                color: #333;
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            main {
                text-align: center;
                background: #fff;
                padding: 30px 20px;
                border-radius: 8px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
                width: 100%;
                max-width: 400px;
            }

            h1 {
                font-size: 2rem;
                color: #333;
                margin-bottom: 20px;
            }

            h2 {
                font-size: 1.5rem;
                margin-bottom: 20px;
                color: #555;
            }

            form {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            label {
                font-weight: bold;
                font-size: 1rem;
                margin-bottom: 5px;
                color: #444;
            }

            input {
                width: 100%;
                max-width: 300px;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 1rem;
            }

            button {
                padding: 10px 20px;
                font-size: 1rem;
                font-weight: bold;
                color: #fff;
                background-color: #4CAF50;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            button:hover {
                background-color: #45a049;
            }

            .login {
                text-align: left;
            }

        </style>
    </head>
    <body>
        <main>
            <h1>Selamat datang di</br>
                Hotel Management System!
            </h1>
            <h2>Silakan Login</h2>
            
            <div class="login">
                <form action="<%= request.getContextPath() %>/prosesLogin" method="post">
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
