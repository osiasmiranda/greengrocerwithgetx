import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/widgets/common/custom_text_field.dart';
import 'package:greengrocer/src/config/app_data.dart' as app_data;

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil do usuário',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
              readOnly: true,
              icon: Icons.email,
              label: 'EMAIL',
              initialValue: app_data.userModel.email),
          CustomTextField(
              readOnly: true,
              icon: Icons.person,
              label: 'NOME',
              initialValue: app_data.userModel.name),
          CustomTextField(
              readOnly: true,
              icon: Icons.phone_android,
              label: 'CELULAR',
              initialValue: app_data.userModel.phone),
          CustomTextField(
              readOnly: true,
              icon: Icons.copy,
              label: 'CPF',
              isSecret: true,
              initialValue: app_data.userModel.cpf),
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                // primary: Colors.white,
                // backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: const BorderSide(
                  width: 2,
                  color: Colors.green,
                ),
                // backgroundColor: CustomColors.customSwatchColor,
              ),
              onPressed: () {
                updatePassword();
              },
              child: const Text(
                'ATUALIZAR SENHA',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Atualizar senha',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha atual',
                      isSecret: true,
                    ),
                    const CustomTextField(
                      icon: Icons.lock_outline,
                      label: 'Nova senha',
                      isSecret: true,
                    ),
                    const CustomTextField(
                      icon: Icons.lock_outline,
                      label: 'Confirmar nova senha',
                      isSecret: true,
                    ),
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'ATUALIZAR',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
