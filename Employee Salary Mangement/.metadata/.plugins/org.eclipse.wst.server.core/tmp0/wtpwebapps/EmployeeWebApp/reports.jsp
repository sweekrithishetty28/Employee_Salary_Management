<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Reports</title>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; }
body { 
    font-family: Arial, sans-serif; 
    background: #e3f2fd;
    min-height: 100vh;
    padding: 20px;
}
.container { 
    width: 100%; 
    max-width: 600px; 
    margin: 0 auto; 
    display: flex;
    flex-direction: column;
    gap: 20px;
}
.header {
    background: #2d3748;
    color: white;
    padding: 20px;
    border-radius: 10px;
    text-align: center;
}
.reports-section {
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}
h2 {
    color: #2d3748;
    margin-bottom: 20px;
    text-align: center;
}
.report-link {
    display: block;
    background: #1976d2;
    color: white;
    text-decoration: none;
    padding: 15px 20px;
    margin-bottom: 15px;
    border-radius: 8px;
    transition: all 0.3s ease;
    font-weight: 500;
    text-align: center;
}
.report-link:hover {
    background: #1565c0;
    transform: translateY(-2px);
    box-shadow: 0 4px 15px rgba(25, 118, 210, 0.4);
}
.report-link:last-child {
    margin-bottom: 0;
}
.back-link {
    display: inline-block;
    color: white;
    text-decoration: none;
    background: rgba(255,255,255,0.2);
    padding: 10px 20px;
    border-radius: 8px;
    margin-top: 20px;
    transition: all 0.3s ease;
    font-weight: 500;
    text-align: center;
}
.back-link:hover {
    background: rgba(255,255,255,0.3);
    transform: translateX(-5px);
}

</style>
</head>
<body>
    <div class="header">
        <h1>Employee Reports</h1>
        <a href="index.jsp" class="back-link">← Back to Home</a>
    </div>
    
    <div class="container">
        <div class="reports-section">
            <h2>Available Reports</h2>
            
            <a href="report_form.jsp?action=NameFilter" class="report-link">
                 Employees with Name Starting with Letter
            </a>
            
            <a href="report_form.jsp?action=ServiceFilter" class="report-link">
                Employees with N or More Years of Service
            </a>
            
            <a href="report_form.jsp?action=SalaryFilter" class="report-link">
                 Employees with Salary Greater Than
            </a>
        </div>
        
       
    </div>
</body>
</html>