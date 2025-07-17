import 'package:flutter/material.dart';
import 'package:initstate_state_managment/provider/example_one_provider_.dart';
import 'package:provider/provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExampleOneProvider>(context, listen: false);
    double value = 1.0;
    // if we will nor provider will encounter a problem that is that the whole program is rebuild again which we donot want as it consumes ram , so at this rate a lot or ram is used which is not efficient , so we want that only that widget will rebuilt in which is occurs so we use providers to encouter the for these problems
    return Scaffold(
      appBar: AppBar(title: Text("First Example of Multiple Providers")),
      body: Column(
        children: [
          Consumer<ExampleOneProvider>(
            builder: (context, value, child) {
              return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  value.setexample(val);
                },
              );
            },
          ),
          Consumer<ExampleOneProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value),
                      ),
                      child: Text("ex 1"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(value.value),
                      ),
                      child: Text("ex 2"),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
