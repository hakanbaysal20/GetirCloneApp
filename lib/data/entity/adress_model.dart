import 'package:getir_clone_app/data/entity/city_model.dart';
import 'package:getir_clone_app/data/entity/type_model.dart';

class AdressModel{
  int adress_id;
  String adress_path;
  TypeModel type;
  CityModel city;

  AdressModel({required this.adress_id,required this.adress_path,required this.type,required this.city});
}

