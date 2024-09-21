import 'package:flutter/material.dart';

class SnackbarExample extends StatefulWidget {
  const SnackbarExample({super.key});

  @override
  State<SnackbarExample> createState() => _SnackbarExampleState();
}

class _SnackbarExampleState extends State<SnackbarExample> {
  double _sliderValue1 = 20;
  double _sliderValue2 = 50;
  double _sliderValue3 = 75;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Snackbar & Slider Example'),
          backgroundColor: Colors.tealAccent,
        ),
        body: _body(context),
      );

  Widget _body(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('This is a Snackbar!'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // Code to execute on 'Undo' press
                      },
                    ),
                  ),
                );
              },
              child: const Text('Show Snackbar'),
            ),
            const SizedBox(height: 40),
            // Slider 1 with default colors
            Text('Slider 1 Value: ${_sliderValue1.toStringAsFixed(1)}'),
            Slider(
              value: _sliderValue1,
              min: 0,
              max: 100,
              divisions: 100,
              label: _sliderValue1.toStringAsFixed(1),
              onChanged: (double value) {
                setState(() {
                  _sliderValue1 = value;
                });
              },
            ),
            const SizedBox(height: 20),

            Text('Slider 2 Value: ${_sliderValue2.toStringAsFixed(1)}'),
            Slider(
              value: _sliderValue2,
              min: 0,
              max: 100,
              divisions: 10,
              label: _sliderValue2.toStringAsFixed(1),
              activeColor: Colors.orange,
              inactiveColor: Colors.blueGrey,
              onChanged: (double value) {
                setState(() {
                  _sliderValue2 = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Text('Slider 3 Value: ${_sliderValue3.toStringAsFixed(1)}'),
            Slider(
              value: _sliderValue3,
              min: 0,
              max: 100,
              divisions: 10,
              label: _sliderValue3.toStringAsFixed(1),
              activeColor: Colors.green,
              // Custom active color
              inactiveColor: Colors.red,
              // Custom inactive color
              onChanged: (double value) {
                setState(() {
                  _sliderValue3 = value;
                });
              },
            ),
            const SizedBox(height: 20),
            // Sample image
            Image.network(
                'https://images.squarespace-cdn.com/content/v1/5893534986e6c00851e56dbb/1491929659391-PGHT7ST8X9H83CDAGJ0I/Final+Sunset.jpg'),
            Image.network(
              'https://images.squarespace-cdn.com/content/v1/5893534986e6c00851e56dbb/1491927893390-6R70GM6G9IT5A2S77CHF/image-asset.jpeg',
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Text('Failed to load image');
              },
            ),
          ],
        ),
      );
}
