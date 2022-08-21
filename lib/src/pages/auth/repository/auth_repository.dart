// ignore_for_file: avoid_print

import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/pages/auth/result/auth_result.dart';

import '../../../model/user_model.dart';
import '../../../services/http_manager.dart';
// ignore: library_prefixes
import 'auth_errors.dart' as authErrors;

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future<AuthResult> signIn({
    required String email,
    required String password,
  }) async {
    //
    final result = await _httpManager.restRequest(
      url: Endpoints.signIn,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (result['result'] != null) {
      final user = UserModel.fromMap(
        result['result'],
      );
      return AuthResult.success(user);
    } else {
      return AuthResult.error(
        authErrors.authErrorsString(result['error']),
      );
    }
  }

  Future<AuthResult> validateToken(String token) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.validateToken,
      method: HttpMethods.post,
      headers: {
        'X-Parse-Session-Token': token,
      },
    );
    if (result['result'] != null) {
      final user = UserModel.fromMap(
        result['result'],
      );
      return AuthResult.success(user);
    } else {
      return AuthResult.error(
        authErrors.authErrorsString(result['error']),
      );
    }
  }
}
