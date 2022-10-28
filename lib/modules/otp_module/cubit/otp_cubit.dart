import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internalship_task/component/constant/constant.dart';
import 'package:internalship_task/helpers/local_helper/shared_pref.dart';
import 'package:internalship_task/helpers/networks/dio_helper.dart';
import 'package:internalship_task/models/otp_model.dart';
import 'package:meta/meta.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  static OtpCubit get(context) => BlocProvider.of(context);
  OTPModel? otpModel;

  void otpVerify() {
    emit(OtpLoadingState());
    DioHelper.postData(url: 'otp', data: {
      'code': code,
      'phone': number,
    }).then((value) {
      otpModel = OTPModel.fromJson(value.data);
      emit(OtpSuccessState());
      cacheUser();
    }).catchError((error) {
      emit(OtpErrorState());
    });
  }

  void cacheUser() {
    CacheHelper.saveData(key: 'logged', value: true).then((value) {
      emit(CacheUserSuccessState());
    }).catchError((error) {
      emit(CacheUserErrorState());
    });
  }
}
