import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_books_nus/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final ApiService apiService = Get.put(ApiService());
  var authToken = ''.obs;
  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  var currentUser = {}.obs;
  @override
  void onInit() {
    super.onInit();
  }

  static Future save(String key, String value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  Future<void> registerUser(Map<String, dynamic> userData) async {
    try {
      isLoading(true);
      final response = await apiService.registerUser(userData);
      final data = response.data;
    } catch (error) {
      isLoggedIn(false);
      currentUser({});
      throw Exception('Failed to register: $error');
    } finally {
      isLoading(false);
    }
  }

  Future<void> loginUser(String username, String password) async {
    try {
      isLoading(true);
      final response =
          await apiService.loginUser({'email': username, 'password': password});
      final data = response.data;
      isLoggedIn(true);
      authToken(data["token"]);

      final res = await apiService.getUserProfile(authToken.value);
      currentUser(res.data);
      debugPrint("Current User Name: ${currentUser['name']}");
      debugPrint('Current User: $currentUser');
    } catch (error) {
      isLoggedIn(false);
      currentUser({});
      throw Exception('Failed to login: $error');
    } finally {
      isLoading(false);
    }
  }

  Future<void> logoutUser() async {
    try {
      isLoading(true);
      await apiService.logoutUser(authToken.value);
      isLoggedIn(false);
      currentUser({});
      authToken('');
    } catch (error) {
      throw Exception('Failed to logout: $error');
    } finally {
      isLoading(false);
    }
  }
}
