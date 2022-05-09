import 'package:appwrite/appwrite.dart';

import '../helpers/static-data.dart';
import '../models/commonvm.dart';

Future<ResponseVm> updatePassword(String oldpassword, String password) async {
  try {
    Client client = Client();
    Account account = Account(client);
    client.setEndpoint(AppSettings.Endpoint).setProject(AppSettings.ProjectId);

    var result = await account.updatePassword(
      oldPassword: oldpassword,
      password: password,
    );

    return new ResponseVm(message: "Your password has been updated successfully!", success: true);
  } on AppwriteException catch (e) {
    return new ResponseVm(message: e.message!, success: false);
  } catch (ex) {
    return new ResponseVm(message: ErrorMessages.Exception, success: false);
  }
}