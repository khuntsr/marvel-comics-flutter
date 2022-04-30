import 'package:app/helpers/static-data.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/mfg_labs_icons.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DefaultColors.baby_white,
        appBar: AppBar(
            backgroundColor: DefaultColors.baby_white,
            elevation: 0,
            title: InkWell(
              onTap: (){
                Navigator.pushNamed(context, 'login');
              },
              child: Row(
                children: [Icon(MfgLabs.left_open, color: DefaultColors.dark, size: 16), Text(' Back', style: Theme.of(context).textTheme.displayMedium)],
              ),
            )),
      ),
    );
  }
}
