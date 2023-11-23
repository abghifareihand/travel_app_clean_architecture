part of 'search_destination_bloc.dart';

abstract class SearchDestinationEvent extends Equatable {
  const SearchDestinationEvent();

  @override
  List<Object> get props => [];
}

class SearchDestination extends SearchDestinationEvent {
  final String query;
  const SearchDestination(this.query);

  @override
  List<Object> get props => [query];
}
