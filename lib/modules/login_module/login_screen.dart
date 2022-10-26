import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internalship_task/component/shared_component/navigation_function.dart';
import 'package:internalship_task/component/shared_component/shared_button.dart';
import 'package:internalship_task/otp_module/otp_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: const Alignment(0, -.5),
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  const Image(
                    image: AssetImage(
                      'assets/images/bg.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: size.height * .65,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: size.width * .88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 8,
                    blurRadius: 8,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 37,
                  ),
                  const Text(
                    "Welcome",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: PhysicalModel(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 8,
                      color: Colors.white,
                      shadowColor: HexColor('#000000').withOpacity(.25),
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Enter your full name',
                          labelStyle: TextStyle(
                            color: HexColor('#B1B1B1'),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: PhysicalModel(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 8,
                      color: Colors.white,
                      shadowColor: HexColor('#000000').withOpacity(.25),
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Enter your phone number',
                          labelStyle: TextStyle(
                            color: HexColor('#B1B1B1'),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyButton(
                    text: 'Login',
                    function: () {
                      pushReplacement(context, const OTPScreen());
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
