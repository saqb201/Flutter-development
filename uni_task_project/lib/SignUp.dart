import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignUp Page')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(hintText: 'password'),
            ),
            SizedBox(height: 20,),
            Container(
              height: 40,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Center(child: Text('Sign Up')),
            )
          ],
        ),
      ),
    );
  }
}
