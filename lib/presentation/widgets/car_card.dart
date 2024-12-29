import 'package:flutter/material.dart';
import 'package:rental_car/Domain/entity/CarEntity.dart';
import 'package:rental_car/presentation/pages/car_detailsScreen.dart';

class CarCard extends StatelessWidget {
  final CarEntity car;

  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CarDetailsscreen(car: car),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xffF3F3F3),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 5,
              )
            ]),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(
              "assets/car_image.png",
              height: 120,
            ),
            Text(car.model,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/gps.png"),
                        Text(
                          '${car.distance.toStringAsFixed(0)}km',
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.035,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/pump.png"),
                        Text(
                          '${car.fuelCapacity.toStringAsFixed(0)}L',
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  '\$${car.priceperhour.toStringAsFixed(2)}/h',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
