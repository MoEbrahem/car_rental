import 'package:flutter/material.dart';
import 'package:rental_car/Domain/entity/CarEntity.dart';
import 'package:rental_car/presentation/pages/MapsDetailsPage.dart';
import 'package:rental_car/presentation/widgets/car_card.dart';
import 'package:rental_car/presentation/widgets/more_cards.dart';

class CarDetailsscreen extends StatefulWidget {
  final CarEntity car;

  const CarDetailsscreen({super.key, required this.car});

  @override
  State<CarDetailsscreen> createState() => _CarDetailsscreenState();
}

class _CarDetailsscreenState extends State<CarDetailsscreen>  with SingleTickerProviderStateMixin {

  Animation<double>? _animation;
  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: const Duration(seconds: 3));
    _animation = Tween<double>(begin: 1.0,end: 1.5).animate(_controller!)..addListener((){
      setState(() {
        
      });
    });
    _controller!.forward();
    super.initState();
  }
  @override
  void dispose() {
    _controller!.forward();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF3F3F3),
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.11),
            const Icon(
              Icons.error_outline,
            ),
            const Text(
              " Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarCard(car: widget.car),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffF3F3F3),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/user.png",
                            ),
                            radius: 40,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.03,
                          ),
                          const Text(
                            "Jame Cooper",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "\$ 4,253",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Mapsdetailspage(car: widget.car),
                          ),
                        );
                      },
                      child: Container(
                        height: 170,
                        decoration: const BoxDecoration(
                          color:  Color(0xffF3F3F3),
                          boxShadow:  [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Transform.scale(
                          scale: _animation!.value,
                          alignment: Alignment.center,
                          child: Image.asset( "assets/maps.png",fit: BoxFit.cover,),
                          
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  MoreCards(car: widget.car),
                  const SizedBox(
                    height: 5,
                  ),
                  MoreCards(car: widget.car),
                  const SizedBox(
                    height: 5,
                  ),
                  MoreCards(car: widget.car),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
