part of 'all_destination_bloc.dart';

abstract class AllDestinationEvent extends Equatable {
  const AllDestinationEvent();

  @override
  List<Object> get props => [];
}

class GetAllDestination extends AllDestinationEvent {}