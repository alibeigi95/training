import 'package:flutter/material.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('switch example'),
          backgroundColor: Colors.tealAccent,
        ),
        body: _body(),
      );

  Widget _body() => Column(
        children: [
          Switch(
            value: switchValue,
            onChanged: (value) {
              setState(() {
                switchValue = value;
              });
            },
          ),
          ElevatedButton(
            onPressed: switchValue ? null : () {},
            child: const Text('press to add new item'),
          )
        ],
      );
}
