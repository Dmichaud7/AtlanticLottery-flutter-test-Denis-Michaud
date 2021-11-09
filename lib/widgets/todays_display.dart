import 'dart:async';
import 'package:flutter/material.dart';

class TodaysDisplay extends StatefulWidget {
  final String? date;
  const TodaysDisplay({
    Key? key,
    this.date,
  }) : super(key: key);

  @override
  State<TodaysDisplay> createState() => _TodaysDisplayState();
}

/// This is the private State class that goes with TodaysDisplay.
class _TodaysDisplayState extends State<TodaysDisplay> {
  late Timer _timer;
  bool show = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        show = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.grey),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
      child: AnimatedOpacity(
        duration: Duration(seconds: 1),
        opacity: 1,
        child: Text(widget.date!),
      ),
    );
  }
}
