import 'dart:convert';

class Book {
  String label;
  String? addressNumber; // car peut être null
  String address;
  String city;

  Book({
    required this.label,
    this.addressNumber, // car peut être null
    required this.address,
    required this.city,
  });

  factory Book.fromRowJson(String str) => Book.fromJson(json.decode(str));

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        label: json['nom'],
        addressNumber: json['num_voie'] ??
            "", // car peut être null (faire ternaire pour contrôler la nullité)
        address: json['voie'],
        city: json['communes'],
      );
}
