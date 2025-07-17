import 'package:covid_tracker/Model/world_states_model.dart';
import 'package:covid_tracker/Servicies/state_services.dart';
import 'package:covid_tracker/View/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class worldscreen extends StatefulWidget {
  const worldscreen({super.key});

  @override
  State<worldscreen> createState() => _worldscreenState();
}

class _worldscreenState extends State<worldscreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final colorlist = <Color>{
    const Color(0xff4285F4),
    const Color(0xff1aa268),
    const Color(0xffde5246),
  };
  @override
  Widget build(BuildContext context) {
    StateService stateservice = StateService();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Expanded(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .01),
        
                FutureBuilder(
                  future: stateservice.fecthWorldStatesRecords(),
                  builder: (context, AsyncSnapshot<WorldModel> snapshot) {
                    if (!snapshot.hasData) {
                      return Expanded(
                        flex: 1,
                        child: SpinKitFadingCircle(
                          color: Colors.black,
                          size: 50.0,
                          controller: _controller,
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          PieChart(
                            dataMap: {
                              "Total": double.parse(
                                snapshot.data!.cases.toString(),
                              ),
                              "Recovered": double.parse(
                                snapshot.data!.recovered.toString(),
                              ),
                              "Deaths": double.parse(
                                snapshot.data!.deaths.toString(),
                              ),
                            },
                            chartValuesOptions: ChartValuesOptions(
                              showChartValuesInPercentage: true,
                            ),
                            chartRadius: MediaQuery.of(context).size.width / 3,
                            legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.left,
                            ),
                            animationDuration: const Duration(milliseconds: 1200),
                            chartType: ChartType.ring,
                          ),
        
                          Card(
                            child: Column(
                              children: [
                                Reusable(
                                  title: "Total",
                                  values: snapshot.data!.cases.toString(),
                                ),
                                Reusable(
                                  title: "Active",
                                  values: snapshot.data!.active.toString(),
                                ),
                                Reusable(
                                  title: "Recovered",
                                  values: snapshot.data!.recovered.toString(),
                                ),
                                Reusable(
                                  title: "Critical",
                                  values: snapshot.data!.critical.toString(),
                                ),
                                Reusable(
                                  title: "Deaths",
                                  values: snapshot.data!.deaths.toString(),
                                ),
                                Reusable(
                                  title: "Todays's Recovered",
                                  values:
                                      snapshot.data!.todayRecovered.toString(),
                                ),
                                Reusable(
                                  title: "Todays's Deaths",
                                  values: snapshot.data!.todayDeaths.toString(),
                                ),
                                Reusable(
                                  title: "Todays's Cases",
                                  values: snapshot.data!.todayCases.toString(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CountriesList(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xff1aa268),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: const Text(
                                    "Track Countries",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
        
                // PieChart(
                //   dataMap: {"Total": 23, "Recovered": 12, "Deaths": 11},
                //   chartRadius: MediaQuery.of(context).size.width / 3,
                //   legendOptions: const LegendOptions(
                //     legendPosition: LegendPosition.left,
                //   ),
                //   animationDuration: const Duration(milliseconds: 1200),
                //   chartType: ChartType.ring,
                // ),
        
                // Card(
                //   child: Column(
                //     children: [
                //       Reusable(title: "Total", values: "23"),
                //       Reusable(title: "Recovered", values: "12"),
                //       Reusable(title: "Deaths", values: "11"),
                //     ],
                //   ),
                // ),
                // SizedBox(height: 10),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Container(
                //     height: 50,
                //     decoration: BoxDecoration(
                //       color: Color(0xff1aa268),
                //       borderRadius: BorderRadius.circular(15),
                //     ),
                //     child: Center(
                //       child: const Text(
                //         "Track Countries",
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Reusable extends StatelessWidget {
  String title, values;
  Reusable({super.key, required this.title, required this.values});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
          
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(values)],
          ),
          SizedBox(height: 5),
          Divider(),
        ],
      ),
    );
  }
}
