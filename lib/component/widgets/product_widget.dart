import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key , required this.prod}) : super(key: key);
  final prod ;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.6),
                spreadRadius: 3,
                blurRadius: 2,
                offset: const Offset(0,
                    3), // changes position of shadow
              )
            ],
          ),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Image(
                    image: NetworkImage(
                      prod.image,
                    ),
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(
                    15.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        prod.name,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight:
                          FontWeight.w400,
                        ),
                      ),
                      width: 150,
                      height: 60,
                    ),
                    SizedBox(
                      child: Text(
                        prod.price + ' EGP',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight:
                          FontWeight.w400,
                        ),
                      ),
                      width: 200,
                      height: 22,
                    ),
                    const SizedBox(height: 20,) ,
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline,
            ),
          ),
          alignment: Alignment.topRight,
        ),
        Align(
          child: Container(
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                HexColor('#0062BD').withOpacity(1),
                HexColor('#0062BD').withOpacity(.34)
              ]),
              color: Colors.blue,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(
                  20,
                ),
              ),
            ),
          ),
          alignment: Alignment.bottomRight,
        )
      ],
    );
  }
}
