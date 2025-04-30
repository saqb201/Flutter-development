import 'package:flutter/material.dart';
import 'package:uni_task_project/new_password_page.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  _EmailVerificationPageState createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final TextEditingController codeController = TextEditingController();

  @override
  void dispose() {
    codeController.dispose(); // Clean up the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Email Verification"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              "Check your email 📩",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
              ),
            ),
            SizedBox(height: 10),
            Text(
              "We’ve sent a 6-digit verification code to your email. Please enter it below to continue.",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Poppins",
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 30),

            // Code Input
            TextField(
              controller: codeController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                labelText: "Verification Code",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Verify Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  String enteredCode = codeController.text;
                  print("Entered code: $enteredCode");

                  // Navigate to New Password Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewPasswordPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: Text("Verify" , style: TextStyle(
                  fontFamily: "Poppins" , color: Colors.white,
                ),),
              ),
            ),

            // Resend Code Button
            Center(
              child: TextButton(
                onPressed: () {
                  print("Resend code tapped");
                  // Add resend logic here
                },
                child: Text(
                  "Resend Code",
                  style: TextStyle(
                    color: Colors.indigo,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
