import 'dart:convert';

class Parking {
  String code;
  String label;
  String address;
  int availableSpots;
  int totalSpots;
  int accessibleSpots;
  int motorCycleSpots;
  int electricVehicleSpots;
  int bikeSpots;

  Parking({
    required this.code,
    required this.label,
    required this.address,
    required this.availableSpots,
    required this.totalSpots,
    required this.accessibleSpots,
    required this.motorCycleSpots,
    required this.electricVehicleSpots,
    required this.bikeSpots,
  });

  factory Parking.fromRowJson(String str) => Parking.fromJson(json.decode(str));

  factory Parking.fromJson(Map<String, dynamic> json) => Parking(
        code: json['numero_parking'],
        label: json['nom_parking'],
        address: json['adresse'],
        availableSpots: json['nombre_places_libres'],
        totalSpots: json['nombre_de_places_totales'],
        accessibleSpots: json['places_pmr'],
        motorCycleSpots: json['aires_de_moto'],
        electricVehicleSpots: json['places_vehicules_electriques'],
        bikeSpots: json['emplacement_cycles'],
      );

  // Map<String, dynamic> toJson() => {
  //       'numero_parking': code,
  //       'nom_parking': label,
  //       'adresse': address,
  //       'nombre_places_libres': availableSpots,
  //       'nombre_de_places_totales': totalSpots,
  //       'places_pmr': accessibleSpots,
  //       'aires_de_moto': motorCycleSpots,
  //       'places_vehicules_electriques': electricVehicleSpots,
  //       'emplacement_cycles': bikeSpots,
  //     };
}
