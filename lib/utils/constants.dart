class AppConstants {
  // Conversion types
  static const String fahrenheitToCelsius = 'F to C';
  static const String celsiusToFahrenheit = 'C to F';
  
  // Temperature symbols
  static const String fahrenheitSymbol = '°F';
  static const String celsiusSymbol = '°C';
  
  // History limits
  static const int maxHistoryItems = 10;
  
  // Animation durations
  static const Duration animationDuration = Duration(milliseconds: 300);
  
  // Validation messages
  static const String emptyFieldError = 'Please enter a temperature value';
  static const String invalidNumberError = 'Please enter a valid number';
  static const String absoluteZeroFahrenheitError = 
      'Temperature cannot be below absolute zero (-459.67°F)';
  static const String absoluteZeroCelsiusError = 
      'Temperature cannot be below absolute zero (-273.15°C)';
}