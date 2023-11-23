part of 'search_destination_bloc.dart';

abstract class SearchDestinationState extends Equatable {
  const SearchDestinationState();
  
  @override
  List<Object> get props => [];
}

final class SearchDestinationInitial extends SearchDestinationState {}

final class SearchDestinationLoading extends SearchDestinationState {}

final class SearchDestinationSuccess extends SearchDestinationState {
  final List<DestinationEntity> data;
  const SearchDestinationSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class SearchDestinationError extends SearchDestinationState {
  final String message;
  const SearchDestinationError(this.message);

  @override
  List<Object> get props => [message];
}
