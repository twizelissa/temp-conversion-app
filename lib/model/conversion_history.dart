class ConversionHistory {
  final String fromUnit;
  final String toUnit;
  final double inputValue;
  final double outputValue;
  final DateTime timestamp;

  ConversionHistory({
    required this.fromUnit,
    required this.toUnit,
    required this.inputValue,
    required this.outputValue,
    required this.timestamp,
  });

  /// Formats the history entry for display
  String get displayText {
    return '${fromUnit[0]} to ${toUnit[0]}: ${inputValue.toStringAsFixed(1)} => ${outputValue.toStringAsFixed(1)}';
  }

  /// Creates a copy of this history item with updated values
  ConversionHistory copyWith({
    String? fromUnit,
    String? toUnit,
    double? inputValue,
    double? outputValue,
    DateTime? timestamp,
  }) {
    return ConversionHistory(
      fromUnit: fromUnit ?? this.fromUnit,
      toUnit: toUnit ?? this.toUnit,
      inputValue: inputValue ?? this.inputValue,
      outputValue: outputValue ?? this.outputValue,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  /// Converts to JSON for potential future storage
  Map<String, dynamic> toJson() {
    return {
      'fromUnit': fromUnit,
      'toUnit': toUnit,
      'inputValue': inputValue,
      'outputValue': outputValue,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  /// Creates from JSON for potential future storage
  factory ConversionHistory.fromJson(Map<String, dynamic> json) {
    return ConversionHistory(
      fromUnit: json['fromUnit'],
      toUnit: json['toUnit'],
      inputValue: json['inputValue'].toDouble(),
      outputValue: json['outputValue'].toDouble(),
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}