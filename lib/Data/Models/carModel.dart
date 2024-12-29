import 'package:rental_car/Domain/entity/CarEntity.dart';

class CarModel extends CarEntity{
  CarModel({
    required super.model,
    required super.distance,
    required super.priceperhour,
    required super.fuelCapacity,
  });

  factory CarModel.fromJson(Map<String,dynamic> json){
    return CarModel(model: json['model'], distance: json['distance'], priceperhour: json['priceperhour'], fuelCapacity: json['fuelCapacity'],);
  }
}
