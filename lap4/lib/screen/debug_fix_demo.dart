import 'package:flutter/material.dart';

class DebugFixDemo extends StatefulWidget {
  const DebugFixDemo({super.key});

  @override
  State<DebugFixDemo> createState() =>
      _DebugFixDemoState();
}

class _DebugFixDemoState
    extends State<DebugFixDemo> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Debug Fix Demo"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [

              Text(
                "Counter: $counter",
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),

              ElevatedButton(
                onPressed: () {

                  // Fix state issue
                  setState(() {
                    counter++;
                  });

                },
                child: const Text(
                  "Increase",
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 300,

                child: ListView.builder(
                  itemCount: 20,

                  itemBuilder:
                      (context, index) {

                    return ListTile(
                      title: Text(
                        "Item ${index + 1}",
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {

                  DateTime? picked =
                  await showDatePicker(
                    context: context,
                    initialDate:
                    DateTime.now(),
                    firstDate:
                    DateTime(2020),
                    lastDate:
                    DateTime(2030),
                  );

                  if (picked != null) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Selected: ${picked.day}/${picked.month}/${picked.year}",
                        ),
                      ),
                    );
                  }
                },
                child: const Text(
                  "Open DatePicker",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}