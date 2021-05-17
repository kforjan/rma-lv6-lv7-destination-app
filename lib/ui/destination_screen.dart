import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DestinationScreen extends StatelessWidget {
  const DestinationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        border: Border.all(
          color: Colors.grey,
          width: 0.6,
        ),
        trailing: CupertinoButton(
          child: Icon(CupertinoIcons.add),
          onPressed: () {},
        ),
        middle: Text('Moje destinacije'),
      ),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => Dismissible(
          background: Container(
            padding: EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Delete me',
                style: TextStyle(color: Colors.white),
              ),
            ),
            color: Colors.red,
          ),
          child: _buildCard('https://picsum.photos/75'), //TODO url
          key: UniqueKey(),
          confirmDismiss: (_) {
            return showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: Text('Obrisati destinaciju?'),
                actions: [
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text('Delete'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    isDestructiveAction: true,
                  ),
                ],
              ),
            );
          },
          onDismissed: (_) {},
          direction: DismissDirection.endToStart,
        ),
      ),
    );
  }

  Widget _buildCard(String src) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.6,
          ),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Image.network(src),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('xd'),
              Text(
                'data',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
