import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../config/constants.dart';

/// Widget d'indicateur de chargement personnalisé
class LoadingIndicator extends StatelessWidget {
  final String? message;
  final bool isFullScreen;
  final Color? color;

  const LoadingIndicator({
    super.key,
    this.message,
    this.isFullScreen = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(
          color: color ?? AppColors.cyan,
        ),
        if (message != null) ...[
          const SizedBox(height: AppConstants.spacingMd),
          Text(
            message!,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );

    if (isFullScreen) {
      return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(child: content),
      );
    }

    return Center(child: content);
  }
}

/// Widget de shimmer pour effet de chargement
class ShimmerLoading extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const ShimmerLoading({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: borderRadius ?? BorderRadius.circular(AppConstants.radiusSm),
      ),
    );
  }
}
