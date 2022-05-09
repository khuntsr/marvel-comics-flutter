import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import '../helpers/static-data.dart';

Future<List<Document>?> getAllUniverse() async {
  try {
    Client client = Client();
    Database database = Database(client);
    client.setEndpoint(AppSettings.Endpoint).setProject(AppSettings.ProjectId);

    var result = await database.listDocuments(
      collectionId: AppWriteDatabaseCollection.UniverseMaster,
    );

    return result.documents;
  } on AppwriteException catch (e) {
    return null;
  } catch (ex) {
    return null;
  }
}
