import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internalship_task/component/constant/constant.dart';
import 'package:internalship_task/component/widgets/product_widget.dart';
import 'package:internalship_task/component/shared_component/background.dart';
import 'package:internalship_task/modules/home_module/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..getProducts(),
      child: BlocConsumer<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  const BackgroundWidget() ,
                  ConditionalBuilder(
                    condition: cubit.productsModel != null,
                    fallback: (_) =>
                        const Center(child: CircularProgressIndicator()),
                    builder: (_) {
                      return SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 50,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                width: 0,
                                                color: Colors.white,
                                              )),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                width: 0,
                                                color: Colors.white,
                                              )),
                                          fillColor: Colors.white,
                                          filled: true,
                                          suffixIcon: Icon(
                                            Icons.search,
                                            color: HexColor('#B1B1B1'),
                                          ),
                                          labelText: 'Search',
                                          labelStyle: TextStyle(
                                            color: HexColor('#B1B1B1'),
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              spreadRadius: 3,
                                              blurRadius: 5,
                                              offset: Offset(
                                                0,
                                                3,
                                              ), // changes position of shadow
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    child: Icon(
                                      Icons.science,
                                      color: HexColor('#B1B1B1'),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              spreadRadius: 3,
                                              blurRadius: 8,
                                              offset: Offset(0,
                                                  3) // changes position of shadow
                                              ),
                                        ]),
                                    width: 50,
                                    height: 50,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                            'assets/images/banner.png',
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                    width: double.infinity,
                                    height: 180,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      children: const [
                                        Text(
                                          'New Release',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          'Acer Predator Helios 300',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    ),
                                  ),
                                ],
                                alignment: Alignment.bottomLeft,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Recommended \nfor You',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,

                                ),
                              ),
                            ),
                            GridView.builder(
                              padding: const EdgeInsets.all(20),
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 30,
                                mainAxisSpacing: 22,
                                childAspectRatio: .50,
                              ),
                              itemBuilder: (context, index) {
                                var prod = cubit.productsModel!.products[index];
                                return ProductWidget(prod: prod);
                              },
                              itemCount: 6,
                              shrinkWrap: true,
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            bottomNavigationBar: CurvedNavigationBar(
              index: 2,
              backgroundColor: Colors.blueAccent,
              items: <Widget>[
                Icon(
                  Icons.login,
                  size: 30,
                  color: navBarColor,
                ),
                Icon(
                  Icons.favorite_outlined,
                  size: 30,
                  color: navBarColor,
                ),
                Icon(
                  Icons.home,
                  size: 30,
                  color: navBarColor,
                ),
                Icon(
                  Icons.notifications,
                  size: 30,
                  color: navBarColor,
                ),
                Icon(
                  Icons.settings,
                  size: 30,
                  color: navBarColor,
                ),
              ],
              onTap: (index) {
                //Handle button tap
              },
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
