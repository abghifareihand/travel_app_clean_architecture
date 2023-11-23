import 'dart:convert';

import 'package:travel_app/api/urls.dart';
import 'package:travel_app/core/error/exceptions.dart';
import 'package:travel_app/features/destination/data/models/destination_model.dart';
import 'package:http/http.dart' as http;

abstract class DestinationRemoteDataSource {
  Future<List<DestinationModel>> all();
  Future<List<DestinationModel>> top();
  Future<List<DestinationModel>> search(String query);
}

class DestinationRemoteDataSourceImpl implements DestinationRemoteDataSource {
  final http.Client client;
  DestinationRemoteDataSourceImpl(this.client);

  @override
  Future<List<DestinationModel>> all() async {
    final response = await client
        .get(Uri.parse('${URLs.base}/destination/all.php'))
        .timeout(const Duration(seconds: 3));
    if (response.statusCode == 200) {
      List list = jsonDecode(response.body);
      return list.map((e) => DestinationModel.fromJson(e)).toList();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<DestinationModel>> search(String query) async {
    final response = await client.post(
      Uri.parse('${URLs.base}/destination/search.php'),
      body: {
        'query': query,
      },
    ).timeout(const Duration(seconds: 3));
    if (response.statusCode == 200) {
      List list = jsonDecode(response.body);
      return list.map((e) => DestinationModel.fromJson(e)).toList();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<DestinationModel>> top() async {
    final response = await client
        .get(Uri.parse('${URLs.base}/destination/top.php'))
        .timeout(const Duration(seconds: 3));
    if (response.statusCode == 200) {
      List list = jsonDecode(response.body);
      return list.map((e) => DestinationModel.fromJson(e)).toList();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }
}
