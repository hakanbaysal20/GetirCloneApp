import 'package:getir_clone_app/data/entity/city_model.dart';
import 'package:getir_clone_app/data/entity/type_model.dart';

class AdressModel{
  int adressId;
  String adressPath;
  TypeModel type;
  CityModel city;

  AdressModel({required this.adressId,required this.adressPath,required this.type,required this.city});
}

