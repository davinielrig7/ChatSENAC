import 'package:flutter/material.dart';

import 'Utilitarios/tipografia.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: Login()),
      ),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: [FlutterLogo(size: 18), Text("ChatSENAC")]),

        //titulos
        Text("Entre na sua conta", style: Tipografia.h1),
        Text("Coloque o seu email e senha para logar", style: Tipografia.subtitulo,),

        //campos
        Text("Email"),
        TextField(),
        Text("senha"),
        TextField(),
        InkWell(child: Text("Esqueceu a senha?", textAlign: TextAlign.right, style: Tipografia.link,)),
        ElevatedButton(onPressed: null, child: Text("Entrar")),

        Text("Ou", textAlign: TextAlign.center),
        ElevatedButton(onPressed: null, child: Text("Contiuar com o google")),
        ElevatedButton(
          onPressed: null,
          child: Text("Continuar com o facebook"),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Não tem uma conta?"),
            InkWell(child: Text("Cadastre-se")),
          ],
        ),
      ],
    );
  }
}
