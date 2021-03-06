import 'package:lorapark_app/config/urls.dart';
import 'package:lorapark_app/data/models/sensor_data.dart'
    show StructureDamageData;
import 'package:lorapark_app/data/repositories/sensor_repository/base_sensor_repository.dart';
import 'package:flutter/material.dart' show required;

abstract class StructureDamageRepository extends BaseSensorRepository{

}

class StructureDamageRepositoryImpl extends StructureDamageRepository {
  @override
  String get endpoint => Endpoints.STRUCTURE_DAMAGE;

  List<StructureDamageData> convert(Iterable it) {
    return it.map((e) => StructureDamageData.fromJson(e)).toList();
  }

  @override
  Future<List<StructureDamageData>> get({String id, List<String> ids}) async {
    return convert(await super.get(id: id, ids: ids));
  }

  @override
  Future<List<StructureDamageData>> getByTime(
      {String id,
      List<String> ids,
      @required DateTime start,
      @required DateTime end}) async {
    return convert(
        await super.getByTime(id: id, ids: ids, start: start, end: end));
  }
}
