import 'package:app_tracker/domain/usecases/check_auth_status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/login_usecase.dart';
import '../../../domain/usecases/register_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final CheckAuthStatus checkAuthStatus;

  AuthBloc(
      {required this.registerUseCase,
      required this.loginUseCase,
      required this.checkAuthStatus})
      : super(AuthInitial()) {
    on<AuthRegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await registerUseCase(event.email, event.password);
        user.fold(
          (failure) => emit(AuthFailure(failure.message)), // Error Case
          (user) => emit(AuthRegisterSuccess(user)), // Success Case
        );
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await loginUseCase(event.email, event.password);
        user.fold(
          (failure) => emit(AuthFailure(failure.message)), // Error Case
          (user) => emit(AuthSuccess(user)), // Success Case
        );
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
    on<CheckAuthEvent>((event, emit) async {
      final result = await checkAuthStatus();
      result.fold(
        (failure) => emit(AuthFailure("Session expired")),
        (user) {
          emit(AuthSuccess(user));
        },
      );
    });
  }
}
