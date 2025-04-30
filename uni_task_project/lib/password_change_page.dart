import 'package:flutter/material.dart';
import 'package:uni_task_project/login_page.dart';


class PasswordChangePage extends StatelessWidget {
  const PasswordChangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Clean white background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Big Circle with Check Icon
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.shade400, // You can change the color
              ),
              child: Icon(Icons.check, size: 70, color: Colors.white),
            ),

            SizedBox(height: 30),

            // Success Text
            Text(
              "Your password has been changed",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 10),

            // Optional: Go to Login Button
            TextButton(
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                ); // or navigate to login screen
              },
              child: Text(
                "Back to Login",
                style: TextStyle(
                  color: Colors.indigo,
                  fontFamily: "Poppins",
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
