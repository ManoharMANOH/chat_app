import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/theme/app_sizes.dart';
import 'package:chat_app/ui/widgets/gradient_container.dart';
import 'package:flutter/material.dart';

class GradientHeader extends StatelessWidget {
  final String descriptionText;

  const GradientHeader({super.key, required this.descriptionText});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return GradientContainer(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.md),
          child: isPortrait
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    chatAppRow(textTheme, colorScheme),
                    SizedBox(height: AppSizes.xl),
                    Text("Welcome Back", style: textTheme.headlineMedium),
                    SizedBox(height: AppSizes.sm),
                    Text(
                      descriptionText,
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.surface,
                      ),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppSizes.lg,
                  children: [
                    chatAppRow(textTheme, colorScheme),
                    Column(
                      children: [
                        Text("Welcome Back", style: textTheme.headlineMedium),
                        Text(
                          descriptionText,
                          style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.surface,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Row chatAppRow(TextTheme textTheme, ColorScheme colorScheme) {
    return Row(
      spacing: AppSizes.sm,
      children: [
        Container(
          padding: EdgeInsets.all(AppSizes.sm),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
          ),
          child: Icon(
            Icons.message,
            color: AppColors.gradientStart,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text("Messenger", style: textTheme.titleLarge),
      ],
    );
  }
}
