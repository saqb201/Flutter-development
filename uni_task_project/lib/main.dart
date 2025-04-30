import 'package:flutter/material.dart';
import 'package:uni_task_project/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      home: HomePage(), // HomePage will be the starting screen
    );
    // MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     primaryColor: Colors.indigo,
    //     fontFamily: 'Poppins',
    //     textTheme: TextTheme(
    //       bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    //       bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
    //       displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    //       displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    //     ),
    //   ),
    //   home: Scaffold(
    //   appBar: AppBar(
    //     title: Text('Attendance Status View' , style: TextStyle(
    //       fontFamily: 'Poppins', color: Colors.white
    //     ),),
    //     backgroundColor: Colors.indigo,
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: ListView(
    //       children: [
    //         Card(
    //           elevation: 5,
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(10),
    //           ),
    //           child: Padding(
    //             padding: const EdgeInsets.all(16.0),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   'CT-260',
    //                   style: TextStyle(
    //                     fontSize: 20,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //                 SizedBox(height: 10),
    //                 Text('Course Name: Computer Networks'),
    //                 Text('Course Instructor: Dr. John Doe'),
    //                 SizedBox(height: 20),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Text('Current Week: 10/16'),
    //                     Text('Date Till Attendance is Taken: 2024-04-10'),
    //                   ],
    //                 ),
    //                 SizedBox(height: 20),
    //                 Text(
    //                   'Attendance Percentage: 85%',
    //                   style: TextStyle(
    //                     fontSize: 18,
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.green,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         SizedBox(height: 20),
    //         // Add more courses here...
    //         Card(
    //           elevation: 5,
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(10),
    //           ),
    //           child: Padding(
    //             padding: const EdgeInsets.all(16.0),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   'CS-210',
    //                   style: TextStyle(
    //                     fontSize: 20,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //                 SizedBox(height: 10),
    //                 Text('Course Name: Data Structures'),
    //                 Text('Course Instructor: Dr. Jane Smith'),
    //                 SizedBox(height: 20),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Text('Current Week: 10/16'),
    //                     Text('Date Till Attendance is Taken: 2024-04-10'),
    //                   ],
    //                 ),
    //                 SizedBox(height: 20),
    //                 Text(
    //                   'Attendance Percentage: 90%',
    //                   style: TextStyle(
    //                     fontSize: 18,
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.green,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ),
    // );
  }
}
