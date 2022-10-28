import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
