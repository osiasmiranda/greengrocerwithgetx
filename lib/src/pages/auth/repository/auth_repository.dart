import 'package:greengrocer/src/constants/endpoints.dart';

import '../../../services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();
  Future signIn({required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signIn,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      },
    );
    if (result['result'] != null) {
      print('SignIn Funcionou');
      print(result['result']);
    } else {
      print('SignIn Não Funcionou');
      print(result['error']);
    }
  }
}
