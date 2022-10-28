import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internalship_task/component/shared_component/background.dart';
import 'package:internalship_task/component/shared_component/navigation_function.dart';
import 'package:internalship_task/component/shared_component/shared_button.dart';
import 'package:internalship_task/modules/help_module/help_screen.dart';
import 'package:internalship_task/modules/otp_module/cubit/otp_cubit.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OtpCubit>(
      create: (context) => OtpCubit(),
      child: BlocConsumer<OtpCubit, OtpState>(
        builder: (context, state) {
          var cubit = OtpCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child:Stack(
                children: [
                  const BackgroundWidget(),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 50,) ,
                        const Text(
                          "Verify Phone",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ) ,
                        const SizedBox(height: 120,) ,
                        OtpTextField(
                          autoFocus: true,
                          fieldWidth: 50,
                          numberOfFields: 4,
                          borderColor: const Color(0xFF512DA8),
                          fillColor: Colors.white,
                          filled: true,
                          cursorColor: Colors.blue,
                          showFieldAsBox: false,
                          onCodeChanged: (String code) {},
                          onSubmit: (String verificationCode) {}, // end onSubmit
                        ) ,
                        const SizedBox(height: 140,) ,
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Resend Code',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: HexColor('#0062BD'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        ConditionalBuilder(
                          condition: state is! OtpLoadingState,
                          builder: (context) {
                            return MyButton(
                              text: 'Verify',
                              function: () {
                                cubit.otpVerify();
                              },
                            );
                          },
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is OtpSuccessState) {
            pushReplacement(context, const HelpScreen());
          }
        },
      ),
    );
  }
}
