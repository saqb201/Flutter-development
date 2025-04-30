import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uni_task_project/forgot_password.dart';
import 'package:uni_task_project/registration_page.dart';
import 'package:uni_task_project/view_attendence_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page", style: TextStyle(
          fontFamily: "Poppins" , color: Colors.white,
        ),),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Sign In",style: TextStyle(
            fontFamily: "Poppins" , fontSize: 40 , fontWeight:FontWeight.bold , color: Colors.indigo
          ),),
          Center(
            child: SizedBox(
              height: 400,
              width: 400,
              child: 
                  Column(
                    children: [
                      Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                      decoration: InputDecoration(
                        iconColor: Colors.indigo,
                        hintText: "Gsuite Email",
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.alternate_email,
                          color: Colors.indigo,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.green, width: 3.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.indigo, width: 2.0),
                        ),
                      ),
                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                      Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        iconColor: Colors.indigo,
                        hintText: "Password",
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock_open_rounded,
                          color: Colors.indigo,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.green, width: 3.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.indigo,
                            width: 2.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 200),
                    child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Forgot Password Text
            RichText(
              text: TextSpan(
                text: "Forgot Password?",
                style: TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.indigo,
                  fontSize: 16,
                  decoration: TextDecoration.underline, // underline the text
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage()),
                    );
                  },
              ),
            ),
          ],
        ),
      ),
    ),
                
                SizedBox(height: 60,),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AttendanceStatusView()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 60,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                    ],
                  ),
            ),
          ),
          Center(
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontFamily: 'Poppins', color: Colors.indigo),
                children: [
                  TextSpan(text: "Don’t have an account? "),
                  TextSpan(
                    text: "Sign Up",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                  ),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}