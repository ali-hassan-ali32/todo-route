class UserModel {
  String name;
  String id;
  String phone;
  String email;

  UserModel(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        email: json['email']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'phone': phone, 'email': email};
  }
}
