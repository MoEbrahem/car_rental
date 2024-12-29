import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:rental_car/Data/Models/carModel.dart';
import 'package:rental_car/Domain/entity/CarEntity.dart';

class FireBaseCarDataImpl {

  FirebaseFirestore firestore ;
  FireBaseCarDataImpl({required this.firestore});


  Future<List<CarEntity>> getCar() async{
    var snapshot = await firestore.collection("cars").get();
    return snapshot.docs.map((doc)=>CarModel.fromJson(doc.data())).toList();
  }
  
}