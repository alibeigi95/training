import 'package:flutter/material.dart';

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  final List<String> radioOptions = ['number one', 'number two'];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Radio Example'),
      backgroundColor: Colors.tealAccent,
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centering the column vertically
        children: [
          _buildRadio(radioOptions[0]),
          _buildRadio(radioOptions[1]),
          _buildRadioListTile(radioOptions[0]),
          _buildRadioListTile(radioOptions[1]),
        ],
      ),
    );
  }

  Widget _buildRadio(String value) {
    return Radio<String>(
      value: value,
      groupValue: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
      },
    );
  }

  Widget _buildRadioListTile(String value) {
    return RadioListTile<String>(
      value: value,
      groupValue: selectedValue,
      title: Text(value), // Adding a title for better accessibility
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
      },
    );
  }
}
