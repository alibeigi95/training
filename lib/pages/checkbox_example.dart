import 'package:flutter/material.dart';

class CheckBoxExample extends StatefulWidget {
  const CheckBoxExample({super.key});

  @override
  State<CheckBoxExample> createState() => _CheckBoxExampleState();
}

class _CheckBoxExampleState extends State<CheckBoxExample> {
  bool checkBox = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('checkbox example'),
          backgroundColor: Colors.tealAccent,
        ),
        body: _body(),
      );

  Widget _body() => Center(
        child: Column(
          children: [
            CheckboxListTile(
              title: const Text('number one options'),
              subtitle: const Text('number one subtitle'),
              value: checkBox,
              onChanged: (value) {
                setState(() {
                  checkBox = value!;
                });
              },
            ),
            Row(
              children: [
                const Text('remmember me : '),
                Checkbox(
                  value: checkBox,
                  onChanged: (value) {
                    setState(() {
                      checkBox = value!;
                    });
                  },
                  activeColor: Colors.red,
                  checkColor: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      );
}
