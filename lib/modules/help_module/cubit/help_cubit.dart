import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internalship_task/helpers/networks/dio_helper.dart';
import 'package:internalship_task/models/help_model.dart';
import 'package:meta/meta.dart';

part 'help_state.dart';

class HelpCubit extends Cubit<HelpState> {

  HelpCubit() : super(HelpInitial());

  static HelpCubit get(context) => BlocProvider.of(context);

  HelpModel? helpModel;

  void getHelp() {
    emit(GetHelpLoadingState());
    DioHelper.getData(url: 'getHelp').then((value) {
      helpModel = HelpModel.fromJson(value.data);
      emit(GetHelpSuccessState());
    }).catchError((error) {
      emit(GetHelpErrorState());
    });
  }
  bool up = false ;
}
