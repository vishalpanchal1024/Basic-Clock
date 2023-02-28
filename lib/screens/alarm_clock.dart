import 'package:flutter/material.dart';

class AlarmClock extends StatefulWidget {
  const AlarmClock({super.key});

  @override
  _AlarmClockState createState() => _AlarmClockState();
}

class _AlarmClockState extends State<AlarmClock> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Alarm',
        style: TextStyle(color: Colors.white, fontSize: 40),
      ),
    );
  }
}
