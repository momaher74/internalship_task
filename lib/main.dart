import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internalship_task/component/constant/constant.dart';
import 'package:internalship_task/helpers/local_helper/shared_pref.dart';
import 'package:internalship_task/helpers/networks/dio_helper.dart';
import 'package:internalship_task/modules/home_module/homescreen.dart';
import 'package:internalship_task/modules/login_module/login_screen.dart';
import 'component/shared_component/observar.dart';
import 'modules/help_module/cubit/help_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  logged = await CacheHelper.getData(key: 'logged') ?? false;
  print(logged);
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HelpCubit()..getHelp(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: logged == true ? const HomeScreen() : LoginScreen(),
      ),
    );
  }
}
