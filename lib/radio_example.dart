import 'package:flutter/material.dart';

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  List<String> radioOptions = ['number one', 'number two'];
  String? selectedValue;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('radio example'),
          backgroundColor: Colors.tealAccent,
        ),
        body: _body(),
      );

  Widget _body() => Center(
        child: Column(
          children: [
            Radio<String>(
              value: radioOptions[0],
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ),
            Radio<String>(
              value: radioOptions[1],
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ),
            RadioListTile<String>(
              value: radioOptions[0],
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ),
            RadioListTile<String>(
              value: radioOptions[1],
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ),
          ],
        ),
      );
}
