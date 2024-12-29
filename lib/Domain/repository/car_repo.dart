import 'package:rental_car/Domain/entity/CarEntity.dart';

abstract class CarRepo {
  Future<List<CarEntity>> fetchData();
}