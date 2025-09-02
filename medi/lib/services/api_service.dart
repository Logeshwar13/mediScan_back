// // // // import 'dart:convert';
// // // // import 'package:http/http.dart' as http;

// // // // class ApiService {
// // // //   static const String baseUrl = "http://10.1.0.215:5000/api"; // your local wifi server

// // // //   // Fetch medicines
// // // //   static Future<List<dynamic>> fetchMedicines() async {
// // // //     final response = await http.get(Uri.parse("$baseUrl/medicine"));
// // // //     if (response.statusCode == 200) {
// // // //       return jsonDecode(response.body);
// // // //     } else {
// // // //       throw Exception("Failed to load medicines");
// // // //     }
// // // //   }

// // // //   // Login
// // // //   static Future<Map<String, dynamic>> login(String email, String password) async {
// // // //     final response = await http.post(
// // // //       Uri.parse("$baseUrl/auth/login"),
// // // //       headers: {"Content-Type": "application/json"},
// // // //       body: jsonEncode({"email": email, "password": password}),
// // // //     );
// // // //     return jsonDecode(response.body);
// // // //   }

// // // //   // Signup
// // // //   static Future<Map<String, dynamic>> signup(String name, String email, String password, String phone) async {
// // // //     final response = await http.post(
// // // //       Uri.parse("$baseUrl/auth/signup"),
// // // //       headers: {"Content-Type": "application/json"},
// // // //       body: jsonEncode({"name": name, "email": email, "password": password, "phone": phone}),
// // // //     );
// // // //     return jsonDecode(response.body);
// // // //   }
// // // // }

// // // import 'dart:convert';
// // // import 'package:http/http.dart' as http;
// // // import '../models/medicine.dart';
// // // import '../models/user.dart';
// // // import '../models/order.dart';

// // // class ApiService {
// // //   static const String baseUrl = "http://10.1.0.215:5000/api"; // local backend

// // //   // Fetch medicines
// // //   static Future<List<Medicine>> fetchMedicines() async {
// // //     try {
// // //       final response = await http.get(Uri.parse("$baseUrl/medicine"));
// // //       if (response.statusCode == 200) {
// // //         final List data = jsonDecode(response.body);
// // //         return data.map((json) => Medicine.fromJson(json)).toList();
// // //       } else {
// // //         throw Exception("Failed to load medicines");
// // //       }
// // //     } catch (e) {
// // //       throw Exception("Network error: $e");
// // //     }
// // //   }

// // //   // Login
// // //   static Future<UserModel?> login(String email, String password) async {
// // //     try {
// // //       final response = await http.post(
// // //         Uri.parse("$baseUrl/auth/login"),
// // //         headers: {"Content-Type": "application/json"},
// // //         body: jsonEncode({"email": email, "password": password}),
// // //       );

// // //       if (response.statusCode == 200) {
// // //         final data = jsonDecode(response.body);
// // //         return UserModel.fromJson(data['user']);
// // //       } else {
// // //         final err = jsonDecode(response.body);
// // //         throw Exception(err["message"] ?? "Login failed");
// // //       }
// // //     } catch (e) {
// // //       throw Exception("Login error: $e");
// // //     }
// // //   }

// // //   // Signup
// // //   static Future<bool> signup(String name, String email, String password, String phone) async {
// // //     try {
// // //       final response = await http.post(
// // //         Uri.parse("$baseUrl/auth/signup"),
// // //         headers: {"Content-Type": "application/json"},
// // //         body: jsonEncode({
// // //           "name": name,
// // //           "email": email,
// // //           "password": password,
// // //           "phone": phone
// // //         }),
// // //       );
// // //       return response.statusCode == 200;
// // //     } catch (e) {
// // //       throw Exception("Signup error: $e");
// // //     }
// // //   }

// // //   // Fetch Orders
// // //   static Future<List<Order>> fetchOrders(String userId) async {
// // //     try {
// // //       final response = await http.get(Uri.parse("$baseUrl/order/$userId"));
// // //       if (response.statusCode == 200) {
// // //         final List data = jsonDecode(response.body);
// // //         return data.map((json) => Order.fromJson(json)).toList();
// // //       } else {
// // //         throw Exception("Failed to load orders");
// // //       }
// // //     } catch (e) {
// // //       throw Exception("Order fetch error: $e");
// // //     }
// // //   }
// // // }

