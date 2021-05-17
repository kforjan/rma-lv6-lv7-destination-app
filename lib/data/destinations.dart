import 'package:rma_lv6_7_destination_app/models/destination.dart';

class Destinations {
  static final Destinations _destinations = Destinations._internal();

  factory Destinations() {
    return _destinations;
  }

  var _destinationsData = <Destination>[];

  void addLocation(Destination location) {
    _destinationsData.add(location);
  }

  void deleteLocation(String id) {
    _destinationsData.removeWhere((element) => element.id == id);
  }

  List<Destination> getData() {
    return _destinationsData;
  }

  Destinations._internal();
}
