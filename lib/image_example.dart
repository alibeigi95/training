import 'package:flutter/material.dart';

class ImageExample extends StatefulWidget {
  const ImageExample({super.key});

  @override
  State<ImageExample> createState() => _ImageExampleState();
}

class _ImageExampleState extends State<ImageExample> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('images'),
          backgroundColor: Colors.tealAccent,
        ),
        body: _body(),
      );

  Column _body() => Column(
        children: [
          Image.asset('assets/images/1.jpg'),
          const Text(
            'this is text',
            style: TextStyle(
              fontFamily: 'WalgreensScript',
              fontSize: 24,
            ),
          ),
          const Text(
            'this is text number 2',
          ),
        ],
      );
}
