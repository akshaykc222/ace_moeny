import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled7/Ace_Money/presentation/routes/App_Pages.dart';

import '../themes/app_colors.dart';

class PayUpiIdScreen2 extends StatefulWidget {
  const PayUpiIdScreen2({super.key});

  @override
  State<PayUpiIdScreen2> createState() => _PayUpiIdScreen2State();
}

enum SingingCharacter { SBINDIVIDUAL }

enum SingingCharacterr { FDRLINDIVIDUAL }

class _PayUpiIdScreen2State extends State<PayUpiIdScreen2> {
  int _selectedValue = 1;
  SingingCharacter? _character = SingingCharacter.SBINDIVIDUAL;
  SingingCharacterr? character = SingingCharacterr.FDRLINDIVIDUAL;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height / 4,
            ),
            Center(
              child: CircleAvatar(
                radius: 40,
                child: Image(image: AssetImage("assets/images/user_icon.png")),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Akshay KC",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Bank name : Akshay KC"),
            const SizedBox(
              height: 20,
            ),
             SizedBox(
              width: width*0.4,
               child: TextFormField(
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                keyboardType: TextInputType.number,
                       inputFormatters: [LengthLimitingTextInputFormatter(10)],
                textAlign: TextAlign.center,
                decoration: InputDecoration( 
                    hintText: "₹ 0",
                   // prefixIcon: Icon(Icons.currency_rupee),
                    //prefixText:  "₹",
                    // prefixStyle: TextStyle(fontSize: 20),
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                        fontSize: 25),
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none),
                         ),
             ),
            Padding(
              padding: const EdgeInsets.fromLTRB(130, 20, 130, 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 212, 203, 203)),
                child: const TextField(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintText: "Add Note ?",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox(
              height: height / 5.5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: SizedBox(
                height: 50,
                width: width,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          builder: (BuildContext context) {
                            return Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                color: AppColors.white,
                              ),
                              height: height * 0.4,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Image(
                                            image: AssetImage(
                                                "assets/images/acemoney logo.jpg"),
                                            // width: 70,
                                            width: 80,
                                            //height: 60,
                                            height: 50),
                                        const Text(
                                          "Ace Money",
                                          style: TextStyle(
                                              color: AppColors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                        SizedBox(
                                          width: width / 15,
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.arrow_drop_down_outlined,
                                              color: AppColors.black,
                                              size: 30,
                                            ))
                                      ],
                                    ),
                                    const Text("Current Account"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RadioListTile<int>(
                                      title: Text('1678930003567'),
                                      subtitle: Text('SBI INDIVIDUAL'),
                                      value: 1,
                                      groupValue: _selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedValue = value!;
                                        });
                                      },
                                    ),
                                    // ListTile(
                                    //   title: const Text('1002502313130'),
                                    //   subtitle: const Text("SB INDIVIDUAL"),
                                    //   leading: Radio<SingingCharacter>(
                                    //     value: SingingCharacter.SBINDIVIDUAL,
                                    //     groupValue: _character,
                                    //     onChanged: (SingingCharacter? value) {
                                    //       setState(() {
                                    //         _character = value;
                                    //       });
                                    //     },
                                    //   ),
                                    // ),
                                    //  ListTile(
                                    //   title: const Text('1767453000543'),
                                    //   subtitle: const Text("FDRL INDIVIDUAL"),
                                    //   leading: Radio<SingingCharacterr>(
                                    //     value: SingingCharacterr.FDRLINDIVIDUAL,
                                    //     groupValue: character,
                                    //     onChanged: (SingingCharacterr? valuee) {
                                    //       setState(() {
                                    //         character = valuee;
                                    //       });
                                    //     },
                                    //   ),
                                    // ),
                                    RadioListTile<int>(
                                      title: Text('1478038920003'),
                                      subtitle: Text("FDRL INDIVIDUAL"),
                                      value: 2,
                                      groupValue: _selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedValue = value!;
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 30, 20, 20),
                                      child: SizedBox(
                                        height: 50,
                                        width: width,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.primaryColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                )),
                                            onPressed: () {
                                              Get.toNamed(AppPages.payupiidpage3);
                                            },
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Proceed To Pay",
                                                  style: TextStyle(
                                                      color: AppColors.white,
                                                      fontSize: 18),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Icon(
                                                  Icons
                                                      .keyboard_double_arrow_right,
                                                  color: AppColors.white,
                                                )
                                              ],
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Text("Pay")),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
