import 'package:flutter/material.dart';
import 'package:medi/screens/home_screen.dart';
import 'package:medi/screens/login_page.dart';
import 'package:medi/screens/profile_screen.dart';
import 'package:medi/screens/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../services/api_service.dart';
import '../models/user.dart';

class AuthHelper {
  static Future<bool> checkExistingLogin() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedUserData = prefs.getString('user_data');
      final token = prefs.getString('auth_token');
      final userId = prefs.getString('user_id');
      
      if (storedUserData != null && token != null && userId != null) {
        // Restore user session
        final userJson = jsonDecode(storedUserData);
        final user = UserModel.fromJson(userJson);

        // Set the user in ApiService
        ApiService.setCurrentUser(userId, token);

        return true; // User is logged in
      }
      return false; // User is not logged in
    } catch (e) {
      print('Error checking existing login: $e');
      return false;
    }
  }

  static Future<UserModel?> getCurrentUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedUserData = prefs.getString('user_data');
      
      if (storedUserData != null) {
        final userJson = jsonDecode(storedUserData);
        return UserModel.fromJson(userJson);
      }
      return null;
    } catch (e) {
      print('Error getting current user: $e');
      return null;
    }
  }

  static Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user_data');
      await prefs.remove('auth_token');
      await prefs.remove('user_id');
      
      ApiService.clearUserData();
    } catch (e) {
      print('Error during logout: $e');
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medi App',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: AuthHelper.checkExistingLogin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.data == true) {
            return const HomeScreen(); // main app screen
          } else {
            return const LoginPage(); // login screen
          }
        },
      ),
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
