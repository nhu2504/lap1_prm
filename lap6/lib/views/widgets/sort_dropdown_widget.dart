import 'package:flutter/material.dart';

class SortDropdownWidget extends StatelessWidget {
  final String value;
  final Function(String?) onChanged;

  const SortDropdownWidget({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      items: const [
        DropdownMenuItem(
          value: 'A-Z',
          child: Text('A-Z'),
        ),
        DropdownMenuItem(
          value: 'Z-A',
          child: Text('Z-A'),
        ),
        DropdownMenuItem(
          value: 'Year',
          child: Text('Year'),
        ),
        DropdownMenuItem(
          value: 'Rating',
          child: Text('Rating'),
        ),
      ],
      onChanged: onChanged,
    );
  }
}