
import 'package:getir_clone_app/data/entity/adress_model.dart';
import 'package:getir_clone_app/data/entity/category_model.dart';
import 'package:getir_clone_app/sqlite/database_assistant.dart';

class GetirRepository {

  Future<List<CategoryModel>> categoryList() async {
    var db = await DatabaseAssistant.databaseAcces();
    List<Map<String,dynamic>> rows = await db.rawQuery("SELECT * FROM category");

    return List.generate(rows.length,(index) {
      var row = rows[index];
      var category_id = row["category_id"];
      var category_name = row["category_name"];
      var category_image = row["category_image"];

      return CategoryModel(category_id: category_id, category_name: category_name, category_image: category_image);

    });

  }
  Future<List<AdressModel>> adressList() async{
    var db = await DatabaseAssistant.databaseAcces();
    List<Map<String,dynamic>> rows = await db.rawQuery("SELECT * FROM adress");
    return List.generate(rows.length, (index){
      var row = rows[index];
      var adress_id = row["adress_id"];
      var adress_path = row["adress_path"];
      var type_id = row["type_id"];
      var city_id = row["city_id"];

      return AdressModel(adress_id: adress_id, adress_path: adress_path, type_id: type_id, city_id: city_id);
    });

  }
}