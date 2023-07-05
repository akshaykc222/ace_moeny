import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../themes/app_colors.dart';

class PhoneField extends StatefulWidget {
  final Function(PhoneModel)? onChanged;
  final TextEditingController? controller;
  final Function(bool) haveError;

  const PhoneField(
      {Key? key, this.onChanged, this.controller, required this.haveError})
      : super(key: key);

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  final ValueNotifier<Country?> _selectedCountry = ValueNotifier(null);
  final ValueNotifier<bool> _haveError = ValueNotifier(false);
  final _height = 55.0;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: _haveError,
        builder: (context, data, child) {
          return Column(
            children: [
              SizedBox(
                height: _height,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      // child: GestureDetector(
                      //   onTap: () => showCountryPicker(
                      //       context: context,
                      //       onSelect: (val) => _selectedCountry.value = val),
                      //   child: ValueListenableBuilder<Country?>(
                      //       valueListenable: _selectedCountry,
                      //       builder: (context, data, child) {
                      //         debugPrint(
                      //             _selectedCountry.value?.toJson().toString());
                      //         return
                      child: Container(
                        height: _height,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey, width: 1),
                            borderRadius: BorderRadius.circular(4)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                //data.flagEmoji ??
                                "🇮🇳",
                                style: const TextStyle(
                                  fontSize: 25,
                                )),
                            // const Icon(
                            //   Icons.keyboard_arrow_down_outlined,
                            //   color: Colors.black54,
                            //   size: 25,
                            // )
                          ],
                        ),
                      ),
                      //    }),
                      //),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        flex: 3,
                        child: Container(
                          height: _height,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: _haveError.value
                                      ? AppColors.red
                                      : AppColors.grey,
                                  width: 1),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 14.0),
                                child: Text(
                                  "+91",
                                  style: TextStyle(
                                      color: AppColors.grey, fontSize: 16),
                                ),
                              ),
                              Flexible(
                                child: TextFormField(
                                  // controller: widget.controller,
                                  onChanged: (val) {
                                    int defaultLen = 10;
                                    defaultLen = _selectedCountry
                                            .value?.example.length ??
                                        10;
                                    if (defaultLen != val.length) {
                                      _haveError.value = true;
                                    } else {
                                      _haveError.value = false;
                                    }
                                    widget.controller?.text = val;
                                    widget.haveError(_haveError.value);
                                  },
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10)
                                  ],
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: _haveError.value ? 5 : 0,
              ),
              _haveError.value
                  ? const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "This phone number is invalid",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.red),
                      ),
                    )
                  : const SizedBox()
            ],
          );
        });
  }
}

class PhoneModel {
  final Country country;
  final String phoneNumber;
  final String phoneNumberWithCode;

  PhoneModel(
      {required this.country,
      required this.phoneNumber,
      required this.phoneNumberWithCode});
}
