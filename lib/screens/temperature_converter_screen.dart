import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/conversion_history.dart';
import '../services/temperature_service.dart';
import '../utils/constants.dart';
import '../widgets/conversion_selector.dart';
import '../widgets/temperature_input.dart';
import '../widgets/action_buttons.dart';
import '../widgets/result_display.dart';
import '../widgets/history_section.dart';

class TemperatureConverterScreen extends StatefulWidget {
  const TemperatureConverterScreen({super.key});

  @override
  State<TemperatureConverterScreen> createState() =>
      _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState extends State<TemperatureConverterScreen>
    with SingleTickerProviderStateMixin {
  // Controllers and form validation
  final TextEditingController _temperatureController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // State variables
  String _selectedConversion = AppConstants.fahrenheitToCelsius;
  ConversionHistory? _currentResult;
  List<ConversionHistory> _history = [];

  // Animation controller
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  @override
  void dispose() {
    _temperatureController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  /// Initialize animations for smooth UI transitions
  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: AppConstants.animationDuration,
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  /// Handles conversion type change
  void _onConversionChanged(String newConversion) {
    setState(() {
      _selectedConversion = newConversion;
      _currentResult = null; // Clear previous result when conversion changes
    });
  }

  /// Performs the temperature conversion
  void _convertTemperature() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final double inputTemp = double.parse(_temperatureController.text);

    // Use the service to perform conversion
    final conversionResult = TemperatureService.convertTemperature(
      inputTemperature: inputTemp,
      conversionType: _selectedConversion,
    );

    setState(() {
      _currentResult = conversionResult;
      _history.insert(0, conversionResult);

      // Limit history to maximum items for performance
      if (_history.length > AppConstants.maxHistoryItems) {
        _history = _history.take(AppConstants.maxHistoryItems).toList();
      }
    });

    // Trigger animation for result display
    _animationController.forward().then((_) {
      _animationController.reset();
    });

    // Provide haptic feedback
    HapticFeedback.lightImpact();
  }

  /// Clears input and current result
  void _clearInput() {
    setState(() {
      _temperatureController.clear();
      _currentResult = null;
    });
    _animationController.reset();
  }

  /// Clears conversion history
  void _clearHistory() {
    setState(() {
      _history.clear();
    });
  }

  /// Builds the app description card
  Widget _buildAppDescription() {
    return Card(
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              Icons.info_outline,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Convert temperatures between Fahrenheit and Celsius with precision to 2 decimal places.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // App description
                  _buildAppDescription(),
                  const SizedBox(height: 16),

                  // Conversion type selector
                  ConversionSelector(
                    selectedConversion: _selectedConversion,
                    onConversionChanged: _onConversionChanged,
                  ),
                  const SizedBox(height: 16),

                  // Temperature input
                  TemperatureInput(
                    controller: _temperatureController,
                    formKey: _formKey,
                    selectedConversion: _selectedConversion,
                  ),

                  // Action buttons
                  ActionButtons(
                    onConvert: _convertTemperature,
                    onClear: _clearInput,
                  ),

                  // Result display
                  ResultDisplay(
                    conversionResult: _currentResult,
                    fadeAnimation: _fadeAnimation,
                  ),
                  const SizedBox(height: 16),

                  // History section
                  HistorySection(
                    history: _history,
                    onClearHistory: _clearHistory,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
