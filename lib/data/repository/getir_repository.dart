
import 'package:getir_clone_app/data/entity/list_view.dart';
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
}