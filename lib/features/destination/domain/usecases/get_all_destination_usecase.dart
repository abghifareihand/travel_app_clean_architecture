import 'package:dartz/dartz.dart';
import 'package:travel_app/core/error/failures.dart';
import 'package:travel_app/features/destination/domain/entities/destination_entity.dart';
import 'package:travel_app/features/destination/domain/repositories/destination_repository.dart';

class GetAllDestinationUseCase {
  final DestinationRepository repository;
  GetAllDestinationUseCase(this.repository);

  Future<Either<Failure, List<DestinationEntity>>> call() {
    return repository.all();
  }
}
