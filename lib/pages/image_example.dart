import 'package:flutter/material.dart';

class ImageGridExample extends StatelessWidget {
  const ImageGridExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildGrid(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Image Grid'),
      backgroundColor: Colors.tealAccent,
    );
  }

  Widget _buildGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = _determineCrossAxisCount(constraints.maxWidth);

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.8, // Adjust as needed
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              return _buildGridItem(index);
            },
          );
        },
      ),
    );
  }

  int _determineCrossAxisCount(double width) {
    if (width >= 900) {
      return 3; // Desktop
    } else if (width >= 600) {
      return 2; // Tablet
    }
    return 1; // Default for mobile
  }

  Widget _buildGridItem(int index) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              'assets/images/${index + 1}.jpg', // Ensure assets exist
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            flex: 1,
            child: Text(
              'Item ${index + 1}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
