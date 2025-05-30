# Employee Salary Management System

A web-based Java application to manage employee salary records using JSP, Servlets, JDBC, and MySQL following the MVC architecture.

---

## Features

- Add new employee records  
- Update existing employee details  
- Delete employee records  
- Display employee details  
- Generate reports:  
  - Employees whose names start with a specific letter  
  - Employees with N or more years of service  
  - Employees earning more than a specified salary  

---
## Project Structure

```
EmployeeWebApp/
├── WebContent/
│   ├── index.jsp
│   ├── empadd.jsp
│   ├── empupdate.jsp
│   ├── empdelete.jsp
│   ├── empdisplay.jsp
│   ├── reports.jsp
│   ├── report_form.jsp
│   └── report_result.jsp
├── src/
│   ├── com/
│   │   ├── dao/
│   │   │   └── EmployeeDAO.java
│   │   ├── model/
│   │   │   └── Employee.java
│   │   └── servlet/
│   │       ├── AddEmployeeServlet.java
│   │       ├── UpdateEmployeeServlet.java
│   │       ├── DeleteEmployeeServlet.java
│   │       ├── DisplayEmployeeServlet.java
│   │       ├── ReportServlet.java
│   │       └── ReportCriteriaServlet.java
└── WEB-INF/
    └── web.xml
```

