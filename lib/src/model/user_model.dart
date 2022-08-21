import 'dart:convert';

class UserModel {
  String? name;
  String? email;
  String? phone;
  String? cpf;
  String? password;
  String? id;
  String? token;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.cpf,
    this.password,
    this.id,
    this.token,
  });

  //do Map api para o Usermodel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['fullname'],
      email: map['email'],
      phone: map['phone'],
      cpf: map['cpf'],
      password: map['password'],
      id: map['id'],
      token: map['token'],
    );
  }

  //do userModel para o map API
  Map<String, dynamic> toMap() {
    return {
      'fullname': name,
      'email': email,
      'phone': phone,
      'cpf': cpf,
      'password': password,
      'id': id,
      'token': token,
    };
  }

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, phone: $phone, cpf: $cpf, password: $password, id: $id, token: $token)';
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
