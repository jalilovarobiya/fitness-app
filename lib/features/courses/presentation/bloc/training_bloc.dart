import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'training_event.dart';
part 'training_state.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  TrainingBloc() : super(TrainingInitial()) {
    on<TrainingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
