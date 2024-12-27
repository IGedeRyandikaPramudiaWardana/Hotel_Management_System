<%-- 
    Document   : detailPembayaran
    Created on : Dec 27, 2024, 6:06:23 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail Pembayaran</title>
    <style>
        /* Body Style */
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 80%;
            max-width: 1000px;
            padding: 20px;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        /* Input dan Button */
        .form-group {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        input[type="text"] {
            padding: 10px;
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        /* Tabel */
        .table-container {
            margin-top: 20px;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        /* Sembunyikan data awal */
        tbody tr {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Detail Pembayaran</h1>
        
        <!-- Form Cari Data -->
        <div class="form-group">
            <label for="search">Cari Berdasarkan Tanggal Check-OUT:</label>
            <input type="text" id="search" placeholder="YYYY-MM-DD">
            <button onclick="showTable()">Cari</button>
        </div>

        <!-- Tabel Detail Pembayaran -->
        <div class="table-container">
            <table id="paymentTable">
                <thead>
                    <tr>
                        <th>No. Urut</th>
                        <th>Nama</th>
                        <th>Nomor Telepon</th>
                        <th>Kewarganegaraan</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>ID</th>
                        <th>Alamat</th>
                        <th>Check-IN</th>
                        <th>Check-OUT</th>
                        <th>Harga/Hari</th>
                        <th>Total Harga</th>
                    </tr>
                </thead>
                <tbody id="tableBody">
                    <tr>
                        <td>1</td>
                        <td>Ahmad</td>
                        <td>08123456789</td>
                        <td>Indonesia</td>
                        <td>Laki-laki</td>
                        <td>ahmad@email.com</td>
                        <td>123456</td>
                        <td>Jl. Merdeka No. 10</td>
                        <td>2024-12-20</td>
                        <td>2024-12-27</td>
                        <td>Rp 500,000</td>
                        <td>Rp 3,500,000</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Indah</td>
                        <td>08129876543</td>
                        <td>Indonesia</td>
                        <td>Perempuan</td>
                        <td>indah@email.com</td>
                        <td>654321</td>
                        <td>Jl. Sudirman No. 15</td>
                        <td>2024-12-21</td>
                        <td>2024-12-28</td>
                        <td>Rp 700,000</td>
                        <td>Rp 4,900,000</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        // Fungsi untuk menampilkan data berdasarkan input tanggal
        function showTable() {
            const searchInput = document.getElementById('search').value; // Ambil nilai input
            const rows = document.querySelectorAll('#tableBody tr'); // Ambil semua baris tabel
            let found = false; // Status apakah data ditemukan

            // Validasi input kosong
            if (!searchInput) {
                alert('Silakan masukkan tanggal terlebih dahulu!');
                return;
            }

            // Iterasi melalui setiap baris data
            rows.forEach(row => {
                const checkoutDate = row.cells[9].innerText; // Kolom Check-OUT
                if (checkoutDate === searchInput) {
                    row.style.display = ''; // Tampilkan baris jika cocok
                    found = true; // Tandai data ditemukan
                } else {
                    row.style.display = 'none'; // Sembunyikan baris jika tidak cocok
                }
            });

            // Jika tidak ditemukan
            if (!found) {
                alert('Data tidak ditemukan untuk tanggal: ' + searchInput);
            }
        }
    </script>
</body>
</html>
