import 'package:basic_clock/screens/alarm_clock.dart';
import 'package:basic_clock/screens/clock.dart';
import 'package:basic_clock/screens/stop_watch.dart';
import 'package:basic_clock/screens/timer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      title: 'Clock',
      home: DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xff2d2f41), //fffeff   0xff2d2f41
            appBar: AppBar(
              title: const Text(
                'Clock',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              backgroundColor: const Color(0xff2d2f41),
              elevation: 1,
              bottom: TabBar(
                isScrollable: false,
                labelColor: const Color(0xffff706e),
                indicatorColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 1.0,
                unselectedLabelColor: Colors.white54.withOpacity(0.5),
                tabs: const [
                  Tab(
                    icon: Icon(
                      Icons.watch_later,
                      size: 30,
                    ),
                    text: 'Clock',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.alarm,
                      size: 30,
                    ),
                    text: 'Alarm',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.timer,
                      size: 30,
                    ),
                    text: 'Stopwatch',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.hourglass_bottom,
                      size: 30,
                    ),
                    text: 'Timer',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                const ClockScreen(),
                const AlarmClock(),
                const StopWatchScreen(),
                TimerScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
