import 'package:flutter/material.dart';
import 'package:videocall/constants/current_user.dart';
import 'package:videocall/screens/home_page.dart';

class SignInButton extends StatelessWidget {
  final TextEditingController userID;
  const SignInButton({super.key, required this.userID});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          currentUser.id = userID.text.trim();
          currentUser.name = 'user_$userID';
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Text(
          'Sign In',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20),
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
