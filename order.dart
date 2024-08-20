import 'product.dart';
import 'user.dart';

class Order {
  int orderId;
  User user;
  List<Product> products;
  String status = 'pending'; // Initial status of the order

  Order({
    required this.orderId,
    required this.user,
    required this.products,
  });

  // Add a product to the order and decrease its stock
  void addProduct(product) {
    if (product.stock > 0) {
      products.add(product); // Add product to the list
      product.stock--; // Decrease stock after adding to the order
    }
  }

  // Remove a product from the order and increase its stock
  void removeProduct(product) {
    products.remove(product); // Remove product from the list
    product.stock++; // Increase stock after removing from the order
  }

  // Calculate the total amount for the order
  double totalAmount() {
    double amount = 0;
    for (Product product in products) {
      amount += product.price; // Sum up the price of each product
    }
    return amount; // Return the total amount
  }

  // Display all products in the order along with their details
  void allProducts() {
    for (int i = 0; i <= products.length - 1; i++) {
      int j = i + 1;
      Product product = products[i];
      int id = product.id;
      String name = product.name;
      double price = product.price;
      int stock = product.stock;

      print(
          "$j) id: $id, name: $name, price: $price, stock: $stock"); // Print product details
    }
    double _totalAmount = totalAmount(); // Calculate total amount
    print('');
    print('Total amount: $_totalAmount'); // Print total amount
  }

  // Display the details of the order
  void showDetails() {
    String cosmuter = user.name;
    print('Order ID: $orderId'); // Print order ID
    print('Costumer: $cosmuter'); // Print customer name
    print('\nProducts:');
    allProducts(); // Show all products in the order
    print('Status: $status'); // Print current status of the order
  }

  // Update the order status (toggle between pending and ordered)
  void updateStatus() {
    if (status == 'pending') {
      status = 'ordered'; // Set status to ordered
      print('Order confirmed.');
    } else {
      status = 'pending'; // Set status back to pending
      print('Order canceled.');
    }
  }
}

// List of orders in the system
List<Order> orders = [
  Order(orderId: 1, user: users[2], products: [
    products[1],
    products[3],
    products[5]
  ]) // Initialize with a sample order
];
