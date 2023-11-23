
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/features/destination/domain/entities/destination_entity.dart';
import 'package:travel_app/features/destination/domain/usecases/search_destination_usecase.dart';

part 'search_destination_event.dart';
part 'search_destination_state.dart';

class SearchDestinationBloc extends Bloc<SearchDestinationEvent, SearchDestinationState> {
  final SearchDestinationUseCase useCase;
  SearchDestinationBloc(this.useCase) : super(SearchDestinationInitial()) {
    on<SearchDestination>((event, emit) async {
      emit(SearchDestinationLoading());
      final result = await useCase.call(event.query);
      result.fold(
        (error) => emit(SearchDestinationError(error.message)),
        (success) => emit(SearchDestinationSuccess(success)),
      );
    });
  }
}
