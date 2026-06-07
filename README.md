# Next Gen Tech Store

## Overview

Next Gen Tech Store is a role-based online retail application developed using C# and .NET. The application provides separate interfaces for Buyers and Sellers, allowing secure user authentication, product management, advanced product filtering, and personalized user preferences.

The project demonstrates database integration, role-based access control, state management, password hashing, and modern application development practices.

## Features

### User Management

* User Registration
* Secure Login System
* Role Selection (Buyer or Seller)
* Password Hashing using SHA256
* Role-Based Access Control

### Seller Dashboard

* View all products
* Add new products
* Update existing products
* Delete products
* Manage store inventory through a Data Grid

### Buyer Storefront

* View available products
* Dynamic category filtering
* Search products by name
* Filter products by maximum price
* Real-time filtering and search functionality

### Theme Preferences

* Dark Mode toggle
* Automatic saving of user theme preferences
* Persistent theme loading between sessions

### Validation and Security

* Input validation
* Exception handling with try-catch blocks
* Secure password storage
* Protected role-based navigation

## Technologies Used

* C#
* ASP.NET / .NET Framework
* Microsoft SQL Server
* ADO.NET
* HTML
* CSS
* JavaScript
* SHA256 Cryptography
* Session Management

## Database Structure

### Users Table

| Field    | Description            |
| -------- | ---------------------- |
| UserID   | Unique user identifier |
| Username | User login name        |
| Password | Hashed password        |
| Role     | Buyer or Seller        |

### Products Table

| Field       | Description               |
| ----------- | ------------------------- |
| ProductID   | Unique product identifier |
| ProductName | Product name              |
| Category    | Product category          |
| Description | Product description       |
| Price       | Product price             |

## Key Concepts Demonstrated

* Role-Based Authentication
* Database Connectivity
* CRUD Operations
* State Management
* Session Handling
* Dynamic Filtering
* Password Hashing
* Exception Handling
* Data Validation
* User Interface Design

## Learning Outcomes

This project demonstrates practical experience in:

* Full-Stack Application Development
* Database Design and Management
* Secure User Authentication
* Software Design Principles
* Data Management
* User Experience Design
* Application Security
* Problem Solving and Debugging

## Author

### Thusano Masalesa

Technology Student focused on continuous learning, skill growth, and exploring different areas in technology.

## License

This project was developed for educational purposes as part of academic coursework and practical application of software development concepts.
