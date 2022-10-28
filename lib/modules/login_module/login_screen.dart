import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internalship_task/component/constant/constant.dart';
import 'package:internalship_task/component/shared_component/shared_button.dart';
import 'package:internalship_task/modules/login_module/cubit/login_cubit.dart';

import '../../component/shared_component/navigation_function.dart';
import '../otp_module/otp_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        builder: (context, state) {
          var cubit = LoginCubit.get(context).loginModel;
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Stack(
                  alignment: const Alignment(0, -.5),
                  children: [
                    SizedBox(
                      height: size.height,
                      child: Stack(
                        children: [
                          Stack(
                            children: [
                              const Image(
                                image: AssetImage(
                                  'assets/images/bg.png',
                                ),
                                width: double.infinity,
                                fit: BoxFit.fill,
                                height: 400,
                              ),
                              Container(
                                width: double.infinity,
                                height: 400,
                                color: HexColor('#0062BD').withOpacity(.4),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: size.height * .6,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  topLeft: Radius.circular(25),
                                ),
                              ),
                            ),
                          ) ,
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
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 37,
                            ),
                            const Text(
                              "Welcome",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 37,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              child: PhysicalModel(
                                borderRadius: BorderRadius.circular(10),
                                elevation: 8,
                                color: Colors.white,
                                shadowColor: HexColor('#000000').withOpacity(
                                  .25,
                                ),
                                child: TextFormField(
                                  controller: nameController,
                                  validator: (String ? value){
                                    if(value!.isEmpty){
                                      return 'Enter your full name' ;
                                    }else{
                                      return null ;
                                    }
                                  },
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
                                  validator: (String ? value){
                                    if(value!.isEmpty){
                                      return 'Enter your phone number' ;
                                    }else{
                                      return null ;
                                    }
                                  },
                                  keyboardType: TextInputType.phone,
                                  controller: phoneController,
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
                            ConditionalBuilder(
                              condition: state is! LoginLoadingState,
                              builder: (context) {
                                return MyButton(
                                  width: width,
                                  text: 'Login',
                                  function: () {
                                    if(formKey.currentState!.validate()){
                                      LoginCubit.get(context).login(
                                        name: nameController.text,
                                        phone: phoneController.text,
                                      );
                                    }
                                  },
                                );
                              },
                              fallback: (context) => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is LoginSuccessState) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Verification Code"),
                  content: Container(
                    padding: const EdgeInsets.all(5),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'your verification code is $code ',
                        ),
                        TextButton(
                          child: const Text("Continue"),
                          onPressed: () {
                            pushReplacement(context, const OTPScreen());
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is LoginErrorState) {
            Fluttertoast.showToast(
                msg: LoginCubit.get(context).loginModel!.message.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
      ),
    );
  }
}
