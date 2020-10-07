import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lorapark_app/config/urls.dart';
import 'package:lorapark_app/data/models/sensors.dart' show StructureDamageData;
import 'package:lorapark_app/services/services.dart' show DioService;

abstract class StructureDamageRepository {
  Future<List<StructureDamageData>> getStructureDamage({String id});

  Future<List<StructureDamageData>> getStructureDamageByTime(
      {String id, DateTime start, DateTime end});
}

class StructureDamageRepositoryImpl implements StructureDamageRepository {
  @override
  Future<List<StructureDamageData>> getStructureDamage({String id}) async {
    try {
      Response response = await GetIt.I
          .get<DioService>()
          .dio
          .get('${Endpoints.STRUCTURE_DAMAGE}?id=$id');

      if (response.statusCode == 200) {
        Iterable it = response.data;
        return it.map((e) => StructureDamageData.fromJson(e)).toList();
      }
    } on DioError catch (e) {}
  }

  @override
  Future<List<StructureDamageData>> getStructureDamageByTime(
      {String id, DateTime start, DateTime end}) async {
    try {
      Response response = await GetIt.I.get<DioService>().dio.get(
          '${Endpoints.STRUCTURE_DAMAGE}?id=$id&start=${start.toUtc().toIso8601String()}&end=${end.toUtc().toIso8601String()}');

      if (response.statusCode == 200) {
        Iterable it = response.data;
        return it.map((e) => StructureDamageData.fromJson(e)).toList();
      }
    } on DioError catch (e) {}
  }
}
