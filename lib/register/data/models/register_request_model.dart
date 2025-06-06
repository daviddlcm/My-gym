class RegisterRequestModel {
  final String email;
  final String password;
  final String full_name;

  RegisterRequestModel({
    required this.email,
    required this.password,
    required this.full_name,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'full_name': full_name,
    };
  }

}