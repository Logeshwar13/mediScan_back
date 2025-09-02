import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/medicine.dart'; // Import your model

class ProductCard extends StatefulWidget {
  final Medicine medicine; // pass the whole object

  const ProductCard({Key? key, required this.medicine}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with SingleTickerProviderStateMixin {
  bool _isAddingToCart = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _addToCart(BuildContext context) async {
    if (_isAddingToCart) return;

    setState(() => _isAddingToCart = true);
    await _animationController.forward();
    await _animationController.reverse();

    try {
      await ApiService.addToCart(widget.medicine.id);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${widget.medicine.name} added to cart!")),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to add ${widget.medicine.name}: $e")),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isAddingToCart = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final med = widget.medicine;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            med.imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.local_hospital, size: 40, color: Colors.grey),
          ),
        ),
        title: Text(
          med.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          "₹${med.price.toStringAsFixed(2)}",
          style: const TextStyle(color: Colors.green, fontSize: 14),
        ),
        trailing: IconButton(
          icon: _isAddingToCart
              ? const CircularProgressIndicator()
              : const Icon(Icons.add_shopping_cart, color: Colors.blue),
          onPressed: _isAddingToCart ? null : () => _addToCart(context),
        ),
      ),
    );
  }
}
