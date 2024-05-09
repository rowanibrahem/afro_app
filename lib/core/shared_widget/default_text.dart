
import 'package:afro_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

Widget defaultText({
  TextEditingController? controller ,
  required TextInputType type,
  Function(String)? onChange,
  FormFieldValidator? validate,
  String? label ,
  String? hint ,
  IconData? prefix,
  bool isObscure = false,
  IconData? suffix,
  Function()? pressed,
  Function()? tap,
  bool? enable,

}) => TextFormField(

  onTap: tap,
  enabled: enable,
  controller: controller,
  obscureText: isObscure,
  decoration:  InputDecoration(
    labelText: label,
    hintText: hint,

    prefixIcon: Icon(prefix),
    suffixIcon: suffix!=null ? IconButton(
      onPressed: pressed,
      icon: Icon(
        suffix,),
    )
        : null,
    border:  OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),

    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: ColorApp.primaryColor, width: 2.0),
    ),
  ),
style: const TextStyle(fontSize: 14),
  keyboardType: type,
  onChanged: onChange,
  validator: validate,

);
