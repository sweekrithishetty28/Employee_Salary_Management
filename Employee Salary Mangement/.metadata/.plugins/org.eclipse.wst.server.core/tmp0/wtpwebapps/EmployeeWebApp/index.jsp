<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Employee Salary Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
        html, body {
            margin: 0; 
            padding: 0; 
            height: 100%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
             background-color: lightblue;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            width: 100vw;
        }

        body {
            align-items: center;
            justify-content: flex-start;
            padding: 20px 0;
            box-sizing: border-box;
        }

        .header {
            background: rgba(255, 255, 255, 0.95);
            color: #333;
            padding: 30px 40px;
            border-radius: 15px;
            text-align: center;
            width: 90vw;
            max-width: 900px;
            box-sizing: border-box;
            margin-bottom: 40px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
        }

        .header h1 {
            margin: 0;
            font-size: 2.5rem;
            color: #2c3e50;
            font-weight: 700;
        }

        .header p {
            margin-top: 15px;
            font-size: 1.2rem;
            color: #5d6d7e;
        }

        .header .info {
            margin-top: 20px;
            font-size: 1.1rem;
            color: #34495e;
            font-weight: 500;
        }

        .nav-container {
            width: 90vw;
            max-width: 900px;
            display: flex;
            flex-direction: column;
            gap: 30px;
            align-items: center;
            flex-grow: 1;
        }

        .nav-row {
            display: flex;
            justify-content: center;
            gap: 40px;
            width: 100%;
            flex-wrap: nowrap;
        }

        .nav-card {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
            width: 220px;
            height: 140px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-decoration: none;
            color: #2980b9;
            font-weight: 600;
            font-size: 1.25rem;
            cursor: pointer;
            transition: all 0.3s ease;
            user-select: none;
            border: 2px solid transparent;
        }

        .nav-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.25);
            background: rgba(255, 255, 255, 1);
            border-color: #3498db;
            color: #1f4e79;
        }

        .loading-overlay {
            display: none;
            position: fixed;
            top: 0; 
            left: 0;
            width: 100%; 
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }

        .loading-content {
            background: #fff;
            padding: 30px 40px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }

        .spinner {
            width: 40px;
            height: 40px;
            border: 4px solid #ecf0f1;
            border-top: 4px solid #3498db;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin: 0 auto 15px;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        @media (max-width: 720px) {
            .nav-row {
                flex-wrap: wrap;
                gap: 20px;
                justify-content: center;
            }

            .nav-card {
                width: 45vw;
                max-width: 220px;
                height: 120px;
                font-size: 1.1rem;
            }
        }

      
    </style>
</head>
<body>

<%
    // Current date formatting
    Date now = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("EEEE, MMMM dd, yyyy");
    String currentDate = sdf.format(now);
%>

<div class="header">
    <h1>Employee Salary Management System</h1>
    <p>Manage employee records, update details, and generate reports easily</p>
    <div class="info">Date: <strong><%= currentDate %></strong></div>
</div>

<div class="nav-container">
    <!-- First row: Add, Update, Delete -->
    <div class="nav-row">
        <a href="empadd.jsp" class="nav-card">Add Employee</a>
        <a href="empupdate.jsp" class="nav-card">Update Employee</a>
        <a href="empdelete.jsp" class="nav-card">Delete Employee</a>
    </div>

    <!-- Second row: View, Reports -->
    <div class="nav-row" style="max-width: 480px; justify-content: space-evenly;">
        <a href="empdisplay.jsp" class="nav-card">View Employees</a>
        <a href="reports.jsp" class="nav-card">Reports</a>
    </div>
</div>

<!-- Loading overlay -->
<div class="loading-overlay" id="loadingOverlay">
    <div class="loading-content">
        <div class="spinner"></div>
        <p>Loading, please wait...</p>
    </div>
</div>



<script>
    // Show loading overlay on nav-card click
    document.querySelectorAll('.nav-card').forEach(card => {
        card.addEventListener('click', () => {
            document.getElementById('loadingOverlay').style.display = 'flex';
        });
    });
</script>

</body>
</html>