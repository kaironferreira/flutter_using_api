import 'package:flutter/material.dart';
import 'package:flutter_using_api/controllers/login_controller.dart';
import 'package:flutter_using_api/views/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool mostrarSenha = false;
  LoginController _loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              color: Colors.deepPurple,
              size: 150,
            ),
            TextField(
              onChanged: _loginController.setLogin,
              decoration: InputDecoration(
                label: Text(
                  "Login",
                ),
              ),
            ),
            TextField(
              onChanged: _loginController.setSenha,
              obscureText: mostrarSenha == false ? true : false,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  child: mostrarSenha == false
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  onTap: () {
                    setState(() {
                      mostrarSenha = !mostrarSenha;
                    });
                  },
                ),
                label: Text(
                  "Senha",
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ValueListenableBuilder<bool>(
                valueListenable: _loginController.isLoading,
                builder: (_, isLoading, __) {
                  return isLoading
                      ? CircularProgressIndicator()
                      : MaterialButton(
                          minWidth: double.infinity,
                          color: Colors.deepPurple,
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            _loginController.auth().then(
                              (result) {
                                if (result) {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red.shade400,
                                      content: Text(
                                        "Login ou senha inválido!",
                                      ),
                                    ),
                                  );
                                }
                              },
                            );
                          },
                        );
                })
          ],
        ),
      ),
    );
  }
}
