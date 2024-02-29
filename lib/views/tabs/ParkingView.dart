import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petite_appli/models/Parking.dart';

class ParkingView extends StatefulWidget {
  const ParkingView({super.key});

  @override
  State<ParkingView> createState() => _ParkingViewState();
}

Future<List<Parking>> fetchParkingAreas() async {
  try {
    final response = await http.get(
      Uri.parse(
          "https://dijon-metropole.opendatasoft.com/api/explore/v2.1/catalog/datasets/dispo-parking/records?limit=20"),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final results = json['results'] as List<dynamic>;

      return results.map((json) => Parking.fromJson(json)).toList();
    } else {
      throw Exception('failed to load bike spots');
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

class _ParkingViewState extends State<ParkingView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchParkingAreas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData) {
          List<Parking> parkings = snapshot.data!;
          return ListView.builder(
              itemCount: parkings.length,
              itemBuilder: (context, index) {
                Parking parking = parkings[index];
                String spotRatio =
                    '${parking.availableSpots} / ${parking.totalSpots}';

                return ListTile(
                  title: Text(parking.label),
                  subtitle: Text(parking.address),
                  leading: Text(spotRatio),
                );
              });
        } else {
          return const Text('une erreur est survenue');
        }
      },
    );
  }
}
