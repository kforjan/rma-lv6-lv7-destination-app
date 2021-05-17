import 'package:rma_lv6_7_destination_app/models/location.dart';

class Locations {
  static final Locations _locations = Locations._internal();

  factory Locations() {
    return _locations;
  }

  var _locationsData = <Location>[];

  void addLocation(Location location) {
    _locationsData.add(location);
  }

  void deleteLocation(String id) {
    _locationsData.removeWhere((element) => element.id == id);
  }

  List<Location> getData() {
    return _locationsData;
  }

  Locations._internal();
}
