import 'package:flutter/material.dart';
import 'package:semtitulo1/pages/home_page.dart';

import '../data/db_helper.dart';
import '../data/pacote_dao.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

   PacoteDao().listarPacotes();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                const Placeholder(fallbackHeight: 180),
                const SizedBox(height: 32),
                TextFormField(
                  controller: userController,
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'O email é obrigatório';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'A senha é obrigatório';
                    } else if (value.length < 6) {
                      return 'A senha deve conter no mínimo 6 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFE81F7C),
                  ),
                  onPressed: onPressed,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Entrar com Hurb',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void onPressed() {

    if(_formKey.currentState!.validate()){
      String userName = "LooxisPlayer@gmail.com";
      String password = "@mastermister";

      String user = userController.text;
      String pwd = passwordController.text;

      if(userName == user && password == pwd){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
            ),
        );
      }else{
        print("Errou algo ai");
      }
    }else{
        print("Formulario se foi man");
    }
  }
}
