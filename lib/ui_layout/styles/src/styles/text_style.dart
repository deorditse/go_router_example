import 'package:flutter/material.dart';

// const String SBSansTextRegularPath =
//     "packages/common_solutions_for_different_services/assets_for_all_services/fonts/SBSansText/OT_TTF/SBSansTextRegular.ttf";
// const String SBSansDisplaySemiBoldPath =
//     "packages/common_solutions_for_different_services/assets_for_all_services/fonts/SBSansDisplay/TTF/SBSansDisplaySemiBold.ttf";
// const String SBSansDisplayBoldPath =
//     "packages/common_solutions_for_different_services/assets_for_all_services/fonts/SBSansDisplay/TTF/SBSansDisplayBold.ttf";
// - asset: assets/fonts/Oswald/Oswald-VariableFont_wght.ttf
// - asset: assets/fonts/Oswald/Oswald-Medium.ttf
// - asset: assets/fonts/Oswald/Oswald-Bold.ttf
const String Oswald = "Oswald";
// const String OswaldMedium = "Oswald";
// const String OswaldBold = "Oswald";

enum FontFamilyName {
  Oswald,
  // OswaldMedium,
  // OswaldBold,
}

String _getPathFont({required FontFamilyName fontFamilyName}) {
  switch (fontFamilyName) {
    case FontFamilyName.Oswald:
      return Oswald;
    // case FontFamilyName.OswaldMedium:
    //   return OswaldMedium;
    // case FontFamilyName.OswaldBold:
    //   return OswaldBold;
    default:
      return Oswald;
  }
}

TextStyle myTextStyleFontOswald({
  double? fontSize,
  Color? textColor,
  TextDecoration? decoration,
  FontWeight? newFontWeight,
  FontFamilyName newFontFamilyName = FontFamilyName.Oswald,
}) {
  return TextStyle(
    color: textColor ?? const Color(0xFF2C2E33),
    fontFamily: _getPathFont(fontFamilyName: newFontFamilyName),
    fontSize: fontSize ?? 12,
    fontWeight: newFontWeight ?? FontWeight.w400,
    decoration: decoration,
    // overflow: TextOverflow.ellipsis,
  );
}
