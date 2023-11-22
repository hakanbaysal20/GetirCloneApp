
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getir_clone_app/data/entity/adress_model.dart';
import 'package:getir_clone_app/data/entity/category_model.dart';
import 'package:getir_clone_app/data/entity/list_models.dart';
import 'package:getir_clone_app/data/repository/getir_repository.dart';

class HomeCubit extends Cubit<ListModels> {
  HomeCubit():super(ListModels(categoryModel: [], adressModel: []));

  var gRepo = GetirRepository();

  Future<void> loadCategory() async{
    var list = await gRepo.categoryList();
    emit(state.copyWith(categoryModel: list));
  }
  Future<void> loadAdress() async {
    var adress = await gRepo.adressList();
    emit(state.copyWith(adressModel: adress));
  }
}