part of 'top_destination_bloc.dart';

abstract class TopDestinationEvent extends Equatable {
  const TopDestinationEvent();

  @override
  List<Object> get props => [];
}

class GetTopDestination extends TopDestinationEvent {}