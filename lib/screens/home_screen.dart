import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stop_watch/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // logic of the app
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;
  List laps = [];

  // stop timer function
  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  // creating reset function
  void reset() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = "00";
      digitMinutes = "00";
      digitHours = "00";

      started = false;
    });
  }

  void addLaps() {
    String lap = "$digitHours:$digitMinutes:$digitSeconds";
    setState(() {
      laps.add(lap);
    });
  }

  void deleteLapses(){
    setState(() {
      laps.clear();
    });
  }

  // start timer function
  void start() {
    started = true;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        int localSeconds = seconds + 1;
        int localMinutes = minutes;
        int localHours = hours;

        if (localSeconds > 59) {
          if (localMinutes > 59) {
            localHours++;
            localMinutes = 0;
          } else {
            localMinutes++;
            localSeconds = 0;
          }
        }
        setState(() {
          seconds = localSeconds;
          minutes = localMinutes;
          hours = localHours;
          digitSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
          digitHours = (hours >= 10) ? "$hours" : "0$hours";
          digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Stop",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Watch",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
               Center(
                child: Text(
                  "$digitHours:$digitMinutes:$digitSeconds",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 70,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                height: 400,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(29, 30, 49, 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),

                // add list builder
                child: ListView.builder(
                  itemCount: laps.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lap n°${index + 1}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "${laps[index]}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    buttonText: (!started) ? "Start" : "Pause",
                    onPressed: () {
                      (!started) ? start() : stop();
                    }, 
                    color: (!started) ? Colors.pink.shade300 : Colors.orangeAccent,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  IconButton(
                    onPressed: () {
                      addLaps();
                    },
                    icon: const Icon(
                      Icons.flag,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  CustomButton(
                    buttonText: 'Reset',
                    onPressed: () {
                      reset();
                      deleteLapses();
                    }, color: Colors.greenAccent,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
