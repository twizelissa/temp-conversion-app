# Temperature Converter

![Temperature Converter App](/Assests/img1.png)
![Temperature Converter App](/Assests/img2.png)
![Temperature Converter App](/Assests/img3.png)
![Temperature Converter App](/Assests/img4.png)
A Flutter app for converting temperatures between Fahrenheit and Celsius.

## Features

- Convert between °F and °C
- Input validation and error handling
- Conversion history tracking
- Responsive design (portrait/landscape)
- Results displayed to 2 decimal places

## Installation

```bash
flutter pub get
flutter run
```

## Project Structure

```
lib/
├── main.dart
├── models/conversion_history.dart
├── services/temperature_service.dart
├── widgets/
│   ├── conversion_selector.dart
│   ├── temperature_input.dart
│   ├── action_buttons.dart
│   ├── result_display.dart
│   └── history_section.dart
├── screens/temperature_converter_screen.dart
└── utils/
    ├── constants.dart
    └── validators.dart
```

## Conversion Formulas

- **F to C**: `°C = (°F - 32) × 5/9`
- **C to F**: `°F = °C × 9/5 + 32`

## Requirements Met

- ✅ Bidirectional temperature conversion
- ✅ User input with validation
- ✅ Convert button functionality
- ✅ 2 decimal place precision
- ✅ Conversion history display
- ✅ Portrait/landscape support

## Usage

1. Select conversion type (F to C or C to F)
2. Enter temperature value
3. Press Convert button
4. View result and history

## Author

**Elissa Twizeyimana** - Mobile Development Assignment 1