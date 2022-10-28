import 'package:flutter/material.dart';

import '../../component/constant/constant.dart';
import '../../component/widgets/prod_banner_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    Key? key,
    required this.prodName,
    required this.prodImg,
    required this.prodPrice,
    required this.prodType,
  }) : super(key: key);
  final String prodName;

  final String prodPrice;

  final String prodImg;

  final String prodType;

  Widget backgroundWidget() {
    return Container(
      width: double.infinity,
      height: 420,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xff0062BD).withOpacity(
              .85,
            ),
            const Color(0xff0062BD).withOpacity(
              .0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundWidget(),
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 23,
                right: 23,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                0.5,
                              ),
                              spreadRadius: 5,
                              blurRadius: 5,
                            )
                          ],
                          borderRadius: BorderRadius.circular(15)),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xffB1B1B1),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    prodName,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Type: $prodType',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 300,
                      width: 364,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 4,
                              offset: Offset.fromDirection(20))
                        ],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 40),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(prodImg),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return ProductBannerWidget(
                              img: prodImg,
                            );
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    width: double.infinity,
                    height: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 4,
                              offset: Offset.fromDirection(20))
                        ],
                        color: Colors.white),
                    child: Row(children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset.fromDirection(20))
                            ],
                            color: Colors.white),
                        child: Container(
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                prodImg,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Acer Official Store',
                                style: TextStyle(fontSize: 17),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'View Store',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xffB1B1B1)),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 62,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: Offset.fromDirection(20))
                                ],
                                color: Colors.white),
                            child: const Icon(
                              Icons.navigate_next_outlined,
                              color: Color(0xff0062BD),
                            )),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Price',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xffB1B1B1)),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            '$prodPrice EGP',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 28,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 44,
                          width: 208,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xff0062bd).withOpacity(1),
                                  const Color(0xff0062bd).withOpacity(.5),
                                  const Color(0xff0062bd).withOpacity(.27),
                                ],
                              )),
                          child: const Center(
                              child: Text(
                            'Add To Cart',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 57),
                    child: Divider(
                      height: 37,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Overview',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Specification',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(
                            0xffB1B1B1,
                          ),
                        ),
                      ),
                      Text(
                        'Review',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(
                            0xffB1B1B1,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    loremText,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffB1B1B1)),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
