import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/core/error/exceptions.dart';
import 'package:travel_app/features/destination/data/models/destination_model.dart';

const destinationKey = 'all_destination';

abstract class DestinationLocalDataSource {
  Future<List<DestinationModel>> getAll();
  Future<bool> saveAll(List<DestinationModel> list);
}

class DestinationLocalDataSourceImpl implements DestinationLocalDataSource {
  final SharedPreferences pref;
  DestinationLocalDataSourceImpl(this.pref);

  @override
  Future<bool> saveAll(List<DestinationModel> list) async {
    List<Map<String, dynamic>> listMap = list.map((e) => e.toJson()).toList();
    String allDestination = jsonEncode(listMap);
    return pref.setString(destinationKey, allDestination);
  }

  @override
  Future<List<DestinationModel>> getAll() async {
    String? allDestination = pref.getString(destinationKey);
    if (allDestination != null) {
      List<Map<String, dynamic>> listMap =
          List<Map<String, dynamic>>.from(jsonDecode(allDestination));
      return listMap.map((e) => DestinationModel.fromJson(e)).toList();
    }
    throw CachedException();
  }
}
