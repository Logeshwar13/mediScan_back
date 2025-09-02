

// import 'package:flutter/material.dart';
// import '../services/api_service.dart';
// import '../models/medicine.dart';
// import '../widgets/product_card.dart';
// import 'cart_screen.dart';
// import 'scanner_screen.dart';
// import 'wishlist_screen.dart';
// import 'profile_screen.dart';
// import 'all_products_screen.dart'; // You'll need to create this screen

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;
//   final ScrollController _productScrollController = ScrollController();
  
//   // API Data
//   List<Medicine> _medicines = [];
//   bool _isLoadingMedicines = false;
//   String? _errorMessage;

//   @override
//   void initState() {
//     super.initState();
//     _loadMedicines();
//   }

//   Future<void> _loadMedicines() async {
//     setState(() {
//       _isLoadingMedicines = true;
//       _errorMessage = null;
//     });

//     try {
//       final medicines = await ApiService.fetchMedicines();
//       setState(() {
//         _medicines = medicines;
//         _isLoadingMedicines = false;
//       });
//     } catch (e) {
//       setState(() {
//         _errorMessage = e.toString().replaceAll('Exception: ', '');
//         _isLoadingMedicines = false;
//       });
//     }
//   }

//   void _onNavBarTap(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     switch (index) {
//       case 0:
//         // Already on Home
//         break;
//       case 1:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const CartScreen()),
//         );
//         break;
//       case 2:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const WishlistScreen()),
//         );
//         break;
//       case 3:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const ProfileScreen()),
//         );
//         break;
//     }
//   }

//   void _onScannerTap() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const ScannerScreen()),
//     );
//   }