// // // lib/services/api_service.dart
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;

// // class ApiService {
// //   static const String baseUrl = "http://10.1.0.215:5000/api"; // your backend

// //   // ----------------- User Auth -----------------
// //   static Future<Map<String, dynamic>> signup(
// //       String name, String email, String password) async {
// //     final response = await http.post(
// //       Uri.parse('$baseUrl/auth/signup'),
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode({
// //         'name': name,
// //         'email': email,
// //         'password': password,
// //       }),
// //     );
// //     return jsonDecode(response.body);
// //   }

// //   static Future<Map<String, dynamic>> login(
// //       String email, String password) async {
// //     final response = await http.post(
// //       Uri.parse('$baseUrl/auth/login'),
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode({
// //         'email': email,
// //         'password': password,
// //       }),
// //     );
// //     return jsonDecode(response.body);
// //   }

// //   // ----------------- Medicines -----------------
// //   static Future<List<dynamic>> fetchMedicines() async {
// //     final response = await http.get(Uri.parse('$baseUrl/medicines'));
// //     return jsonDecode(response.body);
// //   }

// //   // ----------------- Orders -----------------
// //   static Future<Map<String, dynamic>> createOrder(
// //       String userId, List<String> medicines) async {
// //     final response = await http.post(
// //       Uri.parse('$baseUrl/orders'),
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode({
// //         'userId': userId,
// //         'medicines': medicines,
// //       }),
// //     );
// //     return jsonDecode(response.body);
// //   }
// // }

// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
// // import '../models/medicine.dart';
// // import '../models/user.dart';
// // import '../models/order.dart';

// // class ApiService {
// //   static const String baseUrl = "http://10.1.0.215:5000/api"; // backend server

// //   // ----------------- User Auth -----------------
// //   static Future<UserModel?> signup(String name, String email, String password, String phone) async {
// //     final response = await http.post(
// //       Uri.parse('$baseUrl/auth/signup'),
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode({
// //         'name': name,
// //         'email': email,
// //         'password': password,
// //         'phone': phone,
// //       }),
// //     );

// //     if (response.statusCode == 200) {
// //       final data = jsonDecode(response.body);
// //       return UserModel.fromJson(data['user']);
// //     } else {
// //       throw Exception("Signup failed: ${response.body}");
// //     }
// //   }

// //   static Future<UserModel?> login(String email, String password) async {
// //     final response = await http.post(
// //       Uri.parse('$baseUrl/auth/login'),
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode({'email': email, 'password': password}),
// //     );

// //     if (response.statusCode == 200) {
// //       final data = jsonDecode(response.body);
// //       return UserModel.fromJson(data['user']);
// //     } else {
// //       throw Exception("Login failed: ${response.body}");
// //     }
// //   }

// //   // ----------------- Medicines -----------------
// //   static Future<List<Medicine>> fetchMedicines() async {
// //     final response = await http.get(Uri.parse('$baseUrl/medicine')); // ✅ matches your backend route
// //     if (response.statusCode == 200) {
// //       final List data = jsonDecode(response.body);
// //       return data.map((json) => Medicine.fromJson(json)).toList();
// //     } else {
// //       throw Exception("Failed to load medicines");
// //     }
// //   }

// //   // ----------------- Orders -----------------
// //   static Future<List<Order>> fetchOrders(String userId) async {
// //     final response = await http.get(Uri.parse('$baseUrl/order/$userId'));
// //     if (response.statusCode == 200) {
// //       final List data = jsonDecode(response.body);
// //       return data.map((json) => Order.fromJson(json)).toList();
// //     } else {
// //       throw Exception("Failed to load orders");
// //     }
// //   }

// //   static Future<Order> createOrder(String userId, List<String> medicineIds) async {
// //     final response = await http.post(
// //       Uri.parse('$baseUrl/order'),
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode({
// //         'userId': userId,
// //         'medicines': medicineIds,
// //       }),
// //     );

// //     if (response.statusCode == 200) {
// //       final data = jsonDecode(response.body);
// //       return Order.fromJson(data);
// //     } else {
// //       throw Exception("Failed to create order: ${response.body}");
// //     }
// //   }

// //   // ----------------- Cart -----------------
// //   static Future<void> addToCart(String productId) async {
// //     final response = await http.post(
// //       Uri.parse('$baseUrl/cart/add'),
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode({'productId': productId}),
// //     );

// //     if (response.statusCode != 200) {
// //       throw Exception("Failed to add to cart: ${response.body}");
// //     }
// //   }
// // }

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/medicine.dart';
// import '../models/user.dart';
// import '../models/order.dart';

// class ApiService {
//   // static const String baseUrl = "https://a3a82a73e3fb.ngrok-free.app/api";
//    static const String baseUrl = "https://03a75d1e5585.ngrok-free.app/api";

//   // Store current user info (you might want to use SharedPreferences or a state manager)
//   static String? _currentUserId;
//   static String? _authToken;

//   // Set current user after login
//   static void setCurrentUser(String userId, String token) {
//     _currentUserId = userId;
//     _authToken = token;
//   }

//   // Clear user data on logout
//   static void clearUserData() {
//     _currentUserId = null;
//     _authToken = null;
//   }

//   // Get auth headers
//   static Map<String, String> _getAuthHeaders() {
//     final headers = {'Content-Type': 'application/json'};
//     if (_authToken != null) {
//       headers['Authorization'] = 'Bearer $_authToken';
//     }
//     return headers;
//   }

//   // ----------------- User Auth -----------------
//   static Future<UserModel?> signup(
//     String name,
//     String email,
//     String password,
//     String phone,
//   ) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/auth/signup'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'name': name,
//           'email': email,
//           'password': password,
//           'phone': phone,
//         }),
//       );

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final data = jsonDecode(response.body);
//         final user = UserModel.fromJson(data['user']);

//         // Store user data after successful signup
//         if (data['token'] != null) {
//           setCurrentUser(user.id, data['token']);
//         }

//         return user;
//       } else {
//         final errorData = jsonDecode(response.body);
//         throw Exception(errorData['message'] ?? "Signup failed");
//       }
//     } catch (e) {
//       throw Exception("Signup error: $e");
//     }
//   }

//   static Future<UserModel?> login(String email, String password) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/auth/login'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': email, 'password': password}),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         final user = UserModel.fromJson(data['user']);

//         // Store user data after successful login
//         if (data['token'] != null) {
//           setCurrentUser(user.id, data['token']);
//         }

//         return user;
//       } else {
//         final errorData = jsonDecode(response.body);
//         throw Exception(errorData['message'] ?? "Login failed");
//       }
//     } catch (e) {
//       throw Exception("Login error: $e");
//     }
//   }

//   // ----------------- Medicines -----------------
//   static Future<List<Medicine>> fetchMedicines() async {
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/medicines'),
//         headers: _getAuthHeaders(),
//       );

//       if (response.statusCode == 200) {
//         final List data = jsonDecode(response.body);
//         return data.map((json) => Medicine.fromJson(json)).toList();
//       } else {
//         throw Exception("Failed to load medicines: ${response.statusCode}");
//       }
//     } catch (e) {
//       throw Exception("Network error: $e");
//     }
//   }

//   // Search medicines
//   static Future<List<Medicine>> searchMedicines(String query) async {
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/medicines/search?q=$query'),
//         headers: _getAuthHeaders(),
//       );

//       if (response.statusCode == 200) {
//         final List data = jsonDecode(response.body);
//         return data.map((json) => Medicine.fromJson(json)).toList();
//       } else {
//         throw Exception("Search failed");
//       }
//     } catch (e) {
//       throw Exception("Search error: $e");
//     }
//   }

//   // ----------------- Cart Management -----------------
//   static Future<void> addToCart(String medicineId, {int quantity = 1}) async {
//     if (_currentUserId == null) {
//       throw Exception("User not logged in");
//     }

//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/cart/add'),
//         headers: _getAuthHeaders(),
//         body: jsonEncode({
//           'userId': _currentUserId,
//           'medicineId': medicineId,
//           'quantity': quantity,
//         }),
//       );

//       if (response.statusCode != 200 && response.statusCode != 201) {
//         final errorData = jsonDecode(response.body);
//         throw Exception(errorData['message'] ?? "Failed to add to cart");
//       }
//     } catch (e) {
//       throw Exception("Add to cart error: $e");
//     }
//   }

//   static Future<List<dynamic>> getCartItems() async {
//     if (_currentUserId == null) {
//       throw Exception("User not logged in");
//     }

//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/cart/$_currentUserId'),
//         headers: _getAuthHeaders(),
//       );

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       } else {
//         throw Exception("Failed to load cart");
//       }
//     } catch (e) {
//       throw Exception("Cart fetch error: $e");
//     }
//   }

//   static Future<void> removeFromCart(String medicineId) async {
//     if (_currentUserId == null) {
//       throw Exception("User not logged in");
//     }

//     try {
//       final response = await http.delete(
//         Uri.parse('$baseUrl/cart/remove'),
//         headers: _getAuthHeaders(),
//         body: jsonEncode({'userId': _currentUserId, 'medicineId': medicineId}),
//       );

//       if (response.statusCode != 200) {
//         throw Exception("Failed to remove from cart");
//       }
//     } catch (e) {
//       throw Exception("Remove from cart error: $e");
//     }
//   }

//   static Future<void> updateCartQuantity(
//     String medicineId,
//     int quantity,
//   ) async {
//     if (_currentUserId == null) {
//       throw Exception("User not logged in");
//     }

//     try {
//       final response = await http.put(
//         Uri.parse('$baseUrl/cart/update'),
//         headers: _getAuthHeaders(),
//         body: jsonEncode({
//           'userId': _currentUserId,
//           'medicineId': medicineId,
//           'quantity': quantity,
//         }),
//       );

//       if (response.statusCode != 200) {
//         throw Exception("Failed to update cart");
//       }
//     } catch (e) {
//       throw Exception("Update cart error: $e");
//     }
//   }

//   static Future<void> clearCart() async {
//     if (_currentUserId == null) {
//       throw Exception("User not logged in");
//     }

//     try {
//       final response = await http.delete(
//         Uri.parse('$baseUrl/cart/clear/$_currentUserId'),
//         headers: _getAuthHeaders(),
//       );

//       if (response.statusCode != 200) {
//         throw Exception("Failed to clear cart");
//       }
//     } catch (e) {
//       throw Exception("Clear cart error: $e");
//     }
//   }

//   // ----------------- Orders -----------------
//   static Future<List<Order>> fetchOrders(String userId) async {
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/order/$userId'),
//         headers: _getAuthHeaders(),
//       );

//       if (response.statusCode == 200) {
//         final List data = jsonDecode(response.body);
//         return data.map((json) => Order.fromJson(json)).toList();
//       } else {
//         throw Exception("Failed to load orders");
//       }
//     } catch (e) {
//       throw Exception("Order fetch error: $e");
//     }
//   }

//   static Future<Order> createOrder(List<String> medicineIds) async {
//     if (_currentUserId == null) {
//       throw Exception("User not logged in");
//     }

//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/order'),
//         headers: _getAuthHeaders(),
//         body: jsonEncode({'userId': _currentUserId, 'medicines': medicineIds}),
//       );

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final data = jsonDecode(response.body);
//         return Order.fromJson(data);
//       } else {
//         final errorData = jsonDecode(response.body);
//         throw Exception(errorData['message'] ?? "Failed to create order");
//       }
//     } catch (e) {
//       throw Exception("Create order error: $e");
//     }
//   }

//   // Create order from cart
//   static Future<Order> createOrderFromCart() async {
//     if (_currentUserId == null) {
//       throw Exception("User not logged in");
//     }

//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/order/from-cart'),
//         headers: _getAuthHeaders(),
//         body: jsonEncode({'userId': _currentUserId}),
//       );

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final data = jsonDecode(response.body);
//         return Order.fromJson(data);
//       } else {
//         final errorData = jsonDecode(response.body);
//         throw Exception(
//           errorData['message'] ?? "Failed to create order from cart",
//         );
//       }
//     } catch (e) {
//       throw Exception("Create order from cart error: $e");
//     }
//   }

//   // ----------------- Wishlist -----------------
//   static Future<void> addToWishlist(String medicineId) async {
//     if (_currentUserId == null) {
//       throw Exception("User not logged in");
//     }

//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/wishlist/add'),
//         headers: _getAuthHeaders(),
//         body: jsonEncode({'userId': _currentUserId, 'medicineId': medicineId}),
//       );

//       if (response.statusCode != 200 && response.statusCode != 201) {
//         throw Exception("Failed to add to wishlist");
//       }
//     } catch (e) {
//       throw Exception("Add to wishlist error: $e");
//     }
//   }

//   static Future<List<Medicine>> getWishlistItems() async {
//     if (_currentUserId == null) {
//       throw Exception("User not logged in");
//     }

//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/wishlist/$_currentUserId'),
//         headers: _getAuthHeaders(),
//       );

//       if (response.statusCode == 200) {
//         final List data = jsonDecode(response.body);
//         return data.map((json) => Medicine.fromJson(json)).toList();
//       } else {
//         throw Exception("Failed to load wishlist");
//       }
//     } catch (e) {
//       throw Exception("Wishlist fetch error: $e");
//     }
//   }

//   // ----------------- Utility Methods -----------------
//   static bool get isLoggedIn => _currentUserId != null && _authToken != null;
//   static String? get currentUserId => _currentUserId;
// }


import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/medicine.dart';
import '../models/user.dart';
import '../models/order.dart';

class ApiService {
  // static const String baseUrl = "https://9df028dac1e9.ngrok-free.app/api";
    static const String baseUrl = "https://7ca5d3466128.ngrok-free.app/api";


  static String? _currentUserId;
  static String? _authToken;

  static void setCurrentUser(String userId, String token) {
    _currentUserId = userId;
    _authToken = token;
  }

  static void clearUserData() {
    _currentUserId = null;
    _authToken = null;
  }

  static Map<String, String> _getAuthHeaders() {
    final headers = {'Content-Type': 'application/json'};
    if (_authToken != null) {
      headers['Authorization'] = 'Bearer $_authToken';
    }
    return headers;
  }

  // ----------------- User Auth -----------------
  static Future<Map<String, dynamic>> signup(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final user = UserModel.fromJson(data['user']);
        
        // Store user data after successful signup
        if (data['token'] != null) {
          setCurrentUser(user.id, data['token']);
        }

        return {
          'success': true,
          'user': user,
          'token': data['token'],
          'message': data['message']
        };
      } else {
        return {
          'success': false,
          'error': data['error'] ?? "Signup failed"
        };
      }
    } catch (e) {
      return {
        'success': false,
        'error': "Network error: $e"
      };
    }
  }

  static Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final user = UserModel.fromJson(data['user']);
        
        // Store user data after successful login
        if (data['token'] != null) {
          setCurrentUser(user.id, data['token']);
        }

        return {
          'success': true,
          'user': user,
          'token': data['token'],
          'message': data['message'] ?? 'Login successful'
        };
      } else {
        return {
          'success': false,
          'error': data['error'] ?? "Login failed"
        };
      }
    } catch (e) {
      return {
        'success': false,
        'error': "Network error: $e"
      };
    }
  }

  // ----------------- Medicines -----------------
  static Future<List<Medicine>> fetchMedicines() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/medicines'),
        headers: _getAuthHeaders(),
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        return data.map((json) => Medicine.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load medicines: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Network error: $e");
    }
  }

  // Search medicines
  static Future<List<Medicine>> searchMedicines(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/medicines/search?q=$query'),
        headers: _getAuthHeaders(),
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        return data.map((json) => Medicine.fromJson(json)).toList();
      } else {
        throw Exception("Search failed");
      }
    } catch (e) {
      throw Exception("Search error: $e");
    }
  }

  // ----------------- Cart Management -----------------
  static Future<void> addToCart(String medicineId, {int quantity = 1}) async {
    if (_currentUserId == null) {
      throw Exception("User not logged in");
    }

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/cart/add'),
        headers: _getAuthHeaders(),
        body: jsonEncode({
          'userId': _currentUserId,
          'medicineId': medicineId,
          'quantity': quantity,
        }),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        final errorData = jsonDecode(response.body);
        throw Exception(errorData['message'] ?? "Failed to add to cart");
      }
    } catch (e) {
      throw Exception("Add to cart error: $e");
    }
  }

  static Future<List<dynamic>> getCartItems() async {
    if (_currentUserId == null) {
      throw Exception("User not logged in");
    }

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/cart/$_currentUserId'),
        headers: _getAuthHeaders(),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to load cart");
      }
    } catch (e) {
      throw Exception("Cart fetch error: $e");
    }
  }

  static Future<void> removeFromCart(String medicineId) async {
    if (_currentUserId == null) {
      throw Exception("User not logged in");
    }

    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/cart/remove'),
        headers: _getAuthHeaders(),
        body: jsonEncode({'userId': _currentUserId, 'medicineId': medicineId}),
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to remove from cart");
      }
    } catch (e) {
      throw Exception("Remove from cart error: $e");
    }
  }

  static Future<void> updateCartQuantity(
    String medicineId,
    int quantity,
  ) async {
    if (_currentUserId == null) {
      throw Exception("User not logged in");
    }

    try {
      final response = await http.put(
        Uri.parse('$baseUrl/cart/update'),
        headers: _getAuthHeaders(),
        body: jsonEncode({
          'userId': _currentUserId,
          'medicineId': medicineId,
          'quantity': quantity,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to update cart");
      }
    } catch (e) {
      throw Exception("Update cart error: $e");
    }
  }

  static Future<void> clearCart() async {
    if (_currentUserId == null) {
      throw Exception("User not logged in");
    }

    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/cart/clear/$_currentUserId'),
        headers: _getAuthHeaders(),
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to clear cart");
      }
    } catch (e) {
      throw Exception("Clear cart error: $e");
    }
  }

  // ----------------- Orders -----------------
  static Future<List<Order>> fetchOrders(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/order/$userId'),
        headers: _getAuthHeaders(),
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        return data.map((json) => Order.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load orders");
      }
    } catch (e) {
      throw Exception("Order fetch error: $e");
    }
  }

  static Future<Order> createOrder(List<String> medicineIds) async {
    if (_currentUserId == null) {
      throw Exception("User not logged in");
    }

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/order'),
        headers: _getAuthHeaders(),
        body: jsonEncode({'userId': _currentUserId, 'medicines': medicineIds}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return Order.fromJson(data);
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(errorData['message'] ?? "Failed to create order");
      }
    } catch (e) {
      throw Exception("Create order error: $e");
    }
  }

  // Create order from cart
  static Future<Order> createOrderFromCart() async {
    if (_currentUserId == null) {
      throw Exception("User not logged in");
    }

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/order/from-cart'),
        headers: _getAuthHeaders(),
        body: jsonEncode({'userId': _currentUserId}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return Order.fromJson(data);
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
          errorData['message'] ?? "Failed to create order from cart",
        );
      }
    } catch (e) {
      throw Exception("Create order from cart error: $e");
    }
  }

  // ----------------- Wishlist -----------------
  static Future<void> addToWishlist(String medicineId) async {
    if (_currentUserId == null) {
      throw Exception("User not logged in");
    }

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/wishlist/add'),
        headers: _getAuthHeaders(),
        body: jsonEncode({'userId': _currentUserId, 'medicineId': medicineId}),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception("Failed to add to wishlist");
      }
    } catch (e) {
      throw Exception("Add to wishlist error: $e");
    }
  }

  static Future<List<Medicine>> getWishlistItems() async {
    if (_currentUserId == null) {
      throw Exception("User not logged in");
    }

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/wishlist/$_currentUserId'),
        headers: _getAuthHeaders(),
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        return data.map((json) => Medicine.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load wishlist");
      }
    } catch (e) {
      throw Exception("Wishlist fetch error: $e");
    }
  }

  // ----------------- Utility Methods -----------------
  static bool get isLoggedIn => _currentUserId != null && _authToken != null;
  static String? get currentUserId => _currentUserId;
}


