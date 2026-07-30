import 'package:flutter/material.dart';
import 'package:primeiro_app/utilitarios/tipografia.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Tópico 1: Rolagem e margens nas bordas
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Logo e Nome do App
          Align(
            child: GestureDetector(child: Icon(Icons.arrow_back)),
            alignment: Alignment.centerLeft,
          ),
          const SizedBox(height: 32), // Tópico 3
          // Títulos
          Text("Cadastro", style: Tipografia.h1),
          const SizedBox(height: 12), // Tópico 3
          Text("Crie sua conta para continuar", style: Tipografia.subtitulo),
          const SizedBox(height: 32), // Tópico 3
          // Campo de Nome
          const Text("Nome Completo"),
          const SizedBox(height: 4),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Campo de Email
          const Text("Email"),
          const SizedBox(height: 4),
          TextField(
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
          const SizedBox(height: 16),

          // Campo de Senha
          const Text("Senha"),
          const SizedBox(height: 4),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),

              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Campo de Confirmar Senha
          const Text("Confirmar Senha"),
          const SizedBox(height: 4),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Botão Registrar
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Registrar",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 54),

          // Rodapé
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Já tem uma conta? "),
              InkWell(
                onTap: () {},
                child: Text("Login", style: Tipografia.link),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
