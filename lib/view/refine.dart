import 'package:flutter/material.dart';

class Option {
  final String text;
  final int index;

  Option({required this.text, required this.index});
}

class RefineScreen extends StatefulWidget {
  RefineScreen({Key? key}) : super(key: key);

  @override
  _RefineScreenState createState() => _RefineScreenState();
}

class _RefineScreenState extends State<RefineScreen> {
  Option? selectedOption;

  final List<Option> options = [
    Option(text: 'Option 1', index: 0),
    Option(text: 'Option 2', index: 1),
    Option(text: 'Option 3', index: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Select Your Availability',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 4),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonFormField<Option>(
                    value: selectedOption,
                    items: options.map((option) {
                      return DropdownMenuItem<Option>(
                        value: option,
                        child: Text(option.text),
                      );
                    }).toList(),
                    onChanged: (Option? value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if (selectedOption != null)
                  Positioned(
                    top: 45,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        selectedOption!.text,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Additional information:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'This is some additional information about the selected option.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('Slider Value:'),
            Slider(
              value: 0.5,
              onChanged: (value) {
                // Handle slider value change
              },
            ),
          ],
        ),
      ),
    );
  }
}
