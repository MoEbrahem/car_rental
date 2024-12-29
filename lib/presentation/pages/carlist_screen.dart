import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_car/injection.dart';
import 'package:rental_car/presentation/bloc/cars_bloc.dart';
import 'package:rental_car/presentation/bloc/cars_event.dart';
import 'package:rental_car/presentation/bloc/cars_states.dart';
import 'package:rental_car/presentation/widgets/car_card.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class CarListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Choose Your Car"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocProvider(
      create:(_)=> getIt<CarsBloc>()..add(LoadedCars()),
      child: BlocBuilder<CarsBloc, CarsStates>(
        builder: (context, state) {
            if (state is CarsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CarsLoaded) {
              return ListView.builder(
                itemCount: state.cars.length,
                itemBuilder: (context, index) {
                  return CarCard(car: state.cars[index]);
                },
              );
            } else if (state is CarsError) {
              return Center(
                child: Text(state.errMessage),
              );
            } else {
            return Container();
            }
          },
        ),
      ),
    );
  }
}
