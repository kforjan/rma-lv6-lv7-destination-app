import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rma_lv6_7_destination_app/data/destinations.dart';
import 'package:rma_lv6_7_destination_app/ui/add_destination_screen.dart';
import 'package:rma_lv6_7_destination_app/ui/destination_details_screen.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({Key key}) : super(key: key);

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  final locations = Destinations();

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
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddDestinationScreen(rebuild),
              ),
            );
          },
        ),
        middle: Text('Moje destinacije'),
      ),
      child: ListView.builder(
        itemCount: locations.getData().length,
        itemBuilder: (context, index) => Dismissible(
          key: UniqueKey(),
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
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      DestinationDetailsScreen(locations.getData()[index]),
                ),
              );
            },
            child: _buildCard(
              locations.getData()[index].name,
              locations.getData()[index].description,
              locations.getData()[index].imageUrl,
            ),
          ),
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
          onDismissed: (_) {
            locations.deleteLocation(locations.getData()[index].id);
            setState(() {});
          },
          direction: DismissDirection.endToStart,
        ),
      ),
    );
  }

  Widget _buildCard(
    String name,
    String description,
    String src,
  ) {
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
            child: SizedBox(
              height: 60,
              width: 60,
              child: Image.network(
                src,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(name),
              Text(
                description,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }

  void rebuild() {
    setState(() {});
  }
}
