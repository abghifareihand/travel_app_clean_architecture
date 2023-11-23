part of 'all_destination_bloc.dart';

abstract class AllDestinationState extends Equatable {
  const AllDestinationState();

  @override
  List<Object> get props => [];
}

final class AllDestinationInitial extends AllDestinationState {}

final class AllDestinationLoading extends AllDestinationState {}

final class AllDestinationSuccess extends AllDestinationState {
  final List<DestinationEntity> data;
  const AllDestinationSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class AllDestinationError extends AllDestinationState {
  final String message;
  const AllDestinationError(this.message);

  @override
  List<Object> get props => [message];
}
