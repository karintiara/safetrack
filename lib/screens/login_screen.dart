import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  void login(BuildContext context) {
    if (userController.text == 'user' && passController.text == '123') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login gagal!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login SafeTrack')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: userController, decoration: InputDecoration(labelText: 'Username')),
            TextField(controller: passController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            ElevatedButton(onPressed: () => login(context), child: Text('Login')),
          ],
        ),
      ),
    );
  }
}
