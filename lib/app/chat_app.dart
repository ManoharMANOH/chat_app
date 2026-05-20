import 'package:chat_app/app/router/route_config.dart';
import 'package:chat_app/core/helper/bloc_provider_helper.dart';
import 'package:chat_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProviderHelper.getAllProvider(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: RouteConfig.router,
      ),
    );
  }
}
