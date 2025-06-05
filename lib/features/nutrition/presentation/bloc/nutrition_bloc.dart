import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nutrition_event.dart';
part 'nutrition_state.dart';

class NutritionBloc extends Bloc<NutritionEvent, NutritionState> {
  NutritionBloc() : super(NutritionInitial()) {
    on<NutritionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
