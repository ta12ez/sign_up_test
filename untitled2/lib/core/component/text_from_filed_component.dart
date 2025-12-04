import 'package:flutter/material.dart';

import '../constant/color.dart';

class TextFromFiledComponent extends StatelessWidget {
 final TextEditingController controller;

 final bool enable;
 final void Function()? onTap;
 //final IconData? iconData;
 final Widget? label;
 final TextInputType inputType;
 final Widget? priffix;
 final String? hintText;
 final TextAlign align;
 final Widget? suffix;
 final bool isSecret;
 final bool readOnly;
 final bool autofocus;
 final void Function(String)?onChanged;
final void Function(String)? onFieldSubmitted;
 final String? Function(String?)? validator;
  const TextFromFiledComponent({super.key,this.onFieldSubmitted,this.onChanged, required this.controller,  this.enable=true, this.onTap, this.label,  this.inputType=TextInputType.text, this.priffix, this.hintText,this.align=TextAlign.start, this.suffix,  this.isSecret=false, this.validator,  this.readOnly=false,this.autofocus=false,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus:autofocus ,
        onFieldSubmitted: onFieldSubmitted,
      readOnly: readOnly,
        onChanged: onChanged,
        validator: validator,
      enabled: enable,
    onTap: onTap,
    keyboardType:inputType ,
    textAlign: align,
    controller: controller,
        cursorColor: mainColor,
      obscureText:isSecret,
        decoration: InputDecoration(

          suffixIcon: suffix,
          prefixIcon: priffix,
          hintText: hintText,
          hintStyle:Theme.of(context).textTheme.bodySmall!.copyWith(color: grayColor) ,
          label:label ,
          focusColor: mainColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: grayColor, width: 1.2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: mainColor, width: 1.8),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: grayColor, width: 1.2),
          ),
        ),
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: mainColor)
    );
  }
}
