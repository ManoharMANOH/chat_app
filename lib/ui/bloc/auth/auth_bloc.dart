import 'package:chat_app/data/services/auth_service.dart';
import 'package:chat_app/ui/bloc/auth/auth_event.dart';
import 'package:chat_app/ui/bloc/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc(this.authService) : super(AuthInitial()) {
    on<AuthSigninRequested>(_onSignIn);
    on<AuthSignupRequested>(_onSignUp);
    on<AuthLogoutRequested>(_onSignOut);
  }

  Future<void> _onSignIn(
    AuthSigninRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final response = await authService.signIn(
        email: event.email,
        password: event.password,
      );
      if (response != null) {
        emit(
          AuthAuthenticated(
            AuthUser(email: response.email ?? "", password: event.password),
          ),
        );
      } else {
        emit(const AuthError("Login failed"));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onSignUp(
    AuthSignupRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final response = await authService.signUp(
        email: event.email,
        password: event.password,
      );
      if (response != null) {
        emit(
          AuthAuthenticated(
            AuthUser(email: response.email ?? '', password: event.password),
          ),
        );
      } else {
        emit(const AuthError("Signup failed"));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onSignOut(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await authService.signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
