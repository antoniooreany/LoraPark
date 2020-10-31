import 'package:flutter/material.dart';
import 'package:lorapark_app/config/locations/sensor_locations.dart';
import 'package:lorapark_app/config/sensor_list.dart';
import 'package:lorapark_app/data/models/sensor.dart';

List<Sensor> floodDataList = [
  Sensor(
    id: Sensors.floodData,
    location: SensorLocations.hochwasser,
    name: 'Flood Data',
    number: '08',
    image: AssetImage('assets/images/flood.jpg'),
    type: SensorType.FLOOD_DATA,
  )
];