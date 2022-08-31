import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Digite seu e-mail';
  }

  if (!email.isEmail) {
    return "Digite um e-mail válido - exemplo@exemplo.com";
  }
  return null;
}

String? passwordValidator(password) {
  if (password == null || password.isEmpty) {
    return 'Digite sua senha';
  }
  if (password.length < 7) {
    return 'Digite uma senha com 7 caracteres';
  }
  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Digite seu nome';
  }
  final names = name.split(' ');

  if (names.length == 1) {
    return 'Digite seu nome completo';
  }
  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Digite número de Celular';
  }

  if (!phone.isPhoneNumber || phone.length < 14) {
    return 'Digite um número válido';
  }
  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return 'Digite número do seu CPF';
  }

  if (!cpf.isCpf) {
    return 'Digite um número válido';
  }
  return null;
}
