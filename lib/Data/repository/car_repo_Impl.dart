import 'package:rental_car/Data/dataSources/Car_Data_Impl.dart';
import 'package:rental_car/Domain/entity/CarEntity.dart';
import 'package:rental_car/Domain/repository/car_repo.dart';

class CarRepoImpl implements CarRepo {
  FireBaseCarDataImpl fireBaseCarDataImpl;
  CarRepoImpl({required this.fireBaseCarDataImpl});

  @override
  Future<List<CarEntity>> fetchData() async{
    return await fireBaseCarDataImpl.getCar();
  }
  
}