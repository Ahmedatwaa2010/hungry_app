class UserModel {
  final String name;
  final String email;
  final String? token;
  final String? address;
  final String? image;
  final String? visa;
  final String? password;

  UserModel({
    required this.name,
    required this.email,
    this.token,
    this.address,
    this.image,
    this.visa,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      token: json['token'] ?? "",
      address: json['address'] ?? "",
      image: json['image'] ?? "",
      visa: json['Visa'] ?? "",
      password: json['password'] ?? "",
    );
  }
}
