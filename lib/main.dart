import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Login()));
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlutterLogo(size: 18),
        Text("ChatSENAC"),
        Text("Entre na sua conta"),
        Text("Coloque o seu emaoç e senha para logar"),
        Text("Email"),
        TextField(),
        Text("senha"),
        TextField(),
        InkWell(child: Text("Esqueceu a senha?")),
        ElevatedButton(onPressed: null, child: Text("Entrar")),
        Text("Ou"),
        ElevatedButton(onPressed: null, child: Text("Contiuar com o google")),
        ElevatedButton(onPressed: null, child: Text("Continuar com o facebook")),
        Text("Não tem uma conta?"),
        InkWell(child: Text("Cadastre-se")),

      ],
    );
  }
}
