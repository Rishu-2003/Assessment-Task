# Employee Management System

**Tech stack: 
  - Front-End: HTML, CSS, Bootstrap
  - Back-End: PHP, JQuery
  - Database: MySQL
## Setup Instructions

1. **Install XAMPP/WAMP**: Ensure you have a local server environment with Apache, PHP, and MySQL.
2. **Clone or Download the Repository**: Place the project folder inside the `htdocs` (for XAMPP) directory.
3. **Create Database**:
    - Open phpMyAdmin.
    - Create a new database named `employee_management`.
    - Run the SQL scripts in `database.sql` to create the `employees` and `users` tables.
4. **Update Database Connection**:
    - Open `db.php`.
    - Update the database credentials if necessary.
5. **Start the Server**:
    - Start Apache and MySQL from the XAMPP control panel.
6. **Access the Application**:
    - Open a web browser and go to `http://localhost/login.html/`.

## Features

- **Login**: Simple login system with session management.
- **Employee Management**: Add, view, edit, and delete employees.
- **File Upload**: Upload and display profile pictures for employees.
- **Validation**: Client-side and server-side validation for forms.

## Usage

1. **Login**:
    - Use the login page to enter the application.
    - Default credentials are username: `admin@gmail.com`, password: `admin`.
2. **Manage Employees**:
    - Add a new employee using the form.
    - View the list of employees on the homepage.
    - Edit or delete an employee using the provided options.

## Note

- Ensure file upload directory (`uploads/`) is writable.
- For security, change default login credentials after the first login.
