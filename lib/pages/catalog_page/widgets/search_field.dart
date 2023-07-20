import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'ПОИСК',
          hintStyle: textTheme.bodyMedium
              ?.copyWith(color: colorTheme.onBackground),
          prefixIcon: const Icon(Icons.search),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: colorTheme.primary,
            ),
            borderRadius: BorderRadius.zero,
          ),
          filled: true,
          fillColor: colorTheme.onSecondary,
        ),
      ),
    );
  }
}
