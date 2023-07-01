import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:untitled7/Ace_Money/presentation/manager/upiid_controller.dart';
import 'package:untitled7/Ace_Money/presentation/routes/App_Pages.dart';
import 'package:untitled7/Ace_Money/presentation/themes/app_colors.dart';
import 'package:untitled7/Ace_Money/presentation/widgets/textformfield.dart';

class PayUpiIdScreen extends StatefulWidget {
  const PayUpiIdScreen({super.key});

  @override
  State<PayUpiIdScreen> createState() => _PayUpiIdScreenState();
}

class _PayUpiIdScreenState extends State<PayUpiIdScreen> {
  final controller = Get.find<UpiIdController>();
 
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: AppColors.black,
        ),
      ),
      body: SingleChildScrollView(
       // reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
              child: Text(
                "Enter UPI ID ",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            CustomTextField(
            controller: controller.textEditingController,         
              hintText: "UPI ID ",
              label: const Text("UPI ID "),
              //controller: controller.textEditingController,
            ),
            SizedBox(
              height: height / 2.1,
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: SizedBox(
                  height: 50,
                  width: width,
                  child:  ElevatedButton(
                    onPressed: (){
                      Get.toNamed(AppPages.payupiidpage2);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: controller.buttonColor
                    ),
          // onPressed: controller.isTextFieldFocused && controller.textEditingController.text.isNotEmpty
          //     ? () {
          //         // Handle button click
          //       }
          //     : null,
          // style: ButtonStyle(
          //   backgroundColor: MaterialStateProperty.all<Color>(
          //     controller.isTextFieldFocused && controller.textEditingController.text.isNotEmpty
          //         ? Colors.red
          //         : Colors.yellow,
          //   ),
          
          child: const Text('Continue'),
        ),),
            ),
            Center(
                child: Image(
              image: const AssetImage("assets/images/upi-icon.png"),
              width: width / 5.8,
              height: height / 9,
            ))
          ],
        ),
      ),
    ));
  }
}
