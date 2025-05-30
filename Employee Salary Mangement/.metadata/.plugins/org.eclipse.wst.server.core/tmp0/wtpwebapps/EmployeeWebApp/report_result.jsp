<%@ page import="java.util.List" %>
<%@ page import="com.model.Employee" %>
<%
String action = request.getParameter("action");
List<Employee> employees = (List<Employee>) session.getAttribute("filteredEmployees");

if (employees == null) {
out.println("<h3>No data found. Please generate a report first.</h3>");
return;
}
%>
<html>
<head>
    <title>Report Results</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: lightblue;
            padding: 30px;
            margin: 0;
            min-height: 100vh;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            padding: 40px;
        }
        
        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
            font-size: 2.2rem;
            font-weight: 600;
            border-bottom: 3px solid #3498db;
            padding-bottom: 15px;
        }
        
        p {
            margin: 20px 0;
            font-size: 18px;
            color: #34495e;
            background-color: #ecf0f1;
            padding: 15px;
            border-radius: 8px;
            border-left: 4px solid #3498db;
        }
        
        table {
            width: 100%;
            border: none;
            border-collapse: collapse;
            background-color: white;
            margin: 30px 0;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        
        th {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            padding: 18px 15px;
            text-align: left;
            font-weight: 600;
            font-size: 16px;
            letter-spacing: 0.5px;
            border: none;
        }
        
        td {
            padding: 15px;
            border-bottom: 1px solid #ecf0f1;
            color: #2c3e50;
            font-size: 15px;
        }
        
        tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        
        tr:hover {
            background-color: #e3f2fd;
            transform: scale(1.01);
            transition: all 0.3s ease;
        }
        
        .button-container {
            text-align: center;
            margin-top: 40px;
            padding-top: 30px;
            border-top: 1px solid #ecf0f1;
        }
        
        .back-button {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 16px 32px;
            text-decoration: none;
            border-radius: 50px;
            font-size: 16px;
            font-weight: 600;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
        }
        
        .back-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.6s;
        }
        
        .back-button:hover::before {
            left: 100%;
        }
        
        .back-button:hover {
            background: linear-gradient(135deg, #5a67d8 0%, #667eea 100%);
            transform: translateY(-3px);
            box-shadow: 0 12px 35px rgba(102, 126, 234, 0.4);
        }
        
        .back-button:active {
            transform: translateY(-1px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.3);
        }
        
        .button-icon {
            font-size: 18px;
            font-weight: bold;
            transition: transform 0.3s ease;
        }
        
        .back-button:hover .button-icon {
            transform: translateX(-3px);
        }
        
        .button-text {
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        
        @media (max-width: 768px) {
            body {
                padding: 15px;
            }
            
            .container {
                padding: 25px;
            }
            
            h2 {
                font-size: 1.8rem;
            }
            
            table {
                font-size: 14px;
            }
            
            th, td {
                padding: 12px 8px;
            }
        }
        .back-link {
    display: inline-block;
    padding: 8px 12px;
    background-color: #f0f0f0;
    color: #333;
    text-decoration: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-weight: bold;
    transition: background-color 0.3s, color 0.3s;
}

.back-link:hover {
    background-color: #ddd;
    color: #000;
}
        
    </style>
</head>
<body>
<div class="container">
    <h2>Report Results</h2>

    <p>Filter Type: <b><%= action %></b></p>

    <table border="1" cellpadding="10" cellspacing="0">
<tr>
<th>Emp No</th>
<th>Name</th>
<th>Date of Joining</th>
<th>Gender</th>
<th>Salary</th>
</tr>
<%
for(Employee e : employees) {
%>
<tr>
<td><%= e.getId() %></td>
<td><%= e.getName() %></td>
<td><%= e.getDoj() %></td>
<td><%= e.getGender() %></td>
<td><%= e.getSalary() %></td>
</tr>
<%
}
%>
</table>
<a href="report_form.jsp?action=<%=action%>" class="back-link">&#8592; Back to Filter</a>



</body>
</html>