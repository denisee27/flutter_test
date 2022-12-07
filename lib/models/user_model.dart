class UserModel {
  final int id;
  final String email;
  final String first_name;
  final String token;

  const UserModel({
    required this.id,
    required this.email,
    required this.first_name,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      first_name: json['first_name'],
      token: json['token'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'email': email,
  //     'first_name': first_name,
  //     'token': token,
  //   };
  // }
}
