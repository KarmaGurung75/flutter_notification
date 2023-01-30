import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return WatchShape(
        builder: (BuildContext context, WearShape shape, Widget? child) {
      return const Scaffold(
        body: SafeArea(
          child: Center(
            child: Text('Dashboard'),
          ),
        ),
      );
    });
  }
}