//   void _navigateToAllProducts() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => AllProductsScreen(medicines: _medicines),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _productScrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFFE8B3FF),
//               Color(0xFFF0C4FF),
//               Colors.white,
//             ],
//             stops: [0.0, 0.3, 1.0],
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               // Fixed Header
//               Container(
//                 color: Colors.transparent,
//                 child: Column(
//                   children: [
//                     // Top Header with Profile, App Title, and Cart
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           GestureDetector(
//                             onTap: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const ProfileScreen(),
//                               ),
//                             ),
//                             child: Container(
//                               decoration: const BoxDecoration(
//                                 color: Colors.white,
//                                 shape: BoxShape.circle,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black12,
//                                     blurRadius: 10,
//                                     offset: Offset(0, 2),
//                                   ),
//                                 ],
//                               ),
//                               padding: const EdgeInsets.all(12),
//                               child: const Icon(Icons.person, size: 24),
//                             ),
//                           ),
//                           // App Title in the center
//                           const Text(
//                             'MediScan',
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                               shadows: [
//                                 Shadow(
//                                   color: Colors.black26,
//                                   offset: Offset(0, 2),
//                                   blurRadius: 4,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const CartScreen(),
//                               ),
//                             ),
//                             child: Container(
//                               decoration: const BoxDecoration(
//                                 color: Colors.white,
//                                 shape: BoxShape.circle,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black12,
//                                     blurRadius: 10,
//                                     offset: Offset(0, 2),
//                                   ),
//                                 ],
//                               ),
//                               padding: const EdgeInsets.all(12),
//                               child: const Icon(Icons.shopping_cart, size: 24),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     // Search Bar
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white.withOpacity(0.9),
//                           borderRadius: BorderRadius.circular(25),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.1),
//                               blurRadius: 10,
//                               offset: const Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: 'Search medicine',
//                             prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
//                             border: InputBorder.none,
//                             contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 20,
//                               vertical: 15,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),

//               // Scrollable Content
//               Expanded(
//                 child: RefreshIndicator(
//                   onRefresh: _loadMedicines,
//                   child: SingleChildScrollView(
//                     physics: const BouncingScrollPhysics(),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Promotional Banner
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: Container(
//                             height: 160,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.1),
//                                   blurRadius: 10,
//                                   offset: const Offset(0, 5),
//                                 ),
//                               ],
//                             ),
//                             child: Stack(
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     gradient: const LinearGradient(
//                                       colors: [Color(0xFF4A90E2), Color(0xFF7B68EE)],
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   left: 20,
//                                   top: 15,
//                                   child: Container(
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 10,
//                                       vertical: 5,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color: Colors.red,
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     child: const Text(
//                                       '30% OFF',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 11,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const Positioned(
//                                   left: 20,
//                                   bottom: 35,
//                                   child: Text(
//                                     'On Tablets',
//                                     style: TextStyle(color: Colors.white, fontSize: 13),
//                                   ),
//                                 ),
//                                 const Positioned(
//                                   left: 20,
//                                   bottom: 10,
//                                   child: Text(
//                                     'Exclusive Sales',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),

//                         const SizedBox(height: 20),

//                         // Category Section
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Text(
//                                 'Category',
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black87,
//                                 ),
//                               ),
//                               TextButton(
//                                 onPressed: () {},
//                                 child: const Text(
//                                   'See All',
//                                   style: TextStyle(
//                                     color: Color(0xFF7B68EE),
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         const SizedBox(height: 12),

//                         // Category Icons
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               _buildCategoryItem(
//                                 icon: Icons.medication,
//                                 label: 'Tablets',
//                                 color: const Color(0xFFFF6B6B),
//                               ),
//                               _buildCategoryItem(
//                                 icon: Icons.local_drink,
//                                 label: 'Syrups',
//                                 color: const Color(0xFF4ECDC4),
//                               ),
//                               _buildCategoryItem(
//                                 icon: Icons.healing,
//                                 label: 'Ointments',
//                                 color: const Color.fromARGB(255, 255, 213, 0),
//                               ),
//                               _buildCategoryItem(
//                                 icon: Icons.water_drop,
//                                 label: 'Drops',
//                                 color: const Color(0xFF95E1D3),
//                               ),
//                             ],
//                           ),
//                         ),

//                         const SizedBox(height: 25),

//                         // Featured Products Header
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Text(
//                                 'Featured Products',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black87,
//                                 ),
//                               ),
//                               TextButton(
//                                 onPressed: _navigateToAllProducts,
//                                 child: const Text(
//                                   'View All',
//                                   style: TextStyle(
//                                     color: Color(0xFF7B68EE),
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         const SizedBox(height: 10),

//                         // Featured Products Section - From API
//                         _buildFeaturedProductsSection(),

//                         const SizedBox(height: 100), // Bottom padding for nav bar
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       resizeToAvoidBottomInset: true,
//       bottomNavigationBar: CustomBottomNavBar(
//         currentIndex: _selectedIndex,
//         onTap: _onNavBarTap,
//       ),
//       floatingActionButton: CustomFloatingActionButton(
//         onTap: _onScannerTap,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }

//   Widget _buildFeaturedProductsSection() {
//     if (_isLoadingMedicines) {
//       return SizedBox(
//         height: 150,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           itemCount: 3,
//           itemBuilder: (context, index) => _buildLoadingCard(),
//         ),
//       );
//     }

//     if (_errorMessage != null) {
//       return Container(
//         height: 150,
//         margin: const EdgeInsets.symmetric(horizontal: 16),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(Icons.error_outline, color: Colors.red, size: 40),
//               const SizedBox(height: 8),
//               Text(
//                 'Error loading products: $_errorMessage',
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(color: Colors.red),
//               ),
//               const SizedBox(height: 8),
//               ElevatedButton(
//                 onPressed: _loadMedicines,
//                 child: const Text('Retry'),
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     if (_medicines.isEmpty) {
//       return Container(
//         height: 150,
//         margin: const EdgeInsets.symmetric(horizontal: 16),
//         child: const Center(
//           child: Text('No products available'),
//         ),
//       );
//     }

//     return SizedBox(
//       height: 120,
//       child: ListView.builder(
//         controller: _productScrollController,
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         itemCount: _medicines.take(6).length, // Show first 6 as featured
//         physics: const BouncingScrollPhysics(),
//         itemBuilder: (context, index) {
//           final medicine = _medicines[index];
//           return SizedBox(
//             width: 300,
//             child: ProductCard(medicine: medicine),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildLoadingCard() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//       child: Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Container(
//           padding: const EdgeInsets.all(10),
//           child: Row(
//             children: [
//               // Loading image placeholder
//               Container(
//                 width: 60,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: const Center(
//                   child: CircularProgressIndicator(strokeWidth: 2),
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Loading title
//                     Container(
//                       width: double.infinity,
//                       height: 16,
//                       decoration: BoxDecoration(
//                         color: Colors.grey[300],
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     // Loading price
//                     Container(
//                       width: 80,
//                       height: 14,
//                       decoration: BoxDecoration(
//                         color: Colors.grey[300],
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Loading button
//               Container(
//                 width: 36,
//                 height: 36,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCategoryItem({
//     required IconData icon,
//     required String label,
//     required Color color,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Selected $label category'),
//             backgroundColor: color,
//             duration: const Duration(seconds: 1),
//           ),
//         );
//       },
//       child: Column(
//         children: [
//           Container(
//             width: 65,
//             height: 65,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(18),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 8,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: Icon(icon, color: color, size: 32),
//           ),
//           const SizedBox(height: 6),
//           Text(
//             label,
//             style: const TextStyle(
//               fontSize: 13,
//               fontWeight: FontWeight.w600,
//               color: Colors.black87,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Custom Bottom Navigation Component
// class CustomBottomNavBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;

//   const CustomBottomNavBar({
//     super.key,
//     required this.currentIndex,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: const Offset(0, -5),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//         child: BottomNavigationBar(
//           currentIndex: currentIndex,
//           onTap: onTap,
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Colors.white,
//           selectedItemColor: const Color(0xFF7B68EE),
//           unselectedItemColor: Colors.grey,
//           elevation: 0,
//           selectedLabelStyle: const TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 12,
//           ),
//           unselectedLabelStyle: const TextStyle(
//             fontWeight: FontWeight.w500,
//             fontSize: 11,
//           ),
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               activeIcon: Icon(Icons.home, size: 26),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_cart_outlined),
//               activeIcon: Icon(Icons.shopping_cart, size: 26),
//               label: 'My Cart',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.favorite_border),
//               activeIcon: Icon(Icons.favorite, size: 26),
//               label: 'Wishlist',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person_outline),
//               activeIcon: Icon(Icons.person, size: 26),
//               label: 'Profile',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomFloatingActionButton extends StatelessWidget {
//   final VoidCallback onTap;

//   const CustomFloatingActionButton({
//     super.key,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 65,
//         height: 65,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           shape: BoxShape.circle,
//           border: Border.all(
//             color: const Color(0xFF7B68EE).withOpacity(0.2),
//             width: 2,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.15),
//               blurRadius: 15,
//               offset: const Offset(0, 8),
//             ),
//             BoxShadow(
//               color: const Color(0xFF7B68EE).withOpacity(0.1),
//               blurRadius: 20,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: const Icon(
//           Icons.qr_code_scanner,
//           color: Color(0xFF7B68EE),
//           size: 30,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/medicine.dart';
import '../widgets/product_card.dart';
import '../widgets/navigation.dart'; // Add this import for your floating navigation
import 'cart_screen.dart';
import 'scanner_screen.dart';
import 'wishlist_screen.dart';
import 'profile_screen.dart';
import 'all_products_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final ScrollController _productScrollController = ScrollController();
  
  // API Data
  List<Medicine> _medicines = [];
  bool _isLoadingMedicines = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // _selectedIndex = 0;
    _loadMedicines();
  }

  Future<void> _loadMedicines() async {
    setState(() {
      _isLoadingMedicines = true;
      _errorMessage = null;
    });

    try {
      final medicines = await ApiService.fetchMedicines();
      setState(() {
        _medicines = medicines;
        _isLoadingMedicines = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString().replaceAll('Exception: ', '');
        _isLoadingMedicines = false;
      });
    }
  }

  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // Already on Home
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CartScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WishlistScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
        break;
    }
  }

  void _onScannerTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ScannerScreen()),
    );
  }

  void _navigateToAllProducts() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllProductsScreen(medicines: _medicines),
      ),
    );
  }

  @override
  void dispose() {
    _productScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE8B3FF),
              Color(0xFFF0C4FF),
              Colors.white,
            ],
            stops: [0.0, 0.3, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Fixed Header
              Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    // Top Header with Profile, App Title, and Cart
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileScreen(),
                              ),
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(12),
                              child: const Icon(Icons.person, size: 24),
                            ),
                          ),
                          // App Title in the center
                          const Text(
                            'MediScan',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                              shadows: [
                                Shadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CartScreen(),
                              ),
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(12),
                              child: const Icon(Icons.shopping_cart, size: 24),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Search Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search medicine',
                            prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),

              // Scrollable Content
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _loadMedicines,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Promotional Banner
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFF4A90E2), Color(0xFF7B68EE)],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  top: 15,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      '30% OFF',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  left: 20,
                                  bottom: 35,
                                  child: Text(
                                    'On Tablets',
                                    style: TextStyle(color: Colors.white, fontSize: 13),
                                  ),
                                ),
                                const Positioned(
                                  left: 20,
                                  bottom: 10,
                                  child: Text(
                                    'Exclusive Sales',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Category Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Category',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'See All',
                                  style: TextStyle(
                                    color: Color(0xFF7B68EE),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Category Icons
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildCategoryItem(
                                icon: Icons.medication,
                                label: 'Tablets',
                                color: const Color(0xFFFF6B6B),
                              ),
                              _buildCategoryItem(
                                icon: Icons.local_drink,
                                label: 'Syrups',
                                color: const Color(0xFF4ECDC4),
                              ),
                              _buildCategoryItem(
                                icon: Icons.healing,
                                label: 'Ointments',
                                color: const Color.fromARGB(255, 255, 213, 0),
                              ),
                              _buildCategoryItem(
                                icon: Icons.water_drop,
                                label: 'Drops',
                                color: const Color(0xFF95E1D3),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 25),

                        // Featured Products Header
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Featured Products',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              TextButton(
                                onPressed: _navigateToAllProducts,
                                child: const Text(
                                  'View All',
                                  style: TextStyle(
                                    color: Color(0xFF7B68EE),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Featured Products Section - From API
                        _buildFeaturedProductsSection(),

                        const SizedBox(height: 100), // Bottom padding for nav bar
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarTap,
      ),
      floatingActionButton: CustomFloatingActionButton(
        onTap: _onScannerTap,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildFeaturedProductsSection() {
    if (_isLoadingMedicines) {
      return SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 3,
          itemBuilder: (context, index) => _buildLoadingCard(),
        ),
      );
    }

    if (_errorMessage != null) {
      return Container(
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 40),
              const SizedBox(height: 8),
              Text(
                'Error loading products: $_errorMessage',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _loadMedicines,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (_medicines.isEmpty) {
      return Container(
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: const Center(
          child: Text('No products available'),
        ),
      );
    }

    return SizedBox(
      height: 120,
      child: ListView.builder(
        controller: _productScrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _medicines.take(6).length, // Show first 6 as featured
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final medicine = _medicines[index];
          return SizedBox(
            width: 300,
            child: ProductCard(medicine: medicine),
          );
        },
      ),
    );
  }

  Widget _buildLoadingCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              // Loading image placeholder
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Loading title
                    Container(
                      width: double.infinity,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Loading price
                    Container(
                      width: 80,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
              // Loading button
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Selected $label category'),
            backgroundColor: color,
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, color: color, size: 32),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}