import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/theme/app_sizes.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final double? containerHeight;
  final double borderRadius;

  const GradientContainer({
    super.key,
    required this.child,
    this.containerHeight,
    this.borderRadius = AppSizes.borderRadiusXXXl,
  });

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: containerHeight ?? (isPortrait ? height * 0.38 : height * 0.50),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.gradientStart, AppColors.gradientEnd],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      ),
      child: child,
    );
  }
}
