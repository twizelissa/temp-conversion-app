import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onConvert;
  final VoidCallback onClear;

  const ActionButtons({
    super.key,
    required this.onConvert,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ElevatedButton.icon(
              onPressed: onConvert,
              icon: const Icon(Icons.calculate),
              label: const Text('Convert'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: onClear,
              icon: const Icon(Icons.clear),
              label: const Text('Clear'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
