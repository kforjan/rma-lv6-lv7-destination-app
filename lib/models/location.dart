import 'package:flutter/foundation.dart';

class Location {
  Location({
    @required this.name,
    @required this.description,
    @required this.imageUrl,
    @required this.lat,
    @required this.long,
  });

  String id = DateTime.now().toIso8601String();
  String name;
  String description;
  String imageUrl;
  String lat;
  String long;
}
