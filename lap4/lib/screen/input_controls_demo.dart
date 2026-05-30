import 'package:flutter/material.dart';

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() =>
      _InputControlsDemoState();
}

class _InputControlsDemoState
    extends State<InputControlsDemo> {

  double volume = 50;

  bool notification = false;

  String gender = "Male";

  DateTime? selectedDate;

  Future<void> pickDate() async {

    DateTime? picked =
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Widgets"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Text(
              "Slider: ${volume.toStringAsFixed(0)}",
            ),

            Slider(
              value: volume,
              min: 0,
              max: 100,
              onChanged: (value) {
                setState(() {
                  volume = value;
                });
              },
            ),

            SwitchListTile(
              title: const Text("Notification"),
              value: notification,
              onChanged: (value) {
                setState(() {
                  notification = value;
                });
              },
            ),

            RadioListTile(
              title: const Text("Male"),
              value: "Male",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            RadioListTile(
              title: const Text("Female"),
              value: "Female",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            ElevatedButton(
              onPressed: pickDate,
              child: const Text("Select Date"),
            ),

            const SizedBox(height: 10),

            Text(
              selectedDate == null
                  ? "No Date Selected"
                  : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
            ),
          ],
        ),
      ),
    );
  }
}