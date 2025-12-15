import 'package:get_storage/get_storage.dart';

class StorageService {
  static final GetStorage _storage = GetStorage();

  // Save Login Token
  static Future<void> saveToken(String token) async {
    await _storage.write("token", token);
  }

  // Save User ID
  static Future<void> saveUserId(int userId) async {
    await _storage.write("userId", userId);
  }

  // Save User Data
  static Future<void> saveUserData(Map<String, dynamic> data) async {
    await _storage.write("userData", data);
  }

  // Save Login Status
  static Future<void> setLoggedIn(bool value) async {
    await _storage.write("isLoggedIn", value);
  }

  // Getters
  static String? getToken() => _storage.read("token");
  static int? getUserId() => _storage.read("userId");
  static Map<String, dynamic>? getUserData() => _storage.read("userData");
  static bool isLoggedIn() => _storage.read("isLoggedIn") ?? false;

  // Clear Everything
  static Future<void> clearAll() async {
    await _storage.erase();
  }
}
