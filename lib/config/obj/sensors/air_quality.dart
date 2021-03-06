import 'package:lorapark_app/config/locations/sensor_locations.dart';
import 'package:lorapark_app/config/sensor_list.dart';
import 'package:lorapark_app/data/models/sensor.dart';

List<Sensor> airQualityList = [
  Sensor(
    type: SensorType.air_quality,
    id: SensorEndpoints.airQuality_one,
    name: 'Air Quality',
    number: '02',
    location: SensorLocations.airQuality,
  ),
];
