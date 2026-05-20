import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppUtils {
  AppUtils._();

  static Future<void> showAlertDialog({
    required String title,
    required String message,
    IconData? icon,
    Color? iconColor,
    Color? button1Color,
    String? buttonText1,
    String? buttonText2,
    void Function()? buttonAction,
    required BuildContext context,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: icon != null
              ? CircleAvatar(
                  backgroundColor: iconColor?.withValues(alpha: 0.2),
                  child: Icon(icon, color: iconColor),
                )
              : null,
          title: Text(title, textAlign: TextAlign.center),
          content: Text(message, textAlign: TextAlign.center),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                buttonText2 ?? "Cancel",
                style: textTheme.titleSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                context.pop();
                buttonAction?.call();
              },
              child: Text(
                buttonText1 ?? "Ok",
                style: textTheme.titleSmall?.copyWith(
                  color: button1Color ?? colorScheme.primary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<bool> isInternetAvailable() async {
    final result = await Connectivity().checkConnectivity();
    return result.contains(ConnectivityResult.ethernet) ||
        result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile);
  }
}
