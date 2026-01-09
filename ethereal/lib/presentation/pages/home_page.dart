import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset('lib/config/assets/title_logo.png', width: 100),
        actions: [
          Padding(padding: const EdgeInsets.only(right: 10),
          child: IconButton(onPressed: null, icon: Icon(Icons.account_circle)),
        )],
      ),
      body: SafeArea(child: Column()),
    );
  }
}
