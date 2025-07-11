// Updated widgets/result_display.dart
// Replace the entire file with this:

import 'package:flutter/material.dart';
import '../model/conversion_history.dart';
import '../utils/constants.dart';

class ResultDisplay extends StatelessWidget {
  final ConversionHistory? conversionResult;
  final Animation<double> fadeAnimation;

  const ResultDisplay({
    super.key,
    required this.conversionResult,
    required this.fadeAnimation,
  });

  @override
  Widget build(BuildContext context) {
    if (conversionResult == null) return const SizedBox.shrink();

    final String fromSymbol = conversionResult!.fromUnit == 'Fahrenheit'
        ? AppConstants.fahrenheitSymbol
        : AppConstants.celsiusSymbol;
    final String toSymbol = conversionResult!.toUnit == 'Fahrenheit'
        ? AppConstants.fahrenheitSymbol
        : AppConstants.celsiusSymbol;

    return AnimatedBuilder(
      animation: fadeAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: 0.9 + (fadeAnimation.value * 0.1), // Subtle scale animation
          child: Opacity(
            opacity: 0.3 +
                (fadeAnimation.value * 0.7), // Start at 30% opacity, go to 100%
            child: Card(
              elevation: 4,
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 48,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Conversion Result',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${conversionResult!.inputValue.toStringAsFixed(1)}$fromSymbol = ${conversionResult!.outputValue.toStringAsFixed(2)}$toSymbol',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
