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

---


## Database Setup

```sql
CREATE DATABASE IF NOT EXISTS employeedb;
USE employeedb;

CREATE TABLE employee (
    Empno INT PRIMARY KEY,
    EmpName VARCHAR(100),
    DoJ DATE,
    Gender VARCHAR(10),
    Bsalary DECIMAL(10,2)
);

INSERT INTO employee (Empno, EmpName, DoJ, Gender, Bsalary) VALUES
(101, 'John Doe', '2018-06-15', 'Male', 35000.00),
(102, 'Jane Smith', '2017-03-22', 'Female', 45000.00),
(103, 'Alice Johnson', '2020-01-10', 'Female', 28000.00),
(104, 'Bob Brown', '2015-09-05', 'Male', 55000.00),
(105, 'Charlie Davis', '2019-11-11', 'Male', 32000.00);

```
##  Installation & Setup

###  Step 1: Clone or Download the Project
- Download all the project files.
- Organize them according to the folder structure provided above.

---

###  Step 2: Database Configuration
1. Start your **MySQL server**.
2. Run the **database setup SQL script** provided in the "Database Setup" section.
3. Update the database credentials in `EmployeeDAO.java`:

```java
connection = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/employeedb", 
    "your_username", 
    "your_password"
);
```
