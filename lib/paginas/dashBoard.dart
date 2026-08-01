import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('chatSenac'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Dashboard',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}