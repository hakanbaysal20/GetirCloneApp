
import 'package:getir_clone_app/data/entity/adress_model.dart';
import 'package:getir_clone_app/data/entity/category_model.dart';
import 'package:getir_clone_app/data/entity/city_model.dart';
import 'package:getir_clone_app/data/entity/type_model.dart';
import 'package:getir_clone_app/sqlite/database_assistant.dart';

class GetirRepository {

  Future<List<CategoryModel>> categoryList() async {
    var db = await DatabaseAssistant.databaseAcces();
    List<Map<String,dynamic>> rows = await db.rawQuery("SELECT * FROM category");

    return List.generate(rows.length,(index) {
      var row = rows[index];
      var categoryId = row["category_id"];
      var categoryName = row["category_name"];
      var categoryImage = row["category_image"];

      return CategoryModel(category_id: categoryId, category_name: categoryName, category_image: categoryImage);

    });

  }
  Future<List<AdressModel>> adressList() async{
    var db = await DatabaseAssistant.databaseAcces();
    List<Map<String,dynamic>> rows = await db.rawQuery("SELECT * FROM adress,city,type WHERE adress.type_id = type.type_id and adress.city_id = city.city_id");


    return List.generate(rows.length, (index){
      var row = rows[index];
      var city = CityModel(row["city_id"], row["city_name"]);
      var type = TypeModel(row["type_id"], row["type_name"]);
      var adress = AdressModel(adressId: row["adress_id"], adressPath: row["adress_path"], type: type, city: city);

      return adress;
    });

  }
}