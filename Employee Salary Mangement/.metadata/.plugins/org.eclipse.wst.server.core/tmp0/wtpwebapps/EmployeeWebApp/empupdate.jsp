<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.model.Employee, com.dao.EmployeeDAO, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Employee</title>
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
.form-section {
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}
label { 
    font-weight: 600;
    color: #2d3748;
    display: block; 
    margin-top: 15px;
    margin-bottom: 5px;
}
input, select { 
    width: 100%; 
    padding: 12px; 
    margin-bottom: 15px; 
    border: 2px solid #e2e8f0;
    border-radius: 8px;
    font-size: 14px;
    transition: all 0.3s ease;
}
input:focus, select:focus {
    outline: none;
    border-color: #1976d2;
    box-shadow: 0 0 0 3px rgba(25, 118, 210, 0.1);
}
.submit-btn { 
    background: #1976d2;
    color: white; 
    border: none; 
    padding: 15px 30px;
    border-radius: 8px;
    cursor: pointer; 
    font-size: 16px;
    font-weight: 600;
    width: 100%;
    margin-top: 20px;
    transition: all 0.3s ease;
}
.submit-btn:hover {
    background: #1565c0;
    transform: translateY(-2px);
    box-shadow: 0 4px 15px rgba(25, 118, 210, 0.4);
}
.search-btn {
    background: #ff9800;
    color: white; 
    border: none; 
    padding: 15px 30px;
    border-radius: 8px;
    cursor: pointer; 
    font-size: 16px;
    font-weight: 600;
    width: 100%;
    margin-top: 20px;
    transition: all 0.3s ease;
}
.search-btn:hover {
    background: #f57c00;
    transform: translateY(-2px);
    box-shadow: 0 4px 15px rgba(255, 152, 0, 0.4);
}
.reset-btn {
    background: #666;
    color: white; 
    border: none; 
    padding: 15px 30px;
    border-radius: 8px;
    cursor: pointer; 
    font-size: 16px;
    font-weight: 600;
    width: 100%;
    margin-top: 10px;
    transition: all 0.3s ease;
}
.reset-btn:hover {
    background: #555;
    transform: translateY(-2px);
}
.error { 
    background: #fed7d7;
    color: #c53030;
    padding: 15px;
    border-radius: 8px;
    border-left: 4px solid #e53e3e;
    margin: 15px 0;
    text-align: center;
}
.success { 
    background: #c6f6d5;
    color: #276749;
    padding: 15px;
    border-radius: 8px;
    border-left: 4px solid #38a169;
    margin: 15px 0;
    text-align: center;
    font-weight: 600;
}
.info { 
    background: #bee3f8;
    color: #2c5282;
    padding: 15px;
    border-radius: 8px;
    border-left: 4px solid #3182ce;
    margin: 15px 0;
    text-align: center;
    font-weight: 600;
}
h2 {
    color: #2d3748;
    margin-bottom: 20px;
}
.form-group {
    margin-bottom: 20px;
}
.form-group label {
    margin-top: 0;
}
.required::after {
    content: " *";
    color: #e53e3e;
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

input:disabled {
    background: #f5f5f5 !important;
    color: #666;
}
</style>
</head>
<body>
    <div class="header">
        <h1>Update Employee</h1>
        <a href="index.jsp" class="back-link">← Back to Home</a>
    </div>
    
    <div class="container">
        <!-- Search Employee Form -->
        <div class="form-section">
            <h2>Search Employee</h2>
            
            <form method="get">
                <div class="form-group">
                    <label for="id" class="required">Employee ID</label>
                    <input type="number" id="id" name="id" required min="1" 
                           placeholder="Enter employee ID to search"
                           value="<%= request.getParameter("id") != null ? request.getParameter("id") : "" %>">
                </div>

                <input type="submit" value="Search Employee" class="search-btn">
            </form>
        </div>

        <%
        String idParam = request.getParameter("id");
        Employee emp = null;
        boolean found = false;
        String error = "";
        
        if (idParam != null && !idParam.trim().isEmpty()) {
            try {
                int empId = Integer.parseInt(idParam);
                emp = EmployeeDAO.getEmployeeById(empId);
                found = emp != null;
                if (!found) error = "Employee with ID " + empId + " not found!";
            } catch (Exception e) {
                error = "Error: " + e.getMessage();
            }
        }
        %>
        
        <% if (!error.isEmpty()) { %>
        <div class="error"><%= error %></div>
        <% } %>
        
        <%-- Display success message if exists --%>
        <%
        String successMessage = (String) request.getAttribute("message");
        String successParam = request.getParameter("success");
        if (successMessage != null && (successMessage.toLowerCase().contains("success") || successMessage.toLowerCase().contains("updated"))) {
        %>
        <div class="success">✅ Employee Updated Successfully!</div>
        <%
        } else if ("true".equals(successParam)) {
        %>
        <div class="success">✅ Employee Updated Successfully!</div>
        <%
        }
        %>
        
        <% if (found && emp != null) { %>
        <div class="info">
            <strong>Found:</strong> <%= emp.getName() %> (ID: <%= emp.getId() %>)
        </div>
        
        <!-- Update Employee Form -->
        <div class="form-section">
            <h2>Update Employee Details</h2>
            
            <form action="UpdateEmployee" method="post">
                <input type="hidden" name="id" value="<%= emp.getId() %>">
                
                <div class="form-group">
                    <label for="emp_id">Employee ID</label>
                    <input type="text" id="emp_id" value="<%= emp.getId() %>" disabled>
                </div>
                
                <div class="form-group">
                    <label for="name" class="required">Full Name</label>
                    <input type="text" id="name" name="name" required value="<%= emp.getName() %>" placeholder="Enter employee full name">
                </div>
                
                <div class="form-group">
                    <label for="doj" class="required">Date of Joining</label>
                    <input type="date" id="doj" name="doj" required value="<%= emp.getDoj() %>">
                </div>
                
                <div class="form-group">
                    <label for="gender" class="required">Gender</label>
                    <select id="gender" name="gender" required>
                        <option value="">Select Gender</option>
                        <option value="Male" <%= "Male".equals(emp.getGender()) ? "selected" : "" %>>Male</option>
                        <option value="Female" <%= "Female".equals(emp.getGender()) ? "selected" : "" %>>Female</option>
                        <option value="Other" <%= "Other".equals(emp.getGender()) ? "selected" : "" %>>Other</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="salary" class="required">Monthly Salary</label>
                    <input type="number" id="salary" name="salary" required step="0.01" min="0" value="<%= emp.getSalary() %>" placeholder="0.00">
                </div>
                
                <input type="submit" value="Update Employee" class="submit-btn">
                <input type="reset" value="Reset Form" class="reset-btn">
            </form>
        </div>
        <% } %>
        
      
    </div>
</body>
</html>