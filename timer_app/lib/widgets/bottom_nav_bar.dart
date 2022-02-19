// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int index;
  final Function? callback;
  const BottomNavBar({Key? key, required this.index, this.callback})
      : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    _BuildNavBarItem(Icon icon, String label) {
      return BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(8),
            child: icon,
          ),
          label: label);
    }

    // ignore: prefer_const_literals_to_create_immutables
    return BottomNavigationBar(
      // ignore: deprecated_member_use
      currentIndex: widget.index,

      elevation: 0,
      unselectedFontSize: 14,
      selectedFontSize: 14,
      // ignore: deprecated_member_use
      unselectedItemColor: Theme.of(context).accentColor,
      selectedItemColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).backgroundColor,
      items: <BottomNavigationBarItem>[
        _BuildNavBarItem(const Icon(Icons.timer), "Stop watch"),
        _BuildNavBarItem(const Icon(Icons.slow_motion_video), "Timer"),
        _BuildNavBarItem(const Icon(Icons.settings), "Setings"),
      ],
      onTap: (ind) {
        widget.callback!(ind);
      },
    );
  }
}
