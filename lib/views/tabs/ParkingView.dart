import 'package:flutter/material.dart';
import 'package:petite_appli/models/Parking.dart';
import 'package:petite_appli/services/getMethods.dart';

class ParkingView extends StatefulWidget {
  const ParkingView({super.key});

  @override
  State<ParkingView> createState() => _ParkingViewState();
}

class _ParkingViewState extends State<ParkingView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchParkingAreas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
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
