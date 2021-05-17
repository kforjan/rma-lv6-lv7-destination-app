import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rma_lv6_7_destination_app/ui/destination_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: DestinationScreen(),
    );
  }
}
