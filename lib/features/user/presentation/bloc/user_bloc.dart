import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/user/domain/entities/user_entity.dart';
import 'package:fitness_app/features/user/domain/usecases/get_user_usecase.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUsecase usecase;

  UserBloc({required this.usecase}) : super(UserInitial()) {
    on<FetchUsers>(_fetchUser);
  }

  Future<void> _fetchUser(FetchUsers event, Emitter<UserState> emit) async {
    emit(UserLoading());
    final result = await usecase(event.userId);
    result.fold(
      (fauiler) => emit(UserError(error: fauiler.message)),
      (user) => emit(UserSuccess(user: user)),
    );
  }
}
