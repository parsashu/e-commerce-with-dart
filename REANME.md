# Order Management System

## Overview

This Order Management System is a console-based application written in Dart. It allows administrators to manage products and users, while also allowing users to create and manage orders. The system is designed with basic operations to add, edit, delete, and view products and users, as well as place and manage orders.

## Features

### Product Management
- **Add Product**: Allows the administrator to add new products to the system.
- **Search Product**: Search for a product by its ID and display its details.
- **Edit Product**: Update the name, price, or stock of an existing product.
- **Delete Product**: Remove a product from the system.
- **Show All Products**: Display a list of all available products in the system.

### User Management
- **Add User**: Allows the administrator to add new users to the system.
- **Search User**: Search for a user by their ID and display their details.
- **Edit User**: Update the name or email of an existing user.
- **Delete User**: Remove a user from the system.
- **Show All Users**: Display a list of all registered users.

### Order Management
- **Create Order**: Users can log in and create new orders by adding products to their cart.
- **Add/Remove Products to/from Order**: Users can manage the products in their order.
- **View Cart**: Users can view the details of their current order, including total amount.
- **Confirm/Cancel Order**: Users can either confirm their order or cancel it.

## Structure

The project is divided into the following Dart files:

- `main.dart`: The entry point of the application. Manages user login and the main application loop.
- `product.dart`: Contains the `Product` class and functions related to product management.
- `user.dart`: Contains the `User` class and functions related to user management.
- `order.dart`: Contains the `Order` class and functions related to order management.

## Getting Started

### Prerequisites

- Dart SDK: Make sure you have Dart installed on your machine. You can download it from [Dart's official website](https://dart.dev/get-dart).

### Running the Application

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/your-username/order-management-system.git
