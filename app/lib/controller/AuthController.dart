import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import '../helpers/session.dart';
import '../helpers/static-data.dart';
import '../helpers/utilities.dart';
import '../models/commonvm.dart';

Future<ResponseVm> doRegister(String email, String password, String name) async {
  try {
    Client client = Client();
    Account account = Account(client);
    client.setEndpoint(AppSettings.Endpoint).setProject(AppSettings.ProjectId);

    var result = await account.create(userId: GenerateUuid(), email: email, password: password, name: name);

    return new ResponseVm(message: "Registration Successfully Done!", success: true);
  } on AppwriteException catch (e) {
    return new ResponseVm(message: e.message!, success: false);
  } catch (ex) {
    return new ResponseVm(message: ErrorMessages.Exception, success: false);
  }
}

Future<ResponseVm> doLogin(String email, String password) async {
  try {
    Client client = Client();
    Account account = Account(client);
    client.setEndpoint(AppSettings.Endpoint).setProject(AppSettings.ProjectId);

    var result = await account.createSession(
      email: email,
      password: password,
    );

    await SetSession(result.userId, result.providerUid);

    return new ResponseVm(message: "Welcome to Marvel Universe!", success: true);
  } on AppwriteException catch (e) {
    return new ResponseVm(message: e.message!, success: false);
  } catch (ex) {
    return new ResponseVm(message: ErrorMessages.Exception, success: false);
  }
}
