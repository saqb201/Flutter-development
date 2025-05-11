// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:http/http.dart%20';
// // ignore: unused_import
// import 'package:http/http.dart' as http;

// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   TextEditingController emailcontroller = TextEditingController();
//   TextEditingController passwordcontroller = TextEditingController();

//   void login(String email,password) async {
//     try{
//           Response response = await post (Uri.parse('https://reqres.in/api/register'),
//           body: {
//             'email': email,
//             'password': password,
//           }
//           );

//           if (response.statusCode == 200){
//              Text('Account made Successfully');
//           }
//           else{
//              Text('Failed');
//           }
//     }
//     catch(e){
//       print(e.toString());
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('SignUp Page')),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextField(
//               controller: emailcontroller,
//               decoration: InputDecoration(hintText: 'Email'),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: passwordcontroller,
//               decoration: InputDecoration(hintText: 'password'),
//             ),
//             SizedBox(height: 10),
//             GestureDetector(
//               onTap: () {
//                 login(
//                   emailcontroller.text.toString(),
//                   passwordcontroller.text.toString(),
//                 );
//               },
//             child:Container(
//               height: 40,
//               width: 400,
//               decoration: BoxDecoration(
//                 color: Colors.blueAccent,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Center(child: Text('Sign Up')),
//             ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/register'),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        // You should display success using ScaffoldMessenger
        ScaffoldMessenger.of(context,)
        .showSnackBar(SnackBar(content: Text('Account created successfully')));} else {
        ScaffoldMessenger.of(context,)
        .showSnackBar(SnackBar(content: Text('Failed: ${response.body}')));}} catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('An error occurred')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(
        child: Text('Sign Up Page',style: TextStyle(
          color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        // 👈 Wrap body in scrollable container
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            // 👈 Center the form
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    login(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 400, // 👈 Stretch to full width
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
