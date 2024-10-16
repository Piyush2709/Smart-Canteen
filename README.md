# SmartCanteen Java Web Application

This is a Java-based web application developed using **NetBeans 8.2** for managing and automating the processes of a canteen. The application leverages **MySQL Workbench** for database management and **mysqlconnector.jar** for database connectivity. It includes a combination of **.jsp** (Java Server Pages) and **.java** files for dynamic web content and backend logic.

## Features

- **User Login and Registration**: Customers can register and log in to their accounts.
- **Menu Management**: Admins can add, update, or remove items from the menu.
- **Order Management**: Users can place orders, view order history, and track order status.
- **Payment Integration**: Supports online payment processing.
- **Admin Dashboard**: Admins can view all orders, manage users, and view sales reports.
- **Responsive Design**: Works seamlessly on both desktop and mobile browsers.

## Technology Stack

- **Java**: Core language for backend logic.
- **NetBeans 8.2**: IDE used for development.
- **MySQL Workbench**: For database creation and management.
- **MySQL Connector (mysqlconnector.jar)**: JDBC driver for MySQL.
- **JSP (Java Server Pages)**: For dynamic web pages.
- **HTML, CSS, and JavaScript**: For the frontend design.
  
- ### . Screen-Shots
- ![HomePage](https://github.com/user-attachments/assets/31d6160a-a7b5-4e18-a1cf-d3a475f1e72c)
- ![Admin_Login](https://github.com/user-attachments/assets/1194a59c-478a-4dc3-88aa-6baf818c7040)
- ![view_menu](https://github.com/user-attachments/assets/46983c6c-d0c4-4d8b-a42b-7593d120bfb2)
-![view_order_Dashbord](https://github.com/user-attachments/assets/7f743ab0-104a-4a90-b024-863c3d2a53a7)
-![view_menu](https://github.com/user-attachments/assets/0d496b54-7fa8-4451-be91-bc33aaf9fdeb)
-![user_login](https://github.com/user-attachments/assets/dd1c90ea-04f0-49ca-ad42-8afb48432da5)
-![shop](https://github.com/user-attachments/assets/d28fc266-bd05-49a0-ac3b-64a2395c8f1b)
-![menu_detail](https://github.com/user-attachments/assets/552e13d7-851f-42e7-92a4-333fba150892)
-![Proceed Order](https://github.com/user-attachments/assets/a29416b6-8cc7-417c-9c74-8080a5d5953a)
- ![Add_Menu](https://github.com/user-attachments/assets/c308b1cb-5f60-4e00-944d-209ed232cc63)
And Many More....


## Setup Instructions

### 1. Prerequisites

Before setting up the project, make sure you have the following installed:

- **NetBeans 8.2** or later
- **MySQL Workbench**
- **Java Development Kit (JDK)** version 8 or later
- **Apache Tomcat** (or any servlet container for deployment)
- **MySQL Connector (mysqlconnector.jar)**

### 2. Database Setup

1. Open **MySQL Workbench** and create a new database named `smartcanteen`.
2. Run the SQL script provided in the `db/` directory to set up the necessary tables and relations.
3. Configure the database connection in `dbConnection.java` (located in `src/java/`) by updating the following fields:
    ```java
    String url = "jdbc:mysql://localhost:3306/smartcanteen";
    String username = "your-username";
    String password = "your-password";
    ```

### 3. Importing the Project in NetBeans

1. Open **NetBeans 8.2**.
2. Go to `File > Open Project` and navigate to the project folder.
3. Add the **mysqlconnector.jar** file to your project libraries:
   - Right-click on the project in the **Projects** panel.
   - Go to `Properties > Libraries > Add JAR/Folder` and select `mysqlconnector.jar`.  // for in deatil contact me anytime.

### 4. Running the Project

1. Right-click the project and select `Run`.
2. Ensure that **Apache Tomcat** or your preferred server is set as the default server.
3. The project should launch in your browser with the main login page.

### 5. Deployment

- For deployment to a production server, package the application as a WAR file and deploy it to an Apache Tomcat server.
  

## Troubleshooting

- **Database Connection Issues**: Double-check the JDBC URL, username, and password in `dbConnection.java`.
- **JAR File Errors**: Ensure that the correct version of **mysqlconnector.jar** is added to your project libraries.
- **Server Issues**: Make sure **Apache Tomcat** or the chosen servlet container is correctly configured.



## Authors

-Piyush Adake - Initial work and development.
