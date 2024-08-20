// U S E R
class User {
  int id;
  String name;
  String email;

  // Constructor for initializing the user details
  User({
    required this.id,
    required this.name,
    required this.email,
  });

  // Method to display the user details
  void showDetails() {
    print("id: $id, name: $name, email: $email");
  }
}

// Function to add a new user to the users list
void addUser({
  required int id,
  required String name,
  required String email,
}) {
  User user = User(
    id: id,
    name: name,
    email: email,
  );
  users.add(user); // Add the new user to the list
}

// List of sample users
List<User> users = [
  User(
      id: 0,
      name: 'Not-found',
      email: 'Not-found'), // Default user for not found cases
  User(id: 1, name: 'Alice Johnson', email: 'alice@example.com'),
  User(id: 2, name: 'Bob Smith', email: 'bob@example.com'),
  User(id: 3, name: 'Carol Davis', email: 'carol@example.com'),
  User(id: 4, name: 'David Brown', email: 'david@example.com'),
  User(id: 5, name: 'Eve Clark', email: 'eve@example.com'),
];

// Function to search for a user by ID
User searchUser({required int id}) {
  User? user = users.firstWhere(
    (_user) => _user.id == id,
    orElse: () => users[0], // Return default user if not found
  );
  return user;
}

// Function to edit an existing user's details
void editUser({
  required int id,
  String? newName,
  String? newEmail,
}) {
  User? userToEdit = searchUser(id: id);

  // Update the user's name if a new one is provided
  if (newName != null) {
    userToEdit.name = newName;
  }
  // Update the user's email if a new one is provided
  if (newEmail != null) {
    userToEdit.email = newEmail;
  }
}

// Function to delete a user from the list
void deleteUser({required int id}) {
  User userToDelete = searchUser(id: id);
  users.remove(userToDelete); // Remove the user from the list
}

// Function to display all users in the list
void allUsers() {
  for (int i = 1; i <= users.length - 1; i++) {
    User user = users[i];
    int id = user.id;
    String name = user.name;
    String email = user.email;

    print("$i) id: $id, name: $name, email: $email"); // Print user details
  }
}
