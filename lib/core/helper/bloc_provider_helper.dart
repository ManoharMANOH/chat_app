import 'package:chat_app/data/services/auth_service.dart';
import 'package:chat_app/ui/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviderHelper {
  static Widget getAllProvider({required Widget child}) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => AuthBloc(AuthService()))],
      child: child,
    );
  }
}
