import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../themes/app_colors.dart';

class PayUpiIdScreen3 extends StatefulWidget {
  const PayUpiIdScreen3({super.key});

  @override
  State<PayUpiIdScreen3> createState() => _PayUpiIdScreen3State();
}

class _PayUpiIdScreen3State extends State<PayUpiIdScreen3> {
   List<String> pin = List.generate(4, (_) => '');

  void updatePin(int index, String value) {
    setState(() {
      pin[index] = value;
      if (index < pin.length - 1 && value.isNotEmpty) {
        FocusScope.of(context).nextFocus();
      }
    });
  }

  void deletePin(int index) {
    setState(() {
      if (index > 0) {
        pin[index - 1] = '';
        FocusScope.of(context).previousFocus();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
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
        child: Column(
          children: [
            Text("ENTER YOUR PIN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            SizedBox(height: 20,),
            Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            pin.length,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: TextField(
                  onChanged: (value) => updatePin(index, value),
                  onSubmitted: (value) => updatePin(index, value),
                  maxLength: 1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    counterText: '',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                  obscureText: true,
                ),
              ),
            ),
          )..add(
              IconButton(
                icon: Icon(Icons.backspace),
                onPressed: () => deletePin(pin.indexOf('')),
              ),
            ),
        ),
      ),
          ],
        ),
      ),
    ));
  }
}