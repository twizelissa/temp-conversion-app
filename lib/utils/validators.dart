import 'constants.dart';
import '../services/temperature_service.dart';

class TemperatureValidator {
  /// Validates temperature input field
  static String? validateTemperature(String? value, String conversionType) {
    if (value == null || value.isEmpty) {
      return AppConstants.emptyFieldError;
    }
    
    final double? temp = double.tryParse(value);
    if (temp == null) {
      return AppConstants.invalidNumberError;
    }
    
    // Check for absolute zero violations
    if (!TemperatureService.isValidTemperature(temp, conversionType)) {
      return conversionType == 'F to C' 
          ? AppConstants.absoluteZeroFahrenheitError
          : AppConstants.absoluteZeroCelsiusError;
    }
    
    return null;
  }

  /// Formats timestamp for display
  static String formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    
    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }
}