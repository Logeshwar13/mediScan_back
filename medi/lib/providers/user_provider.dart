import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/user.dart';
import '../services/api_service.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;
  bool _isLoggedIn = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;

  // Initialize and check if user is already logged in
  Future<void> init() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('user');
      final token = prefs.getString('token');

      if (userJson != null && token != null) {
        _user = UserModel.fromJson(jsonDecode(userJson));
        _isLoggedIn = true;
        
        // Set the token in ApiService
        ApiService.setCurrentUser(_user!.id, token);
      }
    } catch (e) {
      debugPrint('Error initializing user: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Login user
  Future<Map<String, dynamic>> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await ApiService.login(email, password);
      
      if (result['success']) {
        _user = result['user'];
        _isLoggedIn = true;
        
        // Save to SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', jsonEncode(_user!.toJson()));
        await prefs.setString('token', result['token']);
        
        notifyListeners();
        return {'success': true, 'message': result['message']};
      } else {
        return {'success': false, 'error': result['error']};
      }
    } catch (e) {
      return {'success': false, 'error': 'Login failed: $e'};
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Signup user
  Future<Map<String, dynamic>> signup(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await ApiService.signup(name, email, password, phone);
      
      if (result['success']) {
        _user = result['user'];
        _isLoggedIn = true;
        
        // Save to SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', jsonEncode(_user!.toJson()));
        await prefs.setString('token', result['token']);
        
        notifyListeners();
        return {'success': true, 'message': result['message']};
      } else {
        return {'success': false, 'error': result['error']};
      }
    } catch (e) {
      return {'success': false, 'error': 'Signup failed: $e'};
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Logout user
  Future<void> logout() async {
    try {
      // Clear SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user');
      await prefs.remove('token');
      
      // Clear ApiService data
      ApiService.clearUserData();
      
      // Clear provider data
      _user = null;
      _isLoggedIn = false;
      
      notifyListeners();
    } catch (e) {
      debugPrint('Error during logout: $e');
    }
  }

  // Update user profile
  Future<Map<String, dynamic>> updateProfile({
    String? name,
    String? phone,
    String? address,
  }) async {
    if (_user == null) {
      return {'success': false, 'error': 'User not logged in'};
    }

    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Implement API call to update user profile
      // For now, just update locally
      _user = UserModel(
        id: _user!.id,
        name: name ?? _user!.name,
        email: _user!.email,
        phone: phone ?? _user!.phone,
        address: address ?? _user!.address,
      );
      
      // Save updated user to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', jsonEncode(_user!.toJson()));
      
      notifyListeners();
      return {'success': true, 'message': 'Profile updated successfully'};
    } catch (e) {
      return {'success': false, 'error': 'Failed to update profile: $e'};
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Check authentication status
  bool get isAuthenticated => _isLoggedIn && _user != null;
  
  // Get user name for display
  String get userName => _user?.name ?? 'User';
  
  // Get user email
  String get userEmail => _user?.email ?? '';
}