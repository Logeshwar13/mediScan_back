class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? address; // Make address optional since backend doesn't have it

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'], // Can be null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'phone': phone,
      if (address != null) 'address': address,
    };
  }
}