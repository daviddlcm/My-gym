class ClientUpdateRequest {
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String membershipType;

  ClientUpdateRequest({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.membershipType,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': name,
      'email': email,
      'phone_number': phoneNumber,
      'address': address,
      'membership': membershipType,
    };
  }
}