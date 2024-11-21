import 'package:flutter/material.dart';
import 'package:videocall/components/text_field_witget.dart';
import 'package:videocall/constants/current_user.dart';
import 'package:videocall/constants/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final callID = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'App video Call',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your Phone Number:${currentUser.id}'),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Enter Your Number',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            joinCallContainer()
          ],
        ),
      ),
    );
  }

  Widget joinCallContainer() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            TextFieldWitget(
              hintText: 'join call by id',
              controller: callID,
              icon: const SizedBox(),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    if (callID.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('please input unique ID'),
                        duration: Duration(seconds: 1),
                      ));
                    } else {
                      Navigator.pushNamed(context, PageRouteNames.call,
                          arguments: <String, String>{
                            PageParam.call_id: callID.text.trim()
                          });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    'Call Now',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
