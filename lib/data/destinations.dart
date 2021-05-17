import 'package:rma_lv6_7_destination_app/models/location.dart';

class Destinations {
  static final Destinations _destinations = Destinations._internal();

  factory Destinations() {
    return _destinations;
  }

  var _destinationsData = <Location>[];

  void addLocation(Location location) {
    _destinationsData.add(location);
  }

  void deleteLocation(String id) {
    _destinationsData.removeWhere((element) => element.id == id);
  }

  List<Location> getData() {
    return _destinationsData;
  }

  Destinations._internal();
}
