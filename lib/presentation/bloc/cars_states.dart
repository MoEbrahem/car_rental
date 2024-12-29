import 'package:rental_car/Domain/entity/CarEntity.dart';

abstract class CarsStates {}

class CarsLoading extends CarsStates{
  
}
class CarsInitial extends CarsStates{}

class CarsLoaded extends CarsStates{
  List<CarEntity> cars;

  CarsLoaded(this.cars);
}
class CarsError extends CarsStates{
  String errMessage;

  CarsError(this.errMessage);
}