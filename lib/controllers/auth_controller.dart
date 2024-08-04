import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;

  // Dummy user data
  final Map<String, String> _users = {
    'testuser': 'password123',
  };

  // Login method
  void login(String username, String password) {
    if (_users.containsKey(username) && _users[username] == password) {
      isLoggedIn.value = true;
      Get.snackbar('Success', 'Logged in successfully');
      Get.offNamed('/home_screen');
    } else {
      Get.snackbar('Error', 'Invalid username or password');
    }
  }

  // Sign-up method
  void signUp(String username, String password) {
    if (_users.containsKey(username)) {
      Get.snackbar('Error', 'Username already exists');
    } else {
      _users[username] = password;
      Get.snackbar('Success', 'Account created successfully');
      Get.offNamed('/login');
    }
  }
}
