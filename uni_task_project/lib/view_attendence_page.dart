// import 'package:flutter/material.dart';

// class AttendanceStatusView extends StatefulWidget {
//   const AttendanceStatusView({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _AttendanceStatusViewState createState() => _AttendanceStatusViewState();
// }

// class _AttendanceStatusViewState extends State<AttendanceStatusView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Attendance Status View' , style: TextStyle(
//           fontFamily: 'Poppins', color: Colors.white
//         ),),
//         backgroundColor: Colors.indigo,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             Card(
//               elevation: 5,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'CT-260',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text('Course Name: Computer Networks'),
//                     Text('Course Instructor: Dr. John Doe'),
//                     SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('Current Week: 10/16'),
//                         Text('Date Till Attendance is Taken: 2024-04-10'),
//                       ],
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       'Attendance Percentage: 85%',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             // Add more courses here...
//             Card(
//               elevation: 5,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'CS-210',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text('Course Name: Data Structures'),
//                     Text('Course Instructor: Dr. Jane Smith'),
//                     SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('Current Week: 10/16'),
//                         Text('Date Till Attendance is Taken: 2024-04-10'),
//                       ],
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       'Attendance Percentage: 90%',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class AttendanceStatusView extends StatefulWidget {
  const AttendanceStatusView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AttendanceStatusViewState createState() => _AttendanceStatusViewState();
}

class _AttendanceStatusViewState extends State<AttendanceStatusView> {
  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Attendance Status View',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize:
                screenWidth * 0.06, // Dynamic font size based on screen width
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: EdgeInsets.all(
          screenWidth * 0.05,
        ), // Padding based on screen width
        child: ListView(
          children: [
            _buildCourseCard(
              courseCode: 'CT-260',
              courseName: 'DBMS',
              instructor: 'Pr.M Umer',
              currentWeek: '10/16',
              dateTillAttendance: '2024-04-10',
              attendancePercentage: '85%',
              screenWidth: screenWidth,
            ),
            SizedBox(height: screenHeight * 0.02), // Adjust space between cards
            _buildCourseCard(
              courseCode: 'CS-210',
              courseName: 'Data Structures',
              instructor: 'Pr. Kamran',
              currentWeek: '10/16',
              dateTillAttendance: '2024-04-10',
              attendancePercentage: '90%',
              screenWidth: screenWidth,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard({
    required String courseCode,
    required String courseName,
    required String instructor,
    required String currentWeek,
    required String dateTillAttendance,
    required String attendancePercentage,
    required double screenWidth,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(
          screenWidth * 0.05,
        ), // Padding based on screen width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              courseCode,
              style: TextStyle(
                fontSize: screenWidth * 0.05, // Font size based on screen width
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenWidth * 0.02), // Adjust space between text
            Text('Course Name: $courseName'),
            Text('Course Instructor: $instructor'),
            SizedBox(height: screenWidth * 0.03),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
                Text('Current Week: $currentWeek'),
                Text('Date Till Attendance is Taken: $dateTillAttendance'),
                Text(
                  'Attendance Percentage: $attendancePercentage',
                  style: TextStyle(
                    fontSize:
                        screenWidth * 0.045, // Font size based on screen width
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              // ],
            // ),
            // SizedBox(height: screenWidth * 0.03),
            
          ],
        ),
      ),
    );
  }
}
