class Medicine {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String? category;
  final String? subcategory;
  final String? description;
  final String? brand;
  final String? sku;
  final int? stockQuantity;
  final double? rating;
  final int? reviewsCount;
  final List<String>? tags;
  final Map<String, dynamic>? specifications;
  final bool isFeatured;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Medicine({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.category,
    this.subcategory,
    this.description,
    this.brand,
    this.sku,
    this.stockQuantity,
    this.rating,
    this.reviewsCount,
    this.tags,
    this.specifications,
    this.isFeatured = false,
    this.createdAt,
    this.updatedAt,
  });

  // Factory constructor to create Medicine from JSON (MongoDB document)
  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      id: json['_id']?.toString() ?? json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      price: _parsePrice(json['price']),
      imageUrl: json['image_url']?.toString() ?? json['imageUrl']?.toString() ?? json['image']?.toString() ?? 'https://via.placeholder.com/150',
      category: json['category'],
      subcategory: json['subcategory'],
      description: json['description'],
      brand: json['brand'],
      sku: json['sku'],
      stockQuantity: json['stock_quantity'],
      rating: (json['rating'] != null) ? json['rating'].toDouble() : null,
      reviewsCount: json['reviews_count'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      specifications: json['specifications'] != null ? Map<String, dynamic>.from(json['specifications']) : null,
      isFeatured: json['is_featured'] ?? false,
      createdAt: json['created_at'] != null ? DateTime.tryParse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.tryParse(json['updated_at'].toString()) : null,
    );
  }

  // Convert Medicine to JSON for API calls
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image_url': imageUrl,
      'category': category,
      'subcategory': subcategory,
      'description': description,
      'brand': brand,
      'sku': sku,
      'stock_quantity': stockQuantity,
      'rating': rating,
      'reviews_count': reviewsCount,
      'tags': tags,
      'specifications': specifications,
      'is_featured': isFeatured,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  // Parse price safely
  static double _parsePrice(dynamic price) {
    if (price == null) return 0.0;
    if (price is double) return price;
    if (price is int) return price.toDouble();
    if (price is String) {
      String cleanPrice = price.replaceAll(RegExp(r'[₹$,\s]'), '');
      return double.tryParse(cleanPrice) ?? 0.0;
    }
    return 0.0;
  }

  // Medicine availability
  bool get isAvailable => (stockQuantity ?? 0) > 0;

  @override
  String toString() =>
      'Medicine{id: $id, name: $name, price: $price, category: $category}';
}
