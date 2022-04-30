import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';

import '../../helpers/custom-theme.dart';
import '../../helpers/static-data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController, passwordController;
  late FocusNode emailFocus, passwordFocus;
  final frm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    emailFocus = FocusNode();
    passwordController = TextEditingController();
    passwordFocus = FocusNode();
    // if (kDebugMode) {
    //   emailController..text = 'khuntsr@gmail.com';
    //   passwordController..text = 'Suchit@#16';
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: frm,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImgPaths.bg_auth),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: DefaultColors.baby_white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.withOpacity(0.4), spreadRadius: 5, blurRadius: 7, offset: Offset(0, 3)),
                        ],
                      ),
                      padding: EdgeInsets.all(7),
                      height: 135,
                      width: 135,
                      child: Image.asset(ImgPaths.logo),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: Pad.md),
                        child: Column(
                          children: [
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
                            ),
                            SizedBox(height: 30),
                            MaterialButton(
                              onPressed: () async {
                                //await btnLogin();
                              },
                              child: Text("Sign in", style: TextStyle(color: DefaultColors.baby_white, fontSize: 16)),
                              padding: EdgeInsets.all(13),
                              minWidth: double.infinity,
                              color: DefaultColors.primary,
                              highlightElevation: 2,
                              elevation: 0,
                              height: 48,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(height: 38),
                            Text('Don’t have an account?', style: Theme.of(context).textTheme.bodyMedium),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                                child: Text('REGISTER', style: Theme.of(context).textTheme.displayMedium)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('❤  love with  ', style: Theme.of(context).textTheme.displaySmall),
                          Container(
                            height: 25,
                            child: Image.asset(ImgPaths.logo_appwrite),
                          )
                        ],
                      ),
                      SizedBox(height: 12)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
