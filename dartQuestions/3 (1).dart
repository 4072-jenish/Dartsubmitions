import 'dart:core';
class User {
  String name;
  String email;
  String password;
  bool isLoggedIn = false;
  User({required this.name, required this.email, required this.password});
  void login() {
    if (validateCredentials()) {
      isLoggedIn = true;
      print('User $name has logged in.');
    } else {
      print('Invalid credentials.');
    }
  }
  void logout() {
    if (isLoggedIn) {
      isLoggedIn = false;
      print('User $name has logged out.');
    } else {
      print('User is not logged in.');
    }
  }
  bool validateCredentials() {
    return password.isNotEmpty;
  }
}
void main() {
  final user = User(name: 'John Doe', email: 'john.doe@example.com', password: 'mypassword');
  user.login();
  user.logout();
}