import 'package:app/helpers/static-data.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import '../../helpers/session.dart';

Widget ASide(String email, BuildContext context) {
  return Column(
    children: [
      Expanded(
          flex: 1,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 65,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset('assets/images/dp.jpg'),
                        ),

                      ),
                      SizedBox(height: 16.0),
                      Text(
                        email,
                        style: TextStyle(color: DefaultColors.baby_white, fontSize: 14),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                  leading: Icon(FontAwesome5.globe_asia, size: 20.0, color: DefaultColors.baby_white),
                  title: Text("Universe", style: TextStyle(fontSize: 14)),
                  textColor: DefaultColors.baby_white,
                  dense: true,
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(FontAwesome5.book, size: 20.0, color: DefaultColors.baby_white),
                  title: Text("Comics", style: TextStyle(fontSize: 14)),
                  textColor: DefaultColors.baby_white,
                  dense: true,
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(FontAwesome5.users, size: 20.0, color: DefaultColors.baby_white),
                  title: Text("Characters", style: TextStyle(fontSize: 14)),
                  textColor: DefaultColors.baby_white,
                  dense: true,
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(FontAwesome5.history, size: 20.0, color: DefaultColors.baby_white),
                  title: Text("Stories", style: TextStyle(fontSize: 14)),
                  textColor: DefaultColors.baby_white,
                  dense: true,
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(FontAwesome5.lock, size: 20.0, color: DefaultColors.baby_white),
                  title: Text("Change Password", style: TextStyle(fontSize: 14)),
                  textColor: DefaultColors.baby_white,
                  dense: true,
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(FontAwesome5.user_cog, size: 20.0, color: DefaultColors.baby_white),
                  title: Text("Settings", style: TextStyle(fontSize: 14)),
                  textColor: DefaultColors.baby_white,
                  dense: true,
                ),
                ListTile(
                  onTap: () async {
                    await Logout();
                    Navigator.pushNamed(context, '/login');
                  },
                  leading: Icon(FontAwesome5.sign_out_alt, size: 20.0, color: DefaultColors.baby_white),
                  title: Text("Logout", style: TextStyle(fontSize: 14)),
                  textColor: DefaultColors.baby_white,
                  dense: true,
                ),
              ],
            ),
          )),
      Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(bottom: Pad.sm, left: Pad.sm),
        child: Text(
          'v1.0.0',
          style: TextStyle(color: DefaultColors.baby_white),
        ),
      )
    ],
  );
}
