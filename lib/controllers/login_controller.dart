import 'package:flutter/cupertino.dart';

class LoginController {
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  String? _login;
  setLogin(String value) => _login = value;
  String? _senha;
  setSenha(String value) => _senha = value;

  Future<bool> auth() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 1));
    isLoading.value = false;
    return (_login == 'admin' && _senha == 'admin');
  }
}
