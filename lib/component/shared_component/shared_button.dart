import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyButton extends StatelessWidget {
   MyButton({Key? key , required this.text , required this.function }) : super(key: key);
  final String  text ;
 final Function function ;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        function();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            colors: [
              HexColor("#0062bd").withOpacity(1),
              HexColor('#0062bd').withOpacity(.5),
              HexColor('#0062bd').withOpacity(.27),
            ],
          ),
        ),
        width: 282,
        height: 50,
        child:  Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
