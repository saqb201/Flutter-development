import 'package:covid_tracker/Servicies/state_services.dart';
import 'package:covid_tracker/View/detailinfo_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StateService stateservices = StateService();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchcontroller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  hintText: "Search Countries by name ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            Expanded(
              child: FutureBuilder(
                future: stateservices.courientsList(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade700,

                      highlightColor: Colors.grey.shade100,
                      child: ListView.builder(
                        itemCount: 4,
                        // itemCount: 1,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Container(
                                  height: 10,
                                  width: 89,
                                  color: Colors.white,
                                ),

                                subtitle: Container(
                                  height: 10,
                                  width: 89,
                                  color: Colors.white,
                                ),
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      // child : Column(
                      //       children: [
                      //         ListTile(

                      //           title: Container(height: 10 , width: 89,color: Colors.white,),

                      //           subtitle: Container(height: 10 , width: 89,color: Colors.white,),
                      //           leading: Container(height: 50, width: 50,color: Colors.white,)
                      //         ),
                      //       ],
                      //     ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      // itemCount: 1,
                      itemBuilder: (context, index) {
                        String name = snapshot.data?[index]['country'];
                        if (searchcontroller.text.isEmpty) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => DetailinfoScreen(
                                            image:
                                                snapshot
                                                    .data?[index]['countryInfo']?['flag'] ??
                                                " ",
                                            name:
                                                snapshot
                                                    .data?[index]['country'] ??
                                                ' ',
                                            critical:
                                                snapshot
                                                    .data?[index]['critical'] ??
                                                0,
                                            todayrecovered:
                                                snapshot
                                                    .data?[index]['todayRecovered'] ??
                                                0,
                                            totalcases:
                                                snapshot
                                                    .data?[index]['cases'] ??
                                                0,
                                            test:
                                                snapshot
                                                    .data?[index]['tests'] ??
                                                0,
                                            totaldeaths:
                                                snapshot
                                                    .data?[index]['deaths'] ??
                                                0,
                                            totalrecovered:
                                                snapshot
                                                    .data?[index]['recovered'] ??
                                                0,
                                            active:
                                                snapshot
                                                    .data?[index]['active'] ??
                                                0,
                                          ),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  title: Text(snapshot.data?[index]['country']),

                                  subtitle: Text(
                                    snapshot.data![index]['cases'].toString(),
                                  ),
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(
                                      snapshot
                                          .data?[index]['countryInfo']?['flag'],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (name.toLowerCase().contains(
                          searchcontroller.text.toLowerCase(),
                        )) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => DetailinfoScreen(
                                        image:
                                            snapshot
                                                .data?[index]['countryInfo']?['flag'] ??
                                            " ",
                                        name:
                                            snapshot.data?[index]['country'] ??
                                            ' ',
                                        critical:
                                            snapshot.data?[index]['critical'] ??
                                            0,
                                        todayrecovered:
                                            snapshot
                                                .data?[index]['todayRecovered'] ??
                                            0,
                                        totalcases:
                                            snapshot.data?[index]['cases'] ?? 0,
                                        test:
                                            snapshot.data?[index]['tests'] ?? 0,
                                        totaldeaths:
                                            snapshot.data?[index]['deaths'] ??
                                            0,
                                        totalrecovered:
                                            snapshot
                                                .data?[index]['recovered'] ??
                                            0,
                                        active:
                                            snapshot.data?[index]['active'] ??
                                            0,
                                      ),
                                ),
                              );
                            },
                            child: ListTile(
                              title: Text(snapshot.data?[index]['country']),

                              subtitle: Text(
                                snapshot.data![index]['cases'].toString(),
                              ),
                              leading: Image(
                                height: 50,
                                width: 50,
                                image: NetworkImage(
                                  snapshot.data?[index]['countryInfo']?['flag'],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
