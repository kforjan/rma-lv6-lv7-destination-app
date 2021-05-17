import 'package:flutter/cupertino.dart';

class DestinationDetailsScreen extends StatelessWidget {
  const DestinationDetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Unos nove destinacije'),
      ),
      child: Container(),
    );
  }
}
