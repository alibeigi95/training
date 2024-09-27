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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Snackbar & Slider Example'),
      backgroundColor: Colors.tealAccent,
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildShowSnackbarButton(context),
          const SizedBox(height: 40),
          _buildSlider1(),
          const SizedBox(height: 20),
          _buildSlider2(),
          const SizedBox(height: 20),
          _buildSlider3(),
          const SizedBox(height: 20),
          _buildImage('https://images.squarespace-cdn.com/content/v1/5893534986e6c00851e56dbb/1491929659391-PGHT7ST8X9H83CDAGJ0I/Final+Sunset.jpg'),
          _buildNetworkImage(
            'https://images.squarespace-cdn.com/content/v1/5893534986e6c00851e56dbb/1491927893390-6R70GM6G9IT5A2S77CHF/image-asset.jpeg',
          ),
        ],
      ),
    );
  }

  Widget _buildShowSnackbarButton(BuildContext context) {
    return ElevatedButton(
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
    );
  }

  Widget _buildSlider1() {
    return _buildSlider(
      value: _sliderValue1,
      onChanged: (value) {
        setState(() {
          _sliderValue1 = value;
        });
      },
      label: 'Slider 1 Value: ${_sliderValue1.toStringAsFixed(1)}',
    );
  }

  Widget _buildSlider2() {
    return _buildSlider(
      value: _sliderValue2,
      onChanged: (value) {
        setState(() {
          _sliderValue2 = value;
        });
      },
      label: 'Slider 2 Value: ${_sliderValue2.toStringAsFixed(1)}',
      activeColor: Colors.orange,
      inactiveColor: Colors.blueGrey,
    );
  }

  Widget _buildSlider3() {
    return _buildSlider(
      value: _sliderValue3,
      onChanged: (value) {
        setState(() {
          _sliderValue3 = value;
        });
      },
      label: 'Slider 3 Value: ${_sliderValue3.toStringAsFixed(1)}',
      activeColor: Colors.green,
      inactiveColor: Colors.red,
    );
  }

  Widget _buildSlider({
    required double value,
    required ValueChanged<double> onChanged,
    required String label,
    Color? activeColor,
    Color? inactiveColor,
  }) {
    return Column(
      children: [
        Text(label),
        Slider(
          value: value,
          min: 0,
          max: 100,
          divisions: 10,
          label: value.toStringAsFixed(1),
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildImage(String url) {
    return Image.network(url);
  }

  Widget _buildNetworkImage(String url) {
    return Image.network(
      url,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          );
        }
      },
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Text('Failed to load image');
      },
    );
  }
}
