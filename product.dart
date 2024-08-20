// P R O D U C T
class Product {
  int id;
  String name;
  double price;
  int stock;

  // Constructor for initializing the product details
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
  });

  // Method to display the product details
  void showDetails() {
    print("id: $id, name: $name, price: $price, stock: $stock");
  }
}

// List of sample products
List<Product> products = [
  Product(
      id: 0,
      name: 'Not-found',
      price: 0,
      stock: 0), // Default product for not found cases
  Product(id: 1, name: 'Laptop', price: 999.99, stock: 10),
  Product(id: 2, name: 'Smartphone', price: 499.99, stock: 20),
  Product(id: 3, name: 'Wireless Mouse', price: 29.99, stock: 50),
  Product(id: 4, name: 'Keyboard', price: 49.99, stock: 40),
  Product(id: 5, name: 'Monitor', price: 199.99, stock: 15),
  Product(id: 6, name: 'Headphones', price: 79.99, stock: 25),
  Product(id: 7, name: 'External Hard Drive', price: 89.99, stock: 30),
  Product(id: 8, name: 'USB-C Cable', price: 9.99, stock: 100),
  Product(id: 9, name: 'Tablet', price: 299.99, stock: 18),
  Product(id: 10, name: 'Smartwatch', price: 199.99, stock: 12),
];

// Function to add a new product to the products list
void addProduct({
  required int id,
  required String name,
  required double price,
  required int stock,
}) {
  Product product = Product(
    id: id,
    name: name,
    price: price,
    stock: stock,
  );
  products.add(product); // Add the new product to the list
}

// Function to search for a product by ID
Product searchProduct({required int id}) {
  Product? product = products.firstWhere(
    (_product) => _product.id == id,
    orElse: () => products[0], // Return default product if not found
  );
  return product;
}

// Function to edit an existing product's details
void editProduct({
  required int id,
  String? newName,
  double? newPrice,
  int? newStock,
}) {
  Product? productToEdit = searchProduct(id: id);

  // Update the product's name if a new one is provided
  if (newName != null) {
    productToEdit.name = newName;
  }
  // Update the product's price if a new one is provided
  if (newPrice != null) {
    productToEdit.price = newPrice;
  }
  // Update the product's stock if a new one is provided
  if (newStock != null) {
    productToEdit.stock = newStock;
  }
}

// Function to delete a product from the list
void deleteProduct({required int id}) {
  Product productToDelete = searchProduct(id: id);
  products.remove(productToDelete); // Remove the product from the list
}

// Function to display all products in the list
void allProducts() {
  for (int i = 1; i <= products.length - 1; i++) {
    Product product = products[i];
    int id = product.id;
    String name = product.name;
    double price = product.price;
    int stock = product.stock;

    print(
        "$i) id: $id, name: $name, price: $price, stock: $stock"); // Print product details
  }
}
