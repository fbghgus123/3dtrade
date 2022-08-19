import 'package:get/get.dart';

class FirebaseAuthRemoteDataSource extends GetConnect {
  final String url =
      'https://us-central1-dtrade-be228.cloudfunctions.net/createCustomToken';

  Future<String> createCustomToken(Map<String, dynamic> user) async {
    final customTokenResponse = await post(url, user);

    return customTokenResponse.body;
  }
}
