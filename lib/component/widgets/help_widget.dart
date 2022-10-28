import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HelpWidget extends StatelessWidget {
   HelpWidget({Key? key , required this.item}) : super(key: key);
  final item ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding:
      const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset.fromDirection(
              25,
            ), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: ExpansionTile(
        backgroundColor: Colors.white,
        title: Text(
          item.question,
          style: const TextStyle(
            color: Color(
              0xff0062BD,
            ),
          ),
        ),
        childrenPadding: const EdgeInsets.all(13),
        children: [
          Text(
            item.answer,
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
  }
}

