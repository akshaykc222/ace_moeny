import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:untitled7/Ace_Money/presentation/Manager/payPhoneNoController.dart';
import 'package:untitled7/Ace_Money/presentation/pages/payContacts.dart';
import 'package:untitled7/Ace_Money/presentation/pages/payupiid_page2.dart';
import 'package:untitled7/Ace_Money/presentation/routes/App_Pages.dart';
import 'package:untitled7/Ace_Money/presentation/routes/App_Routes.dart';
import 'package:untitled7/Ace_Money/presentation/themes/app_colors.dart';

import '../Manager/paycontactsController.dart';

class PayPhoneNo extends StatelessWidget {
  PayPhoneNo({super.key});
  final controller = Get.find<PayPhoneNoController>();
  final Paycontactscntler = Get.put(PayContactsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
            )),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
            child: Text(
              "Enter a Phone number",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
            child: Text(
              'Pay someone using a UPI verified phone number',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    autofocus: true,
                    validator: (value) {
                      if (value == null || value.length != 10) {
                        return "Enter a valid UPI verified Number";
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        width: 1,
                      )),
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    controller: controller.payPhonenocntler,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      controller.payPhonenocntler.text = value;
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Paycontactscntler.displayContacts();

                      Paycontactscntler.searchController.clear();

                      Get.toNamed(AppPages.paycontacts);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          controller.payPhonenocntler.text.isEmpty ||
                  controller.payPhonenocntler.text.length != 10
              ? SizedBox()
              : Padding(
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.payPhonenocntler.text == "") {
                          Get.snackbar("Error",
                              "enter a Valid Upi verified PhoneNumber");
                        } else {
                          Get.to(PayUpiIdScreen2(
                            paymentTo: controller.payPhonenocntler.text,
                          ));
                        }
                      },
                      child: Text("Continue"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
        ],
      )),
    ));
  }
}
