import 'package:flutter/material.dart';
import 'package:primeiro_app/utilitarios/tipografia.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final nomeControlador = TextEditingController();
  final emailControlador = TextEditingController();
  final senhaControlador = TextEditingController();
  final confirmarSenhaControlador = TextEditingController();

  bool isObscureSenha = true;
  bool isObscureConfirmarSenha = true;

  void alterarVisibilidadeSenha() {
    setState(() {
      isObscureSenha = !isObscureSenha;
    });
  }

  void alterarVisibilidadeConfirmarSenha() {
    setState(() {
      isObscureConfirmarSenha = !isObscureConfirmarSenha;
    });
  }

  IconData obterIconeSenha() {
    return isObscureSenha
        ? Icons.visibility_off
        : Icons.visibility;
  }

  IconData obterIconeConfirmarSenha() {
    return isObscureConfirmarSenha
        ? Icons.visibility_off
        : Icons.visibility;
  }

  Future<void> fazerCadastro() async {
    if (nomeControlador.text.isEmpty ||
        emailControlador.text.isEmpty ||
        senhaControlador.text.isEmpty ||
        confirmarSenhaControlador.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Preencha todos os campos."),
        ),
      );
      return;
    }

    if (senhaControlador.text != confirmarSenhaControlador.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("As senhas não são iguais."),
        ),
      );
      return;
    }

    try {
      var url = Uri.http(
        "10.112.4.33",
        "api/cadastro",
      );

      var resposta = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "nome": nomeControlador.text,
          "email": emailControlador.text,
          "senha": senhaControlador.text,
        }),
      );

      print("Status: ${resposta.statusCode}");
      print("Resposta: ${resposta.body}");

      if (resposta.statusCode >= 200 &&
          resposta.statusCode < 300) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Cadastro realizado com sucesso!"),
          ),
        );

        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Erro ao cadastrar: ${resposta.body}",
            ),
          ),
        );
      }
    } catch (e) {
      print("Erro: $e");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Não foi possível conectar ao servidor.",
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    nomeControlador.dispose();
    emailControlador.dispose();
    senhaControlador.dispose();
    confirmarSenhaControlador.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              Text(
                "Cadastrar-se",
                style: Tipografia.h1,
              ),

              const SizedBox(height: 12),

              Text(
                "Crie uma conta para continuar!",
                style: Tipografia.subtitulo,
              ),

              const SizedBox(height: 32),

              const Text("Nome"),
              const SizedBox(height: 4),

              TextField(
                controller: nomeControlador,
                decoration: InputDecoration(
                  hintText: "Seu nome",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text("Email"),
              const SizedBox(height: 4),

              TextField(
                controller: emailControlador,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "exemplo@gmail.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 19),

              const Text("Senha"),
              const SizedBox(height: 4),

              TextField(
                controller: senhaControlador,
                obscureText: isObscureSenha,
                decoration: InputDecoration(
                  hintText: "••••••••",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(obterIconeSenha()),
                    onPressed: alterarVisibilidadeSenha,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text("Confirmar Senha"),
              const SizedBox(height: 4),

              TextField(
                controller: confirmarSenhaControlador,
                obscureText: isObscureConfirmarSenha,
                decoration: InputDecoration(
                  hintText: "••••••••",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(obterIconeConfirmarSenha()),
                    onPressed: alterarVisibilidadeConfirmarSenha,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const SizedBox(height: 24),

              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: fazerCadastro,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Registrar",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              const SizedBox(height: 16),
              const SizedBox(height: 54),
            ],
          ),
        ),
      ),
    );
  }
}