import 'package:dartz/dartz.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/features/destination/domain/entities/destination_entity.dart';

abstract class DestinationRepository {
  Future<Either<Failure, List<DestinationEntity>>> all();
  Future<Either<Failure, List<DestinationEntity>>> top();
  Future<Either<Failure, List<DestinationEntity>>> search(String query);
}
