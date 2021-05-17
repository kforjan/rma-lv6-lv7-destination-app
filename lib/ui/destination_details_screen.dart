import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:rma_lv6_7_destination_app/models/destination.dart';
import 'package:latlong/latlong.dart';

class DestinationDetailsScreen extends StatelessWidget {
  const DestinationDetailsScreen(this._destination);

  final Destination _destination;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Unos nove destinacije'),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: _buildMap(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 15.0,
            ),
            child: Text(
              _destination.name,
              style: TextStyle(fontSize: 27),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 15.0,
            ),
            child: Text(
              _destination.description,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: Image.network(
              _destination.imageUrl,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMap() {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(_destination.lat, _destination.long),
        zoom: 10,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 100.0,
              height: 100.0,
              point: LatLng(
                _destination.lat,
                _destination.long,
              ),
              builder: (ctx) => Container(
                child: Icon(
                  Icons.location_pin,
                  size: 40,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
