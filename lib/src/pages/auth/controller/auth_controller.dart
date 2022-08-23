// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:greengrocer/src/constants/storage_keys.dart';

import '../../../model/user_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/utils_services.dart';
import '../repository/auth_repository.dart';
import '../result/auth_result.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final authRepository = AuthRepository();
  final utilsServices = UtilsServices();
  UserModel user = UserModel();

  @override
  void onInit() {
    super.onInit();
    validateToken();
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    AuthResult result = await authRepository.signIn(
      email: email,
      password: password,
    );

    isLoading.value = false;
    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  Future<void> signOut() async {
    //Zerar o user
    user = UserModel();
    //Remover o token localmente
    await utilsServices.removeLocalData(key: StorageKeys.token);
    //ir para o login
    Get.offAllNamed(Routes.signIn);
  }

  void saveTokenAndProceedToBase() {
    //Salvar o Token
    utilsServices.saveLocalData(key: StorageKeys.token, data: user.token!);
    //ir para tela BaseScreen
    Get.offAllNamed(Routes.base);
  }

  Future<void> validateToken() async {
    //recuperar o dado salvo localmente
    String? token = await utilsServices.getlocalData(key: StorageKeys.token);
    if (token == null) {
      Get.offAllNamed(Routes.signIn);
      return;
    }
    AuthResult result = await authRepository.validateToken(token);
    result.when(success: (user) {
      this.user = user;
      saveTokenAndProceedToBase();
    }, error: (message) {
      signOut();
    });
  }
}
