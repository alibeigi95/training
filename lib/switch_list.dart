import 'package:flutter/material.dart';

class SwitchListScreen extends StatefulWidget {
  const SwitchListScreen({super.key});

  @override
  _SwitchListScreenState createState() => _SwitchListScreenState();
}

class _SwitchListScreenState extends State<SwitchListScreen> {

  List<bool> switchValues = [false,false];


  void _addSwitch() {
    setState(() {
      switchValues.add(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch List with Add Button'),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: switchValues.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Switch ${index + 1}'),
                  trailing: Switch(
                    value: switchValues[index],
                    onChanged: (bool value) {
                      setState(() {
                        switchValues[index] = value;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _addSwitch,
              child: Text('Add Switch'),
            ),
          ),
        ],
      ),
    );
  }
}
