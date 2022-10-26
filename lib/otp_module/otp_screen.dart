import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internalship_task/component/shared_component/shared_button.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final defaultPinTheme = PinTheme(
    //   width: 56,
    //   height: 56,
    //   textStyle: TextStyle(
    //       fontSize: 20,
    //       color: Color.fromRGBO(30, 60, 87, 1),
    //       fontWeight: FontWeight.w600),
    //   decoration: BoxDecoration(
    //     border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
    //     borderRadius: BorderRadius.circular(20),
    //   ),
    // );
    //
    // final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    //   border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
    //   borderRadius: BorderRadius.circular(8),
    // );
    //
    // final submittedPinTheme = defaultPinTheme.copyWith(
    //   decoration: defaultPinTheme.decoration!.copyWith(
    //     color: Color.fromRGBO(234, 239, 243, 1),
    //   ),
    // );

    return Scaffold(
      body: SafeArea(
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
              child:  Text(
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
              function: () {},
            ),
          ],
        ),
      ),
    );
  }
}
