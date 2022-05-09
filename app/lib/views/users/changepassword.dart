import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import '../../controller/UserController.dart';
import '../../helpers/custom-theme.dart';
import '../../helpers/static-data.dart';
import '../../helpers/utilities.dart';
import '../../helpers/validator.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController oldpasswordController, passwordController;
  late FocusNode oldpasswordFocus, passwordFocus;
  final frm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    oldpasswordController = TextEditingController();
    oldpasswordFocus = FocusNode();
    passwordController = TextEditingController();
    passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    oldpasswordController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: DefaultColors.dark,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Entypo.left_open),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          title: Container(
            padding: EdgeInsets.only(right: Pad.lg),
            alignment: Alignment.center,
            child: Image.asset(ImgPaths.logo_marvel_universe, width: 120),
          ),
        ),
        body: Form(
          key: frm,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: Pad.lg, horizontal: Pad.md),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.topLeft,
                  child: Text("Old Password", style: Theme.of(context).textTheme.labelMedium),
                ),
                TextFormField(
                  controller: oldpasswordController,
                  focusNode: oldpasswordFocus,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  decoration: FilledTextBox(
                    Container(
                      padding: EdgeInsets.only(right: 6),
                      child: Icon(LineariconsFree.lock_1, size: 22, color: DefaultColors.dark),
                    ),
                  ),
                  validator: (value) {
                    return validateRequired(value.toString());
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
                  validator: (value) {
                    return validateRequired(value.toString());
                  },
                ),
                SizedBox(height: 30),
                MaterialButton(
                  onPressed: () async {
                    await btnChangePassword();
                  },
                  child: Text("Change Password", style: TextStyle(color: DefaultColors.baby_white, fontSize: 16)),
                  padding: EdgeInsets.all(13),
                  minWidth: double.infinity,
                  color: DefaultColors.primary,
                  highlightElevation: 2,
                  elevation: 0,
                  height: 48,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  btnChangePassword() async {
    try {
      if (frm.currentState!.validate()) {
        DialogLoader(context, "Updating...");
        var response = await updatePassword(oldpasswordController.text, passwordController.text);

        Navigator.pop(context);
        ShowToast(response.message);

        if (response.success) {
          Navigator.pushNamed(context, '/');
        }
      }
    } catch (ex) {}
  }
}
