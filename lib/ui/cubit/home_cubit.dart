
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getir_clone_app/data/entity/list_view.dart';
import 'package:getir_clone_app/data/repository/getir_repository.dart';

class HomeCubit extends Cubit<List<CategoryModel>> {
  HomeCubit():super(<CategoryModel>[]);

  var gRepo = GetirRepository();

  Future<void> loadCategory() async{
    var list = await gRepo.categoryList();
    emit(list);
  }





}