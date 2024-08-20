import 'dart:io';
import 'order.dart';
import 'product.dart';
import 'user.dart';

void main() {
  // L O G I N
  while (true) {
    bool loggedIn = false;

    print('--- Log In ---');
    print("Enter email or keep empty for default: alice@example.com");
    String? email = stdin.readLineSync(); // Get user email input

    // Check if user kept empty
    if (email == '') {
      email = 'alice@example.com'; // Set default email if input is empty
    }

    // Finding user
    User user = users.firstWhere(
      (user) => user.email == email,
      orElse: () => users[0], // Default to the first user if not found
    );

    // Check if user exists
    int orderId = 0;
    if (user.id != 0) {
      // Finding order id
      orderId = orders.length + 1; // Assign order ID based on order list length
      String name = user.name;
      print('Logged In successfully as $name');
      loggedIn = true;
    } else {
      print('\nUser not found.');
      continue; // Loop back if user not found
    }

    // Creating the order
    Order order = Order(orderId: orderId, user: user, products: []);

    // O R D E R   P R O D U C T
    while (loggedIn) {
      print('\n\n--- Order Product ---');
      print('1. Add Product to Order');
      print('2. Remove Product from Order');
      print('3. Show Cart');
      print('4. Exit');

      String? input =
          stdin.readLineSync(); // Get user input for order management
      int? num = int.tryParse(input ?? ''); // Parse input to an integer

      if (num != null) {
        switch (num) {
          case 1:
            // Add Product to Order
            allProducts(); // Show all available products
            print('\nEnter Product Id or Ids by one space to add:');
            String? input = stdin.readLineSync(); // Get product IDs input

            if (input != null) {
              List<String> ids = input.split(' '); // Split IDs by space

              for (String idStr in ids) {
                int? id = int.tryParse(idStr); // Convert each ID to an integer

                if (id != null) {
                  // Search product
                  Product productToAdd = searchProduct(id: id);

                  if (productToAdd.id != 0) {
                    order.addProduct(productToAdd); // Add product to order
                    if (productToAdd.stock > 0) {
                      print('Product added successfully.');
                    } else {
                      print('Out of stock');
                    }
                  } else {
                    print('Product not found.');
                  }
                }
              }
            } else {
              print('Invalid input. Please try again.');
            }
            break;

          case 2:
            // Remove Product from Order
            order.showDetails(); // Show current order details
            print('\nEnter Product ID to remove:');
            int? productId =
                int.tryParse(stdin.readLineSync()!); // Get product ID to remove

            if (productId != null) {
              // Search product
              Product productToRemove = searchProduct(id: productId);

              if (productToRemove.id != 0) {
                order.removeProduct(
                    productToRemove); // Remove product from order
                print('Product removed successfully.');
              } else {
                print('Product not found in the order.');
              }
            } else {
              print('Invalid input. Please try again.');
            }
            break;

          case 3:
            // Show Order Details
            print('--- Cart ---');
            order.showDetails(); // Show all products in the cart
            print('Confirm order or Cancel order? [Y/N]');
            String? ans = stdin.readLineSync(); // Get user confirmation

            if (ans != null) {
              if (ans.toLowerCase() == 'y') {
                order.updateStatus(); // Update order status if confirmed
              } else if (ans.toLowerCase() != 'n') {
                print('Please choose Y or N.');
              }
            }
            break;

          case 4:
            // Exit
            print('Exiting...');
            return;

          default:
            print('Invalid choice. Please enter a number between 1 and 4.');
            break;
        }
      } else {
        print('Invalid input. Please enter a valid number.');
      }
    }
  }
}
