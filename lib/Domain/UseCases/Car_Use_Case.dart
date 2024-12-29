import 'package:rental_car/Domain/entity/CarEntity.dart';
import 'package:rental_car/Domain/repository/car_repo.dart';

class CarUseCase {
  CarRepo carRepo;
  CarUseCase({required this.carRepo});

  Future<List<CarEntity>> call() async{
    return await carRepo.fetchData();
  }

}