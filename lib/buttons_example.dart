import 'package:flutter/material.dart';

class ButtonsExample extends StatefulWidget {
  const ButtonsExample({super.key});

  @override
  State<ButtonsExample> createState() => _ButtonsExampleState();
}

class _ButtonsExampleState extends State<ButtonsExample> {
  bool _isExpanded = false;
  String? dropdownMenuItemSelected;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('buttons'),
          backgroundColor: Colors.tealAccent,
        ),
        body: _body(),
        floatingActionButton: FloatingActionButton(
          onPressed: _showDialog,
          child: const Icon(Icons.add),
        ),
        /*Stack(
          children: <Widget>[
            if (_isExpanded) ...[
              Positioned(
                bottom: 160,
                right: 20,
                child: FloatingActionButton(
                  onPressed: _showDialog2,
                  child: const Icon(Icons.edit),
                ),
              ),
              Positioned(
                bottom: 90,
                right: 20,
                child: FloatingActionButton(
                  onPressed: _showDialog3,
                  child: const Icon(Icons.share),
                ),
              ),
              Positioned(
                bottom: 230,
                right: 20,
                child: FloatingActionButton(
                  onPressed: _showDialog4,
                  child: const Icon(Icons.settings),
                ),
              ),
            ],
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: _toggleButtons,
                child: const Icon(Icons.add),
              ),
            ),
          ],
        )*/
      );

  void _toggleButtons() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  Widget _body() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                  style: const ButtonStyle(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('add new item'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: _showDialog,
              child: const Text('Sign up'),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.unarchive),
            ),
            DropdownButton(
              focusColor: Colors.transparent,
              value: dropdownMenuItemSelected,
              items: const [
                DropdownMenuItem(
                  value: 'First',
                  child: Text('First'),
                ),
                DropdownMenuItem(
                  value: 'Second',
                  child: Text('Second'),
                ),
                DropdownMenuItem(
                  value: 'Third',
                  child: Text('Third'),
                ),
                DropdownMenuItem(
                  value: 'Fourth',
                  child: Text('Fourth'),
                ),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  dropdownMenuItemSelected = newValue!;
                });
              },
              hint: const Text("Select an item"),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.red, // Background color for main dropdown
                    borderRadius: BorderRadius.circular(20), // Circular border
                  ),
                  child: DropdownButton<String>(
                    value: dropdownMenuItemSelected,
                    icon:
                        const Icon(Icons.arrow_drop_down, color: Colors.white),
                    underline: const SizedBox(),
                    // Remove default underline
                    dropdownColor: Colors.white,
                    // Background color for dropdown items
                    focusColor: Colors.transparent,
                    items: [
                      _buildDropdownMenuItem('First', Icons.home),
                      _buildDropdownMenuItem('Second', Icons.star),
                      _buildDropdownMenuItem('Third', Icons.settings),
                      _buildDropdownMenuItem('Fourth', Icons.person),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownMenuItemSelected = newValue!;
                      });
                    },
                    hint: const Text(
                      "Select an item",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(
                        color: Colors.white), // Text color for selected item
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Main Dropdown Button
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: dropdownMenuItemSelected,
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.white),

                      underline: const SizedBox(),
                      dropdownColor: Colors.red,
                      focusColor: Colors.red,
                      elevation: 1000,
                      items: [
                        _buildDropdownMenuItem('First', Icons.home),
                        _buildDropdownMenuItem('Second', Icons.star),
                        _buildDropdownMenuItem('Third', Icons.settings),
                        _buildDropdownMenuItem('Fourth', Icons.person),
                      ],
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownMenuItemSelected = newValue!;
                        });
                      },
                      hint: Row(
                        children: [
                          Icon(Icons.menu,
                          color:Colors.white,
                          ),
                          const Text(
                            "Select an item",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      style: const TextStyle(
                          color: Colors.white), // Text color for selected item
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  DropdownMenuItem<String> _buildDropdownMenuItem(String text, IconData icon) =>
      DropdownMenuItem<String>(
        value: text,
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      );

  void _showDialog() {
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
  }

  void _showDialog2() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: SizedBox(
          height: 100,
          width: 150,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Edit',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog3() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: SizedBox(
          height: 100,
          width: 150,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Share',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog4() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: SizedBox(
          height: 100,
          width: 150,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Settings',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
