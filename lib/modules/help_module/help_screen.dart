import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internalship_task/component/shared_component/shared_button.dart';

import '../../component/shared_component/navigation_function.dart';
import '../home_module/homescreen.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 420,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        // Color(0xff0062BD).withOpacity(.85),
                        // Color(0xff0062BD).withOpacity(.0),
                        HexColor('#0062BD').withOpacity(.85),
                        HexColor('#0062BD').withOpacity(0)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 80,
              left: 150,
              child: Text(
                'Help',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white, fontSize: 30),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: height * .84,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: Offset.fromDirection(
                                    25), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ExpansionTile(
                            backgroundColor: Colors.white,
                            title: const Text(
                              "Account",
                              style: TextStyle(
                                color: Color(
                                  0xff0062BD,
                                ),
                              ),
                            ),
                            childrenPadding: const EdgeInsets.all(20),
                            children: [
                              Text(
                                'You need to create an account to use the application but you can delete your account any time you want',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: HexColor(
                                    '#464646',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyButton(
                      text: "Continue",
                      function: () {
                         pushReplacement(context, const HomeScreen()) ;
                        print('5555555555555555');
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
