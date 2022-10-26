import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internalship_task/component/shared_component/navigation_function.dart';
import 'package:internalship_task/component/shared_component/shared_button.dart';
import 'package:internalship_task/modules/help_module/help_screen.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          HexColor('#0062BD').withOpacity(.85),
                          HexColor('#0062BD').withOpacity(0)
                        ],
                      ),
                    ),
                    width: double.infinity,
                    height: 420,
                  ),
                  const Positioned(
                    top: 62,
                    left: 122,
                    child: Text(
                      "Verify Phone",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 240,
                    left: 80,
                    child: OtpTextField(
                      autoFocus: true,
                      fieldWidth: 50,
                      numberOfFields: 4,
                      borderColor: const Color(0xFF512DA8),
                      fillColor: Colors.white,
                      filled: true,
                      cursorColor: Colors.blue,
                      showFieldAsBox: false,
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Verification Code"),
                                content:
                                    Text('Code entered is $verificationCode'),
                              );
                            });
                      }, // end onSubmit
                    ),
                  ),
                ],
              ),
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
              MyButton(
                text: 'Verify',
                function: () {
                  push(
                    context,
                    const HelpScreen(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
