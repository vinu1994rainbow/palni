import 'package:flutter/material.dart';

import '../../utils/color_constants.dart';
import '../../utils/font_family_constants.dart';
import '../../utils/font_size_constants.dart';

typedef Callback = void Function(String data);

class TextFieldComponent extends StatelessWidget {
  TextFieldComponent({
    Key? key,
    required this.prodNameController,
    required this.hintText,
    required this.errorText,
    required this.errorTextShow,
    required this.onchange,
    required this.inputtype,
    required this.textInputType,

  }) : super(key: key);

  final TextEditingController prodNameController;
  String hintText, errorText;
  bool errorTextShow = false;
  Callback onchange;
  List inputtype = [];
  TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          inputFormatters: [],
          maxLength: hintText.contains("Phone")?10:hintText.contains("OTP")?4:null,
          keyboardType: textInputType,
          controller: prodNameController,
          style: TextStyle(
              color: ColorConstants.black,
              fontSize: FontSizeConstants.size14,
              fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            counterText: "",
            isDense: true,
            hintText: hintText,
            prefixIcon: hintText.contains("Phone")?Text("+91",textAlign: TextAlign.center,style: TextStyle(height: 2.5, fontFamily: FontFamilyConstants.interRegular,color: ColorConstants.heading,
              fontSize: FontSizeConstants.size14,),):null,
            hintStyle: TextStyle(
                fontFamily: FontFamilyConstants.interRegular,
                color: ColorConstants.heading,
                fontSize: FontSizeConstants.size14,
                fontWeight: FontWeight.w400),
            errorText: errorTextShow==true?errorText:null,
            errorStyle: TextStyle(color: ColorConstants.red,
              fontFamily: FontFamilyConstants.interRegular,
              fontSize: FontSizeConstants.size14,),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorConstants.black)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorConstants.black)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorConstants.black)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorConstants.black)),
          ),

          onChanged:(data)=>onchange(data),
          // decoration: InputDecoration(hintText: hintText,
          //     errorText: errorTextShow==true?errorText:null,
          // errorStyle: TextStyle(color: Colors.red)),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

}
