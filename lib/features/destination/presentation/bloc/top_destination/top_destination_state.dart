part of 'top_destination_bloc.dart';

abstract class TopDestinationState extends Equatable {
  const TopDestinationState();

  @override
  List<Object> get props => [];
}

final class TopDestinationInitial extends TopDestinationState {}

final class TopDestinationLoading extends TopDestinationState {}

final class TopDestinationSuccess extends TopDestinationState {
  final List<DestinationEntity> data;
  const TopDestinationSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class TopDestinationError extends TopDestinationState {
  final String message;
  const TopDestinationError(this.message);

  @override
  List<Object> get props => [message];
}
