import 'package:app/controller/AuthController.dart';
import 'package:app/helpers/static-data.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';

import '../../helpers/custom-theme.dart';
import '../../helpers/utilities.dart';
import '../../helpers/validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailController, passwordController, nameController;
  late FocusNode emailFocus, passwordFocus, nameFocus;
  final frm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    emailFocus = FocusNode();
    passwordController = TextEditingController();
    passwordFocus = FocusNode();
    nameController = TextEditingController();
    nameFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DefaultColors.baby_white,
        body: SingleChildScrollView(
          child: Form(
            key: frm,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Pad.md, vertical: Pad.lg),
              child: Column(
                children: [
                  SizedBox(height: Pad.sm),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: DefaultColors.dark,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.withOpacity(0.4), spreadRadius: 5, blurRadius: 7, offset: Offset(0, 3)),
                        ],
                      ),
                      padding: EdgeInsets.all(Pad.md),
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Image.asset(ImgPaths.logo_marvel_universe),
                    ),
                  ),
                  SizedBox(height: Pad.md),
                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    alignment: Alignment.topLeft,
                    child: Text("Full Name", style: Theme.of(context).textTheme.labelMedium),
                  ),
                  TextFormField(
                    controller: nameController,
                    focusNode: nameFocus,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: FilledTextBox(
                      Container(
                        padding: EdgeInsets.only(right: 6),
                        child: Icon(LineariconsFree.user_1, size: 22, color: DefaultColors.dark),
                      ),
                    ),
                    validator: (value){
                      return validateName(value.toString());
                    },
                  ),
                  SizedBox(height: 28),
                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    alignment: Alignment.topLeft,
                    child: Text("Email Address", style: Theme.of(context).textTheme.labelMedium),
                  ),
                  TextFormField(
                    controller: emailController,
                    focusNode: emailFocus,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: FilledTextBox(
                      Container(
                        padding: EdgeInsets.only(right: 6),
                        child: Icon(LineariconsFree.envelope, size: 22, color: DefaultColors.dark),
                      ),
                    ),
                    validator: (value){
                      return validateEmail(value.toString());
                    },
                  ),
                  SizedBox(height: Pad.md),
                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    alignment: Alignment.topLeft,
                    child: Text("Password", style: Theme.of(context).textTheme.labelMedium),
                  ),
                  TextFormField(
                    controller: passwordController,
                    focusNode: passwordFocus,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    decoration: FilledTextBox(
                      Container(
                        padding: EdgeInsets.only(right: 6),
                        child: Icon(LineariconsFree.lock_1, size: 22, color: DefaultColors.dark),
                      ),
                    ),
                    validator: (value){
                      return validateRequired(value.toString());
                    },
                  ),
                  SizedBox(height: 30),
                  MaterialButton(
                    onPressed: () async {
                      await btnRegister();
                    },
                    child: Text("Register", style: TextStyle(color: DefaultColors.baby_white, fontSize: 16)),
                    padding: EdgeInsets.all(13),
                    minWidth: double.infinity,
                    color: DefaultColors.primary,
                    highlightElevation: 2,
                    elevation: 0,
                    height: 48,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(height: 18),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text('Back to Login', style: Theme.of(context).textTheme.displayMedium),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  btnRegister() async {
    try {
      if (frm.currentState!.validate()) {
        DialogLoader(context, "Creating account...");
        var response = await doRegister(emailController.text, passwordController.text, nameController.text);

        Navigator.pop(context);
        ShowToast(response.message);

        if (response.success) {
          Navigator.pushNamed(context, '/login');
        }
      }
    } catch (ex) {}
  }
}
