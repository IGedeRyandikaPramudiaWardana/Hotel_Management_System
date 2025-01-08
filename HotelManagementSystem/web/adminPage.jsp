<%-- 
    Document   : adminPage
    Created on : Dec 28, 2024, 7:17:09 PM
    Author     : Krisna Anggaradana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Hotel Management</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #3498db;
        }
        .navbar {
            background-color: #007bff;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }
        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-size: 16px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #34495e;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1c40f;
            color: white;
        }
        .footer {
            margin-top: 30px;
            text-align: center;
            font-size: 14px;
            color: #7f8c8d;
        }
    </style>
</head>
<body>
    

    <div class="container">
       

        <table>
            <thead>
                <tr>
                    <th>Id </th>
                    <th>Nama</th>
                    <th>Pasword</th>
                    <th>Akses</th>
                    
                </tr>
            </thead>
            <tbody>
    
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    
                </tr>
               
            </tbody>
        </table>
    </div>

    <div class="footer">
        © 2024 Hotel Management System | All Rights Reserved
    </div>

    <script>
        function logout() {
            if (confirm("Are you sure you want to logout?")) {
                window.location.href = "signin.jsp"; // Redirect to login page
            }
        }

        function exitApp() {
            if (confirm("Are you sure you want to exit?")) {
                window.close();
            }
        }
    </script>
</body>
</html>