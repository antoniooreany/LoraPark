import 'package:get_it/get_it.dart';
import 'package:lorapark_app/config/router/application.dart';
import 'package:lorapark_app/controller/sensor_controller/air_quality_controller.dart';
import 'package:lorapark_app/controller/sensor_controller/door_controller.dart';
import 'package:lorapark_app/controller/sensor_controller/person_count_controller.dart';
import 'package:lorapark_app/controller/sensor_controller/energy_data_controller.dart';
import 'package:lorapark_app/controller/sensor_controller/structure_damage_controller.dart';
import 'package:lorapark_app/controller/settings_controller/settings_controller.dart';
import 'package:lorapark_app/controller/sensor_controller/waste_level_controller.dart';
import 'package:lorapark_app/data/models/sensors/current_parking_state_data.dart';
import 'package:lorapark_app/controller/sensor_controller/flood_data_controller.dart';
import 'package:lorapark_app/data/repositories/sensor_repository/flood_data.dart';
import 'package:lorapark_app/data/repositories/sensor_repository/person_count.dart';
import 'package:lorapark_app/data/repositories/sensor_repository/sensor_repository.dart';
import 'package:lorapark_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:lorapark_app/themes/lorapark_theme.dart';
import 'package:provider/provider.dart';
import 'package:lorapark_app/services/services.dart';
import 'package:lorapark_app/utils/utils.dart'
    show DisableScrollGlow, hideKeyboardOnTap;
import 'controller/sensor_controller/ground_humidity_controller.dart';
import 'controller/sensor_controller/raised_garden_controller.dart';
import 'controller/sensor_controller/weather_station_controller.dart';
import 'data/repositories/sensor_repository/weather_station.dart';
import 'controller/sensor_controller/parking_sensor_controller.dart';

class LoRaParkApp extends StatefulWidget {
  @override
  _LoRaParkAppState createState() => _LoRaParkAppState();
}

class _LoRaParkAppState extends State<LoRaParkApp> {
  FluroRouter router;

  @override
  void initState() {
    super.initState();
    router = FluroRouter();
    Application.router = router;
    Application.navigatorKey = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    return hideKeyboardOnTap(
        child: MultiProvider(
            // Add all your providers here!
            providers: [
          ChangeNotifierProvider(create: (_) => GetIt.I.get<AuthService>()),
          ChangeNotifierProvider(
            create: (_) => SettingsController(
                repository: GetIt.I.get<PersonCountRepository>()),
            lazy: true,
          ),
          ChangeNotifierProvider(
            create: (_) => WeatherStationController(
                repository: GetIt.I.get<WeatherStationRepository>()),
            lazy: true,
          ),
          ChangeNotifierProvider(
            create: (_) => GrouundHumidityController(
                repository: GetIt.I.get<GroundHumidityRepository>()),
            lazy: true,
          ),
          ChangeNotifierProvider(
            create: (_) => RaisedGardenController(
                repository: GetIt.I.get<RaisedGardenRepository>()),
            lazy: true,
          ),
          ChangeNotifierProvider(
            create: (_) => AirQualityController(
                repository: GetIt.I.get<AirQualityRepository>()),
            lazy: true,
          ),
          ChangeNotifierProvider(
            create: (_) => WasteLevelController(
              repository: GetIt.I.get<WasteLevelRepository>(),
            ),
            lazy: true,
          ),
          ChangeNotifierProvider(
            create: (_) => DoorController(
              repository: GetIt.I.get<DoorRepository>(),
            ),
            lazy: true,
          ),
          ChangeNotifierProvider(
            create: (_) => StructureDamageController(
              repository: GetIt.I.get<StructureDamageRepository>(),
            ),
            lazy: true,
          ),
          ChangeNotifierProvider(
            create: (_) => ParkingSensorController(
                stateRepo: GetIt.I.get<ParkingStateRepository>(),
                avgRepo: GetIt.I.get<ParkingAverageRepository>(),
                eventRepo: GetIt.I.get<ParkingEventRepository>()),
            lazy: true,
          ),
          ChangeNotifierProvider(
            create: (_) => PersonCountController(
              repository: GetIt.I.get<PersonCountRepository>(),
            ),
            lazy: true,
          ),
          ChangeNotifierProvider(
            create: (_) => EnergyDataController(
              repository: GetIt.I.get<EnergyDataRepository>(),
            ),
          ),
          ChangeNotifierProvider(
            create: (_) => FloodDataController(
              repository: GetIt.I.get<FloodDataRepository>(),
            ),
            lazy: true,
          ),
        ],
            child: MaterialApp(
              builder: (_, child) => ScrollConfiguration(
                behavior: DisableScrollGlow(),
                child: child,
              ),
              debugShowCheckedModeBanner: false,
              title: 'LoRaPark',
              theme: LoraParkTheme.themeData,
              home: Init(),
            )));
  }
}