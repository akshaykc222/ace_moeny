import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import 'package:untitled7/Ace_Money/presentation/pages/dashboard.dart';
import 'package:untitled7/Ace_Money/presentation/routes/App_Pages.dart';
import 'package:untitled7/Ace_Money/presentation/themes/app_colors.dart';
import 'package:untitled7/Ace_Money/presentation/widgets/phone_field.dart';

import '../Manager/MobNoverificationController.dart';

class MobileNoVerify extends StatelessWidget {
  MobileNoVerify({super.key});
  final Controller = Get.find<MobNoverificationController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(physics: BouncingScrollPhysics(), children: [
        Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                child: Text(
                  "Welcome to UPI payment",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Enter your Phone Number",
                  style: TextStyle(
                      color: AppColors.black, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: PhoneField(
                  haveError: (p0) {
                    if (p0 == "") {
                      return "Enter a valid UPI verified Number";
                    }
                  },
                  controller: Controller.phoneNoverify,
                ),
              ),

              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                      ),
                      onPressed: () {
                        if (Controller.phoneNoverify.text == "" ||
                            Controller.phoneNoverify.text.length != 10) {
                          print(
                              "length:${Controller.phoneNoverify.text.length}");
                          Get.snackbar("Error", "Enter a valid mobile Number");
                        } else {
                          Get.toNamed(AppPages.dashboard);
                        }
                      },
                      child: Text("Continue")),
                ),
              ),

              //  TextFormField(
              //         autofocus: true,
              //         validator: (value) {
              //           if (value == null || value.length != 10) {
              //             return "Enter a valid UPI verified Number";
              //           }
              //         },
              //         decoration: InputDecoration(
              //           border: OutlineInputBorder(
              //               borderSide: BorderSide(
              //             width: 1,
              //           )),
              //         ),
              //         controller:Controller.phoneNoverify ,
              //         inputFormatters: [LengthLimitingTextInputFormatter(10)],
              //         keyboardType: TextInputType.phone,
              //         // onChanged: (value) {
              //         //   controller.payPhonenocntler.text = value;
              //         // },
              //       ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/upi-icon.png"),
                          fit: BoxFit.contain)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/Ace__2.5-preview.png"),
                          fit: BoxFit.cover)),
                ),
              )
            ],
          ),
        ]),
      ]),
    ));
  }
}
