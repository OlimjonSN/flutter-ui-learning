import 'package:flutter/material.dart';
import 'package:timer_app/widgets/bottom_nav_bar.dart';

class OptionScreen extends StatefulWidget {
  final int index;
  final Function setIndexCallback;
  const OptionScreen(
      {Key? key, required this.index, required this.setIndexCallback})
      : super(key: key);

  @override
  _OptionScreenState createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Text(
            "Options Screen",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        index: widget.index,
        callback: widget.setIndexCallback,
      ),
    );
  }
}
