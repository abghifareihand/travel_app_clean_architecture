import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/features/destination/domain/entities/destination_entity.dart';
import 'package:travel_app/features/destination/domain/usecases/get_top_destination_usecase.dart';

part 'top_destination_event.dart';
part 'top_destination_state.dart';

class TopDestinationBloc
    extends Bloc<TopDestinationEvent, TopDestinationState> {
  final GetTopDestinationUseCase useCase;
  TopDestinationBloc(this.useCase) : super(TopDestinationInitial()) {
    on<GetTopDestination>((event, emit) async {
      emit(TopDestinationLoading());
      final result = await useCase.call();
      result.fold(
        (error) => emit(TopDestinationError(error.message)),
        (success) => emit(TopDestinationSuccess(success)),
      );
    });
  }
}
