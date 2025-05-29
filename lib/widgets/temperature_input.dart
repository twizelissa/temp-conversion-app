import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/constants.dart';
import '../utils/validators.dart';

class TemperatureInput extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final String selectedConversion;

  const TemperatureInput({
    super.key,
    required this.controller,
    required this.formKey,
    required this.selectedConversion,
  });

  @override
  Widget build(BuildContext context) {
    final String unitSymbol =
        selectedConversion == AppConstants.fahrenheitToCelsius
            ? AppConstants.fahrenheitSymbol
            : AppConstants.celsiusSymbol;

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Temperature',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: controller,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
                ],
                validator: (value) => TemperatureValidator.validateTemperature(
                  value,
                  selectedConversion,
                ),
                decoration: InputDecoration(
                  labelText: 'Temperature ($unitSymbol)',
                  hintText: 'Enter temperature value',
                  suffixText: unitSymbol,
                  border: const OutlineInputBorder(),
                  prefixIcon: Icon(
                    selectedConversion == AppConstants.fahrenheitToCelsius
                        ? Icons.thermostat
                        : Icons.ac_unit,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
