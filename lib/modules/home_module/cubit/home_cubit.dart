import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internalship_task/helpers/networks/dio_helper.dart';
import 'package:internalship_task/models/prods_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  ProductsModel? productsModel;

  void getProducts() {
    emit(GetProdsLoadingState());
    DioHelper.getData(url: 'getProducts').then((value) {
      productsModel = ProductsModel.fromJson(value.data);
      emit(GetProdsSuccessState());
    }).catchError((error) {
      emit(GetProdsErrorState());
    });
  }
}
