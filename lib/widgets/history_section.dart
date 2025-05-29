import 'package:flutter/material.dart';
import '../model/conversion_history.dart';
import '../utils/validators.dart';

class HistorySection extends StatelessWidget {
  final List<ConversionHistory> history;
  final VoidCallback onClearHistory;

  const HistorySection({
    super.key,
    required this.history,
    required this.onClearHistory,
  });

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) return const SizedBox.shrink();

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Conversion History',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextButton.icon(
                  onPressed: onClearHistory,
                  icon: const Icon(Icons.delete_outline, size: 18),
                  label: const Text('Clear'),
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.error,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: history.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final historyItem = history[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                  title: Text(
                    historyItem.displayText,
                    style: const TextStyle(fontFamily: 'monospace'),
                  ),
                  subtitle: Text(
                    TemperatureValidator.formatTimestamp(historyItem.timestamp),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
