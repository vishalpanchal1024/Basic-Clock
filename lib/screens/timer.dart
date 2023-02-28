import 'dart:async';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Timer myTimer;
  Duration myDuration = const Duration();

  @override
  void initState() {
    super.initState();
    resetTimer();
    myTimer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  void resetTimer() {
    setState(() => myDuration = const Duration(minutes: 5));
  }

  void startTimer() {
    myTimer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      resetTimer();
    }
    setState(() => myTimer.cancel());
  }

  void addTime() {
    const addSeconds = -1;
    setState(() {
      final seconds = myDuration.inSeconds + addSeconds;
      if (seconds < 0) {
        myTimer.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  Widget displayTimer() {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final hours = strDigits(myDuration.inHours);
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      displayTimerUI(time: hours, header: 'HRS :'),
      const SizedBox(
        width: 2,
      ),
      displayTimerUI(time: minutes, header: 'MIN :'),
      const SizedBox(
        width: 2,
      ),
      displayTimerUI(time: seconds, header: 'SEC'),
    ]);
  }

  Widget displayTimerUI({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: const Color(0xff2d2f41),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              '${time} ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 35,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            header,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      );

  Widget displayTimerButtons() {
    final isTimerRunning = myTimer == null ? false : myTimer.isActive;
    final isTimerCompleted = myDuration.inSeconds == 0;
    return isTimerRunning || isTimerCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: const Color(0xff2d2f41),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16)),
                  onPressed: () {
                    if (isTimerRunning) {
                      stopTimer(resets: false);
                    }
                  },
                  child: const Text(
                    'STOP',
                    style: TextStyle(fontSize: 20, color: Color(0xffff706e)),
                  )),
              const SizedBox(
                width: 25,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: const Color(0xff2d2f41),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16)),
                onPressed: stopTimer,
                child: const Text('RESET',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffff706e),
                    )),
              )
            ],
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff2d2f41),
                elevation: 5,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
            onPressed: startTimer,
            child: const Text(
              "Start Timer",
              style: TextStyle(fontSize: 20, color: Color(0xffff706e)),
            ));
  }

  // Display Countdown Timer Flutter
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        displayTimer(),
        const SizedBox(height: 100),
        displayTimerButtons()
      ],
    );
  }
}
