class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String token;

  const UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      token: json['token'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'email': email,
  //     'firstName': firstName,
  //     'token': token,
  //   };
  // }
}
