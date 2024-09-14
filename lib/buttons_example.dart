import 'package:flutter/material.dart';

class ButtonsExample extends StatefulWidget {
  const ButtonsExample({super.key});

  @override
  State<ButtonsExample> createState() => _ButtonsExampleState();
}

class _ButtonsExampleState extends State<ButtonsExample> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('buttons'),
          backgroundColor: Colors.tealAccent,
        ),
        body: _body(),
      );

  Widget _body() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                  style: ButtonStyle(),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('add new item'),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: SizedBox(
                      height: 100,
                      width: 150,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Test',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Sign up'),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.unarchive))
          ],
        ),
      );
}
