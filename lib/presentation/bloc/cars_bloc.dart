import 'package:bloc/bloc.dart';
import 'package:rental_car/Domain/UseCases/Car_Use_Case.dart';
import 'package:rental_car/presentation/bloc/cars_event.dart';
import 'package:rental_car/presentation/bloc/cars_states.dart';

class CarsBloc extends Bloc<CarsEvent,CarsStates>  {
  CarUseCase carUseCase;
  
    CarsBloc({required this.carUseCase}) : super(CarsInitial()){
      on<LoadedCars>((event, emit) async{
        emit(CarsLoading());
        try{
          final cars = await carUseCase.call();
          emit(CarsLoaded(cars));
        }catch (e){
          emit(CarsError(e.toString()));
        }
      },);
    }

  
}