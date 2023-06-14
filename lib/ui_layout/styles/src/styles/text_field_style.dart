import 'package:flutter/material.dart';
import 'color_styles.dart';
import 'text_style.dart';

InputDecoration myStyleTextField(
  BuildContext context, {
  String? labelText,
  String? hintText,
  String? helperText,
  Color? colorBorder,
  bool isBorderColor = false,
}) {
  OutlineInputBorder myOutlineInputBorder({Color? color}) => OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        gapPadding: 0,
        borderSide: BorderSide(
            color: color ?? Colors.transparent, width: color != null ? 1 : 0),
      );

  return InputDecoration(
    contentPadding: const EdgeInsets.fromLTRB(24, 16, 12, 16),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
      borderSide: BorderSide.none,
    ),
    // isDense: true,
    //уменьшает высоту до минимальной

    enabledBorder: myOutlineInputBorder(color: colorBorder),

    focusedBorder: myOutlineInputBorder(color: ColorStyles.blue),

    errorBorder: myOutlineInputBorder(color: Colors.red),

    focusedErrorBorder: myOutlineInputBorder(color: Colors.red),

    errorStyle: myTextStyleFontOswald(
      textColor: Colors.red,
      fontSize: 14,
      newFontWeight: FontWeight.w400,
    ),

    hintStyle: myTextStyleFontOswald(
      textColor: ColorStyles.grafit,
      fontSize: 14,
      newFontWeight: FontWeight.w400,
    ),

    labelStyle: myTextStyleFontOswald(
      textColor: ColorStyles.grafit,
      fontSize: 0,
      newFontWeight: FontWeight.w400,
    ),

    floatingLabelStyle: const TextStyle(fontSize: 0),

    labelText: labelText,
    //'Введите ключ команды',
    helperText: helperText,
    //'Поле для поиска заметок',
    hintText: hintText,
    //'123456',
    fillColor: const Color(0xFFF7F7F8),
    filled: true,
  );
}
