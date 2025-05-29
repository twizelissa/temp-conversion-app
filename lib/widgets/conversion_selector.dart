import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ConversionSelector extends StatelessWidget {
  final String selectedConversion;
  final ValueChanged<String> onConversionChanged;

  const ConversionSelector({
    super.key,
    required this.selectedConversion,
    required this.onConversionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Conversion Type',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: Text('${AppConstants.fahrenheitSymbol} to ${AppConstants.celsiusSymbol}'),
                    subtitle: const Text('Fahrenheit to Celsius'),
                    value: AppConstants.fahrenheitToCelsius,
                    groupValue: selectedConversion,
                    onChanged: (value) => onConversionChanged(value!),
                    activeColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text('${AppConstants.celsiusSymbol} to ${AppConstants.fahrenheitSymbol}'),
                    subtitle: const Text('Celsius to Fahrenheit'),
                    value: AppConstants.celsiusToFahrenheit,
                    groupValue: selectedConversion,
                    onChanged: (value) => onConversionChanged(value!),
                    activeColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}