import 'dart:async';
import 'package:flutter/material.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({Key? key}) : super(key: key);

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  late Stopwatch stopWatch;
  late Timer timer;

  void handleStartStop() {
    if (stopWatch.isRunning) {
      stopWatch.stop();
    } else {
      stopWatch.start();
    }
  }

  String returnFormattedText() {
    var milli = stopWatch.elapsed.inMilliseconds;

    String milliseconds = (milli % 1000).toString().padLeft(3, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");

    return "$minutes : $seconds : $milliseconds";
  }

  @override
  void initState() {
    super.initState();

    stopWatch = Stopwatch();
    timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 45,
        ),
        Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            color: const Color(0xff2d2f41),
            borderRadius: BorderRadius.circular(200),
            boxShadow: [
              const BoxShadow(
                  offset: Offset(-1.0, -1.0),
                  color: Colors.white10,
                  blurRadius: 1,
                  spreadRadius: 1),
              BoxShadow(
                offset: const Offset(1.0, 1.0),
                color: Colors.black.withOpacity(0.4),
                blurRadius: 0.5,
                spreadRadius: 1,
              )
            ],
          ),
          child: Center(
            child: Text(
              returnFormattedText(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 120,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                if (stopWatch.isRunning) {
                } else {
                  stopWatch.reset();
                }
              },
              child: Container(
                height: 60,
                width: 160,
                decoration: BoxDecoration(
                  color: const Color(0xff2d2f41),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    const BoxShadow(
                        offset: Offset(-1.0, -1.0),
                        color: Colors.white10,
                        blurRadius: 1,
                        spreadRadius: 1),
                    BoxShadow(
                      offset: const Offset(1.0, 1.0),
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 0.5,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Reset',
                    style: TextStyle(color: Color(0xffff706e), fontSize: 22),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                handleStartStop();
              },
              child: Container(
                height: 60,
                width: 160,
                decoration: BoxDecoration(
                  color: const Color(0xff2d2f41),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    const BoxShadow(
                        offset: Offset(-1.0, -1.0),
                        color: Colors.white10,
                        blurRadius: 1,
                        spreadRadius: 1),
                    BoxShadow(
                      offset: const Offset(1.0, 1.0),
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 0.5,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: Center(
                  child: (stopWatch.isRunning)
                      ? const Text(
                          'Stop',
                          style:
                              TextStyle(color: Color(0xffff706e), fontSize: 22),
                        )
                      : const Text(
                          'Start',
                          style:
                              TextStyle(color: Color(0xffff706e), fontSize: 22),
                        ),
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            // InkWell(
            //   onTap: () {},
            //   child: Container(
            //     height: 60,
            //     width: 60,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20),
            //       boxShadow: [
            //         const BoxShadow(
            //             offset: Offset(-1.0, -1.0),
            //             color: Colors.white10,
            //             blurRadius: 0.5,
            //             spreadRadius: 1),
            //         BoxShadow(
            //           offset: const Offset(1.0, 1.0),
            //           color: Colors.black.withOpacity(0.4),
            //           blurRadius: 0.5,
            //           spreadRadius: 1,
            //         )
            //       ],
            //     ),
            //     child: Icon(
            //       Icons.pause,
            //       size: MediaQuery.of(context).size.width / 18,
            //       color: const Color(0xffff706e),
            //     ),
            //   ),
            // ),
          ],
        )
      ],
    );
  }
}
