// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: CounterDown(),
    );
  }
}

class CounterDown extends StatefulWidget {
  const CounterDown({super.key});

  @override
  State<CounterDown> createState() => _CounterDownState();
}

class _CounterDownState extends State<CounterDown> {
  int numberOfSec = 5;
  String emoje = "👌";
  Timer t1 = Timer.periodic(Duration(seconds: 1), (timer) {});
  startTimer() {
    t1 = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (numberOfSec == 0) {
          timer.cancel();
        } else
          numberOfSec--;

        //////////////////////
        // if (numberOfSec > 0) {
        //   numberOfSec--;
        // } else
        //   numberOfSec = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            numberOfSec == 0 ? emoje : numberOfSec.toString().padLeft(2, "0"),
            style: TextStyle(fontSize: 80, color: Colors.white),
          ),
          SizedBox(
            height: 22,
          ),
          Text(
            "Seconds ",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  startTimer();
                  if (numberOfSec == 0) {
                    numberOfSec = 6;
                  }
                  //setState(() {});
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                ),
                child: Text(
                  "Start Timer ",
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  t1.cancel();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 198, 46, 35)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                ),
                child: Text(
                  "Stop Timer",
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
