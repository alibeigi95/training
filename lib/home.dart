import 'package:flutter/material.dart';

class ExampleCheckBox extends StatefulWidget {
  const ExampleCheckBox({super.key});

  @override
  State<ExampleCheckBox> createState() => _ExampleCheckBoxState();
}

class _ExampleCheckBoxState extends State<ExampleCheckBox> {
  bool checkBox = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('check box'),
          backgroundColor: Colors.tealAccent,
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Text('remmember me : '),
                  Checkbox(
                    value: checkBox,
                    onChanged: (value) {
                      setState(() {
                        checkBox = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
