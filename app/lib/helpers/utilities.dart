import 'package:app/helpers/static-data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

void ShowToast(String text) {
  Fluttertoast.showToast(
    msg: text == "" ? "Something went wrong! Try after some time." : text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: DefaultColors.secondary,
    textColor: DefaultColors.baby_white,
    fontSize: 16.0,
  );
}

void DialogLoader(BuildContext context, String text) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
              width: 40,
              child: LiquidCircularProgressIndicator(
                value: 0.5,
                valueColor: AlwaysStoppedAnimation(DefaultColors.secondary),
                backgroundColor: DefaultColors.baby_white,
                borderColor: DefaultColors.secondary,
                borderWidth: 3.0,
              ),
            ),
            SizedBox(width: 14),
            Flexible(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16, color: DefaultColors.secondary),
                ))
          ],
        ),
      ),
    ),
  );
}

Widget ScreenLoader() {
  return Center(
    child: CupertinoActivityIndicator(animating: true, radius: 30),
  );
}
