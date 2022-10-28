import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internalship_task/component/widgets/help_widget.dart';
import 'package:internalship_task/component/shared_component/background.dart';
import 'package:internalship_task/component/shared_component/shared_button.dart';

import '../../component/shared_component/navigation_function.dart';
import '../home_module/homescreen.dart';
import 'cubit/help_cubit.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider<HelpCubit>(
      create: (context) => HelpCubit()..getHelp(),
      child: BlocConsumer<HelpCubit, HelpState>(
        builder: (context, state) {
          var cubit = HelpCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  const BackgroundWidget(),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Help',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                        ),
                         SizedBox(
                          height: cubit.helpModel==null?(height/2):50,
                        ),
                        ConditionalBuilder(
                          condition: cubit.helpModel != null,
                          builder: (context) {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                var item = cubit.helpModel!.help[index];
                                return HelpWidget(item: item);
                              },
                            );
                          },
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        if(cubit.helpModel != null)
                        MyButton(
                          text: "Continue",
                          function: () {
                            pushReplacement(context, const HomeScreen());
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
