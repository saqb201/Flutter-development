import 'package:covid_tracker/View/worldscreen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailinfoScreen extends StatefulWidget {
  final String name, image;
  int totalcases,
      totaldeaths,
      totalrecovered,
      active,
      critical,
      test,
      todayrecovered;
  DetailinfoScreen({super.key, 
    required this.name,
    required this.test,
    required this.todayrecovered,
    required this.totaldeaths,
    required this.totalcases,
    required this.totalrecovered,
    required this.active,
    required this.critical,
    required this.image,
  });

  @override
  State<DetailinfoScreen> createState() => _DetailinfoScreenState();
}

class _DetailinfoScreenState extends State<DetailinfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children:[ 
              Padding(
                padding: EdgeInsets.only(top : MediaQuery.of(context).size.height *0.067),
                child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * .06,),
                    Reusable(
                      title: "Cases",
                      values: '${widget.totalcases}'
                    ),
                    Reusable(title: "Total Recovered", values: '${widget.totalrecovered}'),
                    Reusable(title: "Deaths", values: '${widget.totaldeaths}'),
                    Reusable(title: "Active", values: '${widget.active}'),
                    Reusable(title: "Critical", values: '${widget.critical}'),
                    Reusable(title: "Today Recovered ", values: '${widget.todayrecovered}'),
                  ],
                ),
                  ),
              ),

              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )

            ]
          ),
        ],
      ),
    );
  }
}
