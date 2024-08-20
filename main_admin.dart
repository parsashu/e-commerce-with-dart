import 'dart:io';
import 'product.dart';
import 'user.dart';

void main() {
  while (true) {
    // Main admin command panel
    print('\n\n--- Admin Command Panel ---');
    print('1. Product management');
    print('2. User management');
    print('3. Exit');

    String? input = stdin.readLineSync(); // Get input for command panel option
    int? num = int.tryParse(input ?? ''); // Convert input to integer

    if (num != null) {
      switch (num) {
        // P R O D U C T   M A N A G E M E N T
        case 1:
          print('\n\n--- Product Management ---');
          print('1. Add Product');
          print('2. Search Product');
          print('3. Edit Product');
          print('4. Delete Product');
          print('5. Show All Products');
          print('6. Exit');

          String? input =
              stdin.readLineSync(); // Get input for product management
          int? num = int.tryParse(input ?? ''); // Convert input to integer

          if (num != null) {
            switch (num) {
              case 1:
                // Add Product
                print('Enter product details:');
                print('ID:');
                int id =
                    int.parse(stdin.readLineSync() ?? ''); // Input product ID
                print('Name:');
                String name = stdin.readLineSync() ?? ''; // Input product name
                print('Price:');
                double price = double.parse(
                    stdin.readLineSync() ?? ''); // Input product price
                print('Stock:');
                int stock = int.parse(
                    stdin.readLineSync() ?? ''); // Input product stock
                addProduct(
                    id: id,
                    name: name,
                    price: price,
                    stock: stock); // Add product to system
                print('Product added successfully.');
                break;

              case 2:
                // Search Product
                print('Enter product ID to search:');
                int searchId = int.parse(
                    stdin.readLineSync() ?? ''); // Input product ID to search
                Product foundProduct =
                    searchProduct(id: searchId); // Search for product
                foundProduct.showDetails(); // Display product details
                break;

              case 3:
                // Edit Product
                print('Enter product ID to edit:');
                int editId = int.parse(
                    stdin.readLineSync() ?? ''); // Input product ID to edit
                print('Enter new name (or leave empty to keep current):');
                String? newName =
                    stdin.readLineSync(); // Input new product name
                print('Enter new price (or leave empty to keep current):');
                String? priceInput =
                    stdin.readLineSync(); // Input new product price
                double? newPrice = priceInput != null && priceInput.isNotEmpty
                    ? double.tryParse(priceInput)
                    : null; // Parse new price if provided
                print('Enter new stock (or leave empty to keep current):');
                String? stockInput =
                    stdin.readLineSync(); // Input new product stock
                int? newStock = stockInput != null && stockInput.isNotEmpty
                    ? int.tryParse(stockInput)
                    : null; // Parse new stock if provided
                editProduct(
                    id: editId,
                    newName: newName,
                    newPrice: newPrice,
                    newStock: newStock); // Update product details
                print('Product updated successfully.');
                break;

              case 4:
                // Delete Product
                print('Enter product ID to delete:');
                int deleteId = int.parse(
                    stdin.readLineSync() ?? ''); // Input product ID to delete
                deleteProduct(id: deleteId); // Delete product from system
                print('Product deleted successfully.');
                break;

              case 5:
                // Show All Products
                print('Current product list:');
                allProducts(); // Display all products
                break;

              case 6:
                // Exit Product Management
                print('Exiting the application.');
                return;

              default:
                print('Invalid option. Please enter a number between 1 and 6.');
                break;
            }
          } else {
            print('Please enter a number.');
          }
          break; // Added missing break for Product Management case

        // U S E R   M A N A G E M E N T
        case 2:
          print('\n\n--- User Management ---');
          print('1. Add User');
          print('2. Search User');
          print('3. Edit User');
          print('4. Delete User');
          print('5. Show All Users');
          print('6. Exit');

          String? input = stdin.readLineSync(); // Get input for user management
          int? num = int.tryParse(input ?? ''); // Convert input to integer

          if (num != null) {
            switch (num) {
              case 1:
                // Add User
                print('Enter User ID:');
                int? id = int.tryParse(stdin.readLineSync()!); // Input user ID

                print('Enter User Name:');
                String? name = stdin.readLineSync(); // Input user name

                print('Enter User Email:');
                String? email = stdin.readLineSync(); // Input user email

                if (id != null && name != null && email != null) {
                  addUser(
                      id: id, name: name, email: email); // Add user to system
                  print('User added successfully.');
                } else {
                  print('Invalid input. Please try again.');
                }
                break;

              case 2:
                // Search User
                print('Enter User ID to search:');
                int? searchId = int.tryParse(
                    stdin.readLineSync()!); // Input user ID to search

                if (searchId != null) {
                  User? user = searchUser(id: searchId); // Search for user
                  if (user.id != 0) {
                    user.showDetails(); // Display user details if found
                  } else {
                    print('User not found.');
                  }
                } else {
                  print('Invalid input. Please try again.');
                }
                break;

              case 3:
                // Edit User
                print('Enter User ID to edit:');
                int? editId = int.tryParse(
                    stdin.readLineSync()!); // Input user ID to edit

                if (editId != null) {
                  print('Enter new name (leave empty to keep current):');
                  String? newName = stdin.readLineSync(); // Input new user name
                  newName = newName!.isEmpty ? null : newName;

                  print('Enter new email (leave empty to keep current):');
                  String? newEmail =
                      stdin.readLineSync(); // Input new user email
                  newEmail = newEmail!.isEmpty ? null : newEmail;

                  editUser(
                      id: editId,
                      newName: newName,
                      newEmail: newEmail); // Update user details
                  print('User edited successfully.');
                } else {
                  print('Invalid input. Please try again.');
                }
                break;

              case 4:
                // Delete User
                print('Enter User ID to delete:');
                int? deleteId = int.tryParse(
                    stdin.readLineSync()!); // Input user ID to delete

                if (deleteId != null) {
                  deleteUser(id: deleteId); // Delete user from system
                  print('User deleted successfully.');
                } else {
                  print('Invalid input. Please try again.');
                }
                break;

              case 5:
                // Show All Users
                allUsers(); // Display all users
                break;

              case 6:
                // Exit User Management
                print('Exiting...');
                return;

              default:
                print('Invalid choice. Please enter a number between 1 and 6.');
                break;
            }
          }
          break; // Added missing break for User Management case

        // E X I T
        case 3:
          print('Exiting...');
          return;

        default:
          print('Invalid choice.');
          break;
      }
    }
  }
}
