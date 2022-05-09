import 'dart:convert';

import 'package:app/models/sessionvm.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> SetSession(String userId, String email) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.setString("userId", userId);
  sp.setString("email", email);
  return true;
}

Future<SessionVm?> GetSession() async {
  try {
    SharedPreferences sp = await SharedPreferences.getInstance();

    var data = SessionVm(
      userId: sp.getString("userId").toString(),
      email: sp.getString("email").toString(),
    );

    return data;
  } catch (error) {
    return null;
  }
}

Future<int> IsPermissionGranted() async {
  var response = 1;
  var curretnSession = await GetSession();
  if (curretnSession != null && curretnSession.userId != null) {
    response = 2;
  } else {}
  return response;
}

Future<void> Logout() async {
  await RemoveSession();
}

Future<void> RemoveSession() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  if (sp != null) {
    sp.remove("userId");
    sp.remove("email");
  }
}
