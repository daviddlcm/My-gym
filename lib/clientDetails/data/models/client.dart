class Client {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String membership;
  final String registrationDate;
  final String lastVisit;

  Client({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.membership,
    required this.registrationDate,
    required this.lastVisit,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['client_id'],
      name: json['full_name'],
      email: json['email'],
      phone: json['phone_number'],
      address: json['address'],
      membership: json['membership'],
      registrationDate: json['registration_date'],
      lastVisit: json['last_visit'],
    );
  }
}