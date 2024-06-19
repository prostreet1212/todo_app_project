import 'package:appwrite/appwrite.dart';

Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('666f15bf001e45cd39ee')
    .setSelfSigned(
        status: true); // For self signed certificates, only use for development

Account account = Account(client);

Future<String> createUser(String name, String email, String password) async {
  try {
    final user = await account.create(
        userId: ID.unique(), email: email, password: password, name: name);
    print('new user created');
    return 'success';
  }on AppwriteException catch (e) {
    return e.message.toString();
  }


}

Future loginUser(String email, String password) async {
  try {
    final user = await account.createEmailPasswordSession(
        email: email, password: password);
    return true;
    print('user logged in');
  } catch (e) {
    return false;
    print(e);
  }
}

Future logoutUser() async {
  await account.deleteSession(sessionId: 'current');
  print('user logged out');
}

Future<bool> checkUserAuth() async {
  try {
   await account.getSession(sessionId: 'current');
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
