import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untitled7/Ace_Money/presentation/manager/Controller/DashBoard_Controller.dart';
import 'package:untitled7/Ace_Money/presentation/themes/app_colors.dart';

import '../widgets/CustomIcons.dart';

class DashBoard extends StatelessWidget {
  DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashBoardController());

    double h = MediaQuery
        .of(context)
        .size
        .height;
    double w = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/bank3.jpg',
                          ),
                          fit: BoxFit.fill),
                      // color: AppColors.primaryColor,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 3)
                      ]),
                  height: h * 0.35,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Padding(
                              padding: EdgeInsets.only(
                                  left: 10,
                                  top: h * 0.01,
                                  right: w * 0.05,
                                  bottom: h * 0.02),
                              child: SizedBox(
                                height: 45,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Search',
                                      suffixIcon: const Icon(Icons.search),
                                      filled: true,
                                      fillColor: AppColors.offWhite1,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors
                                                .grey), // Set the color you want for the focused border
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColors.primaryColor),
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                ),
                              ),
                            ),
                            // subtitle: const Text('Hello, Alonzo Leo',
                            //     style: TextStyle(
                            //       fontSize: 25,
                            //       fontWeight: FontWeight.bold,
                            //       color: AppColors.white
                            //     )),
                            trailing: const CircleAvatar(
                              backgroundImage:
                              AssetImage('assets/images/Ace.jpg'),
                            ),
                          ),
                           const Text('Hello, Alonzo Leo',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Padding(padding: EdgeInsets.all(15),
                // child: Text('UPI',),
                // ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.20,
                      child: AnimationLimiter(
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(10),
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 28 / 12,
                          children: List.generate(controller.dashIcons.length,
                                  (int index) {
                                return AnimationConfiguration.staggeredGrid(
                                  position: index,
                                  duration: const Duration(
                                    milliseconds: 800,
                                  ),
                                  columnCount: controller.dashIcons.length,
                                  child: ScaleAnimation(
                                    duration: const Duration(
                                      milliseconds: 900,
                                    ),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    child: FadeInAnimation(
                                      child: CustomIcon(
                                        iconModal: controller.dashIcons[index],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Container(
                      width: w * 0.6,
                      height: 20,
                      decoration: BoxDecoration(
                          color: AppColors.cardLightGrey,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('UPI ID: abc123@oksbi'),
                          GestureDetector(
                              onTap: () {
                                print('Button Pressed');
                              },
                              child: const FaIcon(
                                FontAwesomeIcons.copy,
                                size: 15,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
