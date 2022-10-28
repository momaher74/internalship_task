import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internalship_task/component/constant/constant.dart';
import 'package:internalship_task/helpers/networks/dio_helper.dart';
import 'package:internalship_task/models/login_model.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;

  void login({required String name, required String phone}) {
    emit(LoginLoadingState());
    DioHelper.postData(url: 'verifyPhone', data: {
      'phone': phone,
      'name': name,
    }).then((value) {
      // print(code);
      loginModel = LoginModel.fromJson(value.data);
      number = phone;
      code =loginModel!.code ;
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }
}
