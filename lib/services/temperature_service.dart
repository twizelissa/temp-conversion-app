import '../model/conversion_history.dart';

class TemperatureService {
  /// Converts Fahrenheit to Celsius using the formula: °C = (°F - 32) × 5/9
  static double fahrenheitToCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }

  /// Converts Celsius to Fahrenheit using the formula: °F = °C × 9/5 + 32
  static double celsiusToFahrenheit(double celsius) {
    return celsius * 9 / 5 + 32;
  }

  /// Performs temperature conversion based on selected type
  static ConversionHistory convertTemperature({
    required double inputTemperature,
    required String conversionType,
  }) {
    double result;
    String fromUnit, toUnit;

    if (conversionType == 'F to C') {
      result = fahrenheitToCelsius(inputTemperature);
      fromUnit = 'Fahrenheit';
      toUnit = 'Celsius';
    } else {
      result = celsiusToFahrenheit(inputTemperature);
      fromUnit = 'Celsius';
      toUnit = 'Fahrenheit';
    }

    return ConversionHistory(
      fromUnit: fromUnit,
      toUnit: toUnit,
      inputValue: inputTemperature,
      outputValue: result,
      timestamp: DateTime.now(),
    );
  }

  /// Validates if temperature is above absolute zero
  static bool isValidTemperature(double temperature, String conversionType) {
    if (conversionType == 'F to C' && temperature < -459.67) {
      return false; // Below absolute zero in Fahrenheit
    } else if (conversionType == 'C to F' && temperature < -273.15) {
      return false; // Below absolute zero in Celsius
    }
    return true;
  }
}