
import 'package:app/helpers/utilities.dart';
import 'package:flutter/material.dart';

class AppSettings {
  static const String Endpoint = '';
}

class ErrorMessages {
  static const String InternalServer = '500 - Internal Server Error! APEX.';
  static const String Exception = 'Something went wrong! Please, try after some times.';
}


class ImgPaths {
  static const String logo = 'assets/images/logo.png';
  static const String logo_appwrite = 'assets/images/appwrite.png';
  static const String logo_appwrite_buitwith = 'assets/images/appwrite_buitwith.png';
  static const String bg_auth = 'assets/images/auth-bg.png';
}

class DefaultColors {
  static Color primary = HexColor.fromHex('#ff0000');
  static Color primaryLight = HexColor.fromHex('#fef7f6');

  static Color secondary = HexColor.fromHex('#ffff00');
  static Color secondaryLight = HexColor.fromHex('#f7faff');

  static Color text_header = HexColor.fromHex('#41464c');
  static Color text_paragraph = HexColor.fromHex('#696969');
  static Color text_body = HexColor.fromHex('#696969');
  static Color baby_white = HexColor.fromHex('#fdfffc');

  static Color success = HexColor.fromHex('#198754');
  static Color danger = HexColor.fromHex('#dc3545');
  static Color warning = HexColor.fromHex('#EC534A');
  static Color dark = HexColor.fromHex('#040c0e');
  static Color light = HexColor.fromHex('#f8f9fa');

  static Color grey = HexColor.fromHex('#9c9c9c');
  static Color grey_light = HexColor.fromHex('#F1F4F3');
  static Color grey_dark = HexColor.fromHex('#777777');

  static Color button_secondary = HexColor.fromHex('#F4F5F7');
  static Color filled = HexColor.fromHex('#F4F5F7');
  static Color filled_border = HexColor.fromHex('#D5D6D8');

}

class Pad {
  static const double sm = 12;
  static const double md = 18;
  static const double lg = 24;
}
