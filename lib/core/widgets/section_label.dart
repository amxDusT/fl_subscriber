import 'package:flutter/material.dart';

class SectionLabel extends StatelessWidget {
  const SectionLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        label.toUpperCase(),
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
