import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:travel_app/core/error/exceptions.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/core/platform/network_info.dart';
import 'package:travel_app/features/destination/data/datasources/destination_local_data_source.dart';
import 'package:travel_app/features/destination/data/datasources/destination_remote_data_source.dart';
import 'package:travel_app/features/destination/domain/entities/destination_entity.dart';
import 'package:travel_app/features/destination/domain/repositories/destination_repository.dart';

class DestinationRepositoryImpl implements DestinationRepository {
  final NetworkInfo networkInfo;
  final DestinationLocalDataSource localDataSource;
  final DestinationRemoteDataSource remoteDataSource;

  DestinationRepositoryImpl({
    required this.networkInfo,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<DestinationEntity>>> all() async {
    bool online = await networkInfo.isConected();
    if (online) {
      try {
        final result = await remoteDataSource.all();
        await localDataSource.saveAll(result);
        return Right(result.map((e) => e.toEntity()).toList());
      } on TimeoutException {
        return const Left(TimeOutFailure('Timeout. No Response'));
      } on NotFoundException {
        return const Left(NotFoundFailure('Data Not Found'));
      } on ServerException {
        return const Left(ServerFailure('Server Error'));
      }
    } else {
      try {
        final result = await localDataSource.getAll();
        return Right(result.map((e) => e.toEntity()).toList());
      } on CachedException {
        return const Left(CachedFailure('Data is not present'));
      }
    }
  }

  @override
  Future<Either<Failure, List<DestinationEntity>>> search(String query) async {
    try {
      final result = await remoteDataSource.search(query);
      return Right(result.map((e) => e.toEntity()).toList());
    } on TimeoutException {
      return const Left(TimeOutFailure('Timeout. No Response'));
    } on NotFoundException {
      return const Left(NotFoundFailure('Data Not Found'));
    } on ServerException {
      return const Left(ServerFailure('Server Error'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<DestinationEntity>>> top() async {
    try {
      final result = await remoteDataSource.top();
      return Right(result.map((e) => e.toEntity()).toList());
    } on TimeoutException {
      return const Left(TimeOutFailure('Timeout. No Response'));
    } on NotFoundException {
      return const Left(NotFoundFailure('Data Not Found'));
    } on ServerException {
      return const Left(ServerFailure('Server Error'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed connect to the network'));
    }
  }
}
