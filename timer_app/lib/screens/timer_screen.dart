import 'package:flutter/material.dart';
import 'package:timer_app/widgets/bottom_nav_bar.dart';

class TimerScreen extends StatefulWidget {
  final int screenindex;
  final Function setIndexCallback;
  const TimerScreen(
      {Key? key, required this.screenindex, required this.setIndexCallback})
      : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Text(
            "Timer Screen",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        index: widget.screenindex,
        callback: widget.setIndexCallback,
      ),
    );
  }
}
