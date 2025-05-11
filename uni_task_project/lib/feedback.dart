import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback Page"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                iconColor: Colors.indigo,
                hintText: "Name",
                fillColor: Colors.grey.shade200,
                filled: true,
                prefixIcon: Icon(Icons.account_circle, color: Colors.indigo),
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
                hintText: "Gsuite Email",
                fillColor: Colors.grey.shade200,
                filled: true,
                prefixIcon: Icon(Icons.alternate_email, color: Colors.indigo),
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
          
        ],
      ),
    );
  }
}