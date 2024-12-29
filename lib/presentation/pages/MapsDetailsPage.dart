import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rental_car/Domain/entity/CarEntity.dart';
class Mapsdetailspage extends StatelessWidget {
  final CarEntity car;
  const Mapsdetailspage({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          FlutterMap(
            options:const MapOptions(
              initialCenter: LatLng(51, -0.09),
              initialZoom: 13,
            ),
            children: [
            
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
              
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: carDetailsCard(car),
          )
        ],
      ),
    );
  }
}

Widget carDetailsCard(CarEntity car) {
  return SizedBox(
    height: 350,
    child: Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.black54,
              boxShadow: [
                BoxShadow(
                    spreadRadius: 0, blurRadius: 10, color: Colors.black38),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                car.model,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.directions_car,
                    size: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "> ${car.distance} km",
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Icon(
                    Icons.battery_full,
                    size: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "> ${car.fuelCapacity} L",
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Features",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                featureIcons(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ ${car.priceperhour}/h",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      child: const Text(
                        "Book Now",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 50,
          right: 0,
          child: Image.asset("assets/white_car.png",width: 150,),
        ),
      ],
    ),
  );
}

Widget featureIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      featureIcon(Icons.local_gas_station, 'Diesel', "Common Rail"),
      featureIcon(Icons.speed, 'Acceleration', "0-100 km/s"),
      featureIcon(Icons.ac_unit, 'Cold', "Temp Control"),
    ],
  );
}

Widget featureIcon(IconData icon, String title, String subTitle) {
  return Container(
    height: 100,
    width: 100,
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Colors.grey,
        width: 1,
      ),
    ),
    child: Column(
      children: [
        Icon(
          icon,
          size: 28,
        ),
        Text(title,style: TextStyle(fontSize: 12),),
        Text(
          subTitle,
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        )
      ],
    ),
  );
}
