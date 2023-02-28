import 'dart:async';

import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({Key? key}) : super(key: key);

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  var timeNow;

  time() {
    var timenow = DateFormat.jms().format(DateTime.now());
    setState(() {
      timeNow = timenow;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {
        time();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        AnalogClock(
          decoration: BoxDecoration(
            color: const Color(0xff2d2f41),
            //const Color(0xff2d2f41),
            //  borderRadius: BorderRadius.circular(20),
            shape: BoxShape.circle,
            boxShadow: [
              const BoxShadow(
                  offset: Offset(-2.0, -3.0),
                  color: Colors.white10,
                  blurRadius: 3,
                  spreadRadius: 1),
              BoxShadow(
                offset: const Offset(3.0, 3.0),
                color: Colors.black.withOpacity(0.4),
                blurRadius: 3,
                spreadRadius: 1,
              )
            ],
          ),
          width: 300.0,
          height: 300.0,
          isLive: true,
          hourHandColor: const Color(0xffff706e),
          minuteHandColor: const Color(0xffff706e),
          secondHandColor: Colors.white,
          showSecondHand: true,
          numberColor: Colors.white,
          showNumbers: true,
          showAllNumbers: true,
          textScaleFactor: 1.0,
          showTicks: true,
          showDigitalClock: false,
          datetime: DateTime(2023, 02, 27, 11, 56, 18),
          digitalClockColor: const Color(0xffffffff),
          tickColor: Colors.white54.withOpacity(0.5),
          useMilitaryTime: false,
        ),
        const SizedBox(
          height: 35,
        ),
        Text(
          timeNow.toString(),
          style: const TextStyle(fontSize: 22, color: Colors.white),
        )
      ],
    );
  }
}
