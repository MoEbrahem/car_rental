import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:rental_car/Data/dataSources/Car_Data_Impl.dart';
import 'package:rental_car/Data/repository/car_repo_Impl.dart';
import 'package:rental_car/Domain/UseCases/Car_Use_Case.dart';
import 'package:rental_car/Domain/repository/car_repo.dart';
import 'package:rental_car/presentation/bloc/cars_bloc.dart';

GetIt getIt = GetIt.instance;

void initInjection(){
  getIt.registerLazySingleton<FirebaseFirestore>(()=>FirebaseFirestore.instance);
  getIt.registerLazySingleton<FireBaseCarDataImpl>(()=>FireBaseCarDataImpl(firestore: getIt<FirebaseFirestore>()));
  getIt.registerLazySingleton<CarRepo>(()=>CarRepoImpl(fireBaseCarDataImpl: getIt<FireBaseCarDataImpl>()));
  getIt.registerLazySingleton<CarUseCase>(()=>CarUseCase(carRepo: getIt<CarRepo>()));
  getIt.registerFactory<CarsBloc>(()=>CarsBloc(carUseCase: getIt<CarUseCase>()));
}