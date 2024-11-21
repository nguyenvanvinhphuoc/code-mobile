import 'package:flutter/material.dart';
import 'package:videocall/components/signinbutton.dart';
import 'package:videocall/components/text_field_witget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneNum = TextEditingController(text: '+84');
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: const TextSpan(
              text: 'ZE',
              style: TextStyle(fontSize: 20, color: Colors.black),
              children: [
                TextSpan(
                  text: 'GO',
                  style: TextStyle(color: Colors.blue),
                ),
                TextSpan(text: 'CLOUD', style: TextStyle(color: Colors.black))
              ]),
        ),
      ),
      backgroundColor: Colors.blueGrey[50],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            TextFieldWitget(
              hintText: 'Phone Number',
              controller: phoneNum,
              icon: Icon(Icons.phone),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWitget(
              hintText: 'Password',
              controller: password,
              icon: Icon(Icons.lock),
            ),
            const SizedBox(
              height: 30,
            ),
            SignInButton(
              userID: phoneNum,
            ),
          ],
        ),
      ),
    );
  }
}
