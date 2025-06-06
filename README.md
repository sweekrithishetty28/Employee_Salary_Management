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
(101, 'Manvitha Shetty', '2018-06-15', 'Female', 35000.00),
(102, 'Sweekrithi Rao', '2009-10-12', 'Female', 89000.00),
(103, 'Rajesh Kumar', '2005-07-26', 'Male', 45000.00),
(104, 'Asha Patel', '2021-12-08', 'Female', 50000.00),
(105, 'Kiran Reddy', '2017-04-09', 'Male', 78000.00);

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
    "root", 
    " "
);
```
### Step 3: Add MySQL JDBC Driver

- Download **MySQL Connector/J** from the official MySQL website  
- Add the JAR file to your project's `WEB-INF/lib` directory  
- If using an IDE, add it to your **build path**  

### Step 4: Deploy to Tomcat

- Create a new **Dynamic Web Project** in your IDE  
- Copy all source files to the appropriate folders  
- Deploy the project to the **Tomcat server**  
- Start the **Tomcat server**


---
### Output
### Home Page
![Home Page](https://github.com/sweekrithishetty28/Employee_Salary_Management/blob/6a364d74371104c2f325f1cbdb55ba3696d5515c/Screenshots/home.png)

###  Add Product
![Add Product](https://github.com/sweekrithishetty28/Employee_Salary_Management/blob/6a364d74371104c2f325f1cbdb55ba3696d5515c/Screenshots/add.png)

###  Update Product
![Update Product](https://github.com/sweekrithishetty28/Employee_Salary_Management/blob/6a364d74371104c2f325f1cbdb55ba3696d5515c/Screenshots/update.png)

### Delete Product
![Delete Product](https://github.com/sweekrithishetty28/Employee_Salary_Management/blob/6a364d74371104c2f325f1cbdb55ba3696d5515c/Screenshots/delete.png)

###  Display Products
![Display Products](https://github.com/sweekrithishetty28/Employee_Salary_Management/blob/6a364d74371104c2f325f1cbdb55ba3696d5515c/Screenshots/display.png)

### Generate Reports
![Generate Reports](https://github.com/sweekrithishetty28/Employee_Salary_Management/blob/ef856a7339fc098fb1a1e8d07e7836c126b1fbc3/Screenshots/report1.png)
![Generate Reports](https://github.com/sweekrithishetty28/Employee_Salary_Management/blob/ef856a7339fc098fb1a1e8d07e7836c126b1fbc3/Screenshots/report2.png)
![Generate Reports](https://github.com/sweekrithishetty28/Employee_Salary_Management/blob/ef856a7339fc098fb1a1e8d07e7836c126b1fbc3/Screenshots/report3.png)
![Generate Reports](https://github.com/sweekrithishetty28/Employee_Salary_Management/blob/ef856a7339fc098fb1a1e8d07e7836c126b1fbc3/Screenshots/report4.png)
![Generate Reports](
https://github.com/sweekrithishetty28/Employee_Salary_Management/blob/ef856a7339fc098fb1a1e8d07e7836c126b1fbc3/Screenshots/report5.png)
![Generate Reports](https://github.com/sweekrithishetty28/Employee_Salary_Management/blob/ef856a7339fc098fb1a1e8d07e7836c126b1fbc3/Screenshots/report6.png)
![Generate Reports](https://github.com/sweekrithishetty28/Employee_Salary_Management/blob/ef856a7339fc098fb1a1e8d07e7836c126b1fbc3/Screenshots/report7.png)


