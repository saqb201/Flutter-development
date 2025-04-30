
import 'package:flutter/material.dart';
import 'package:uni_task_project/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String selectedSection = 'A';
  String selectedBatch = '2024'; // 👈 Default batch

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page",style: TextStyle(
          fontFamily: 'Poppins' , color: Colors.white,
        ),),
        backgroundColor: Colors.indigo,

      ),
      body: Column(
        children: [

          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                decoration: InputDecoration(
                  iconColor: Colors.indigo,
                  hintText: "Name",
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  prefixIcon: Icon(Icons.person, color: Colors.indigo),
                focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                        color: Colors.green,
                        width: 3.0,                        
                        )
                      ),
                enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                          width: 2.0
                          
                        )
                      )
            ),
            keyboardType: TextInputType.name,
            ),
          ),
          
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                iconColor: Colors.indigo,
                hintText: "GsuiteID",
                fillColor: Colors.grey.shade200,
                filled: true,
                prefixIcon: Icon(Icons.alternate_email, color: Colors.indigo),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.green ,
                   width: 3.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.indigo ,
                  width: 2.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                iconColor: Colors.indigo,
                hintText: "Password",
                fillColor: Colors.grey.shade200,
                filled: true,
                prefixIcon: Icon(Icons.lock_open_rounded, color: Colors.indigo),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.green ,
                   width: 3.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.indigo ,
                  width: 2.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                iconColor: Colors.indigo,
                hintText: "Confirm Password",
                fillColor: Colors.grey.shade200,
                filled: true,
                prefixIcon: Icon(Icons.lock_open_rounded, color: Colors.indigo),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.green,
                   width: 3.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.indigo ,
                  width: 2.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                iconColor: Colors.indigo,
                hintText: "Department",
                fillColor: Colors.grey.shade200,
                filled: true,
                prefixIcon: Icon(Icons.apartment_rounded, color: Colors.indigo),
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
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                fillColor: Colors.grey.shade200,
                filled: true,
                labelText: 'Section',
                prefixIcon: Icon(Icons.apartment , color: Colors.indigo,),
                border: OutlineInputBorder(),
              ),
              borderRadius: BorderRadius.circular(20),
              value: selectedSection,
              items:
                  ['A', 'B', 'C', 'D', 'E', 'F'].map((section) {
                    return DropdownMenuItem<String>(
                      value: section,
                      child: Text('Section $section'),
                    );
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSection = value!;
                });
              },
              validator:
                  (value) => value == null ? 'Please select a section' : null,
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                fillColor: Colors.grey.shade200,
                filled: true,
                labelText: 'Batch',
                prefixIcon: Icon(
                  Icons.calendar_today,color: Colors.indigo,
                ), // You can also use Icons.date_range
                border: OutlineInputBorder(),
              ),
              value: selectedBatch,
              items:
                  ['2021', '2022', '2023', '2024'].map((batch) {
                    return DropdownMenuItem<String>(
                      value: batch,
                      child: Text('Batch $batch'),
                    );
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedBatch = value!;
                });
              },
              validator:
                  (value) => value == null ? 'Please select your batch' : null,
            ),
          ),

          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 50,),
          Text("By signing below , you agree to \nTerms of Use and Privacy Policy"),
        ],
      ),
    );
  }
}