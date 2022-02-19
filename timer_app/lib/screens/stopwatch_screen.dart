import 'package:flutter/material.dart';
import 'package:timer_app/widgets/bottom_nav_bar.dart';

class StopwatchScreen extends StatefulWidget {
  final int screenindex;
  final Function setIndexCallback;
  const StopwatchScreen(
      {Key? key, required this.screenindex, required this.setIndexCallback})
      : super(key: key);

  @override
  StopwatchScreenState createState() => StopwatchScreenState();
}

class StopwatchScreenState extends State<StopwatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Text(
            "Stop watch Screen",
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
