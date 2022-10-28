import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductBannerWidget extends StatelessWidget {
  const ProductBannerWidget({
    Key? key,
    required this.img,
  }) : super(key: key);
  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 5,
      ),
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 14),
        height: 105,
        width: 105,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 4,
              offset: Offset.fromDirection(
                25,
              ),
            ),
          ],
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 15),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  img,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
