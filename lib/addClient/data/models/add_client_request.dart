class AddClientRequest {
  final String full_name;
  final String email;
  final String phone_number;
  final String address;
  final String membership;
  final int last_visit;

  AddClientRequest({
    required this.full_name,
    required this.email,
    required this.phone_number,
    required this.address,
    required this.membership,
    required this.last_visit,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': full_name,
      'email': email,
      'phone_number': phone_number,
      'address': address,
      'membership': membership,
      'last_visit': last_visit,
    };
  }

}