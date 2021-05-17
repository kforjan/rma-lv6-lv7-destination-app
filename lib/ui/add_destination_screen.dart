import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rma_lv6_7_destination_app/data/locations.dart';
import 'package:rma_lv6_7_destination_app/models/location.dart';

class AddDestinationScreen extends StatefulWidget {
  AddDestinationScreen(this.rebuild);
  final Function rebuild;

  @override
  _AddDestinationScreenState createState() => _AddDestinationScreenState();
}

class _AddDestinationScreenState extends State<AddDestinationScreen> {
  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _urlController = TextEditingController();
    final _descriptionController = TextEditingController();
    final _latController = TextEditingController();
    final _longController = TextEditingController();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Unos nove destinacije'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNamedTextField('Naziv:', _nameController),
                _buildNamedTextField('Opis:', _descriptionController),
                _buildNamedTextField('URL:', _urlController),
                _buildNamedTextField('Lat:', _latController),
                _buildNamedTextField('Long:', _longController),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: CupertinoButton(
                    onPressed: () {
                      Locations().addLocation(
                        Location(
                          name: _nameController.text,
                          imageUrl: _urlController.text,
                          description: _descriptionController.text,
                          lat: _latController.text,
                          long: _longController.text,
                        ),
                      );
                      widget.rebuild();
                      Navigator.of(context).pop();
                    },
                    child: Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNamedTextField(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.black54),
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            child: CupertinoTextField(
              controller: controller,
            ),
          )
        ],
      ),
    );
  }
}
