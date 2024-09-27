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
          title: const Text('Buttons'),
          backgroundColor: Colors.tealAccent,
        ),
        body: _body(),
        floatingActionButton: _floatingActionButtons(),
      );

  Widget _body() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildElevatedButton(),
            const SizedBox(height: 20),
            _buildElevatedButtonWithText('Add New Item', Icons.add),
            const SizedBox(height: 20),
            _buildTextButton(Icons.add),
            const SizedBox(height: 20),
            _buildTextButtonWithDialog('Sign Up'),
            _buildIconButton(Icons.unarchive),
            _buildDropdown(),
            const SizedBox(height: 50),
            _buildStyledDropdown(),
          ],
        ),
      );

  Widget _buildElevatedButton() => ElevatedButton(
        onPressed: () {},
        style: const ButtonStyle(),
        child: const Icon(Icons.add),
      );

  Widget _buildElevatedButtonWithText(String text, IconData icon) =>
      ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(text),
          ],
        ),
      );

  Widget _buildTextButton(IconData icon) => TextButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      );

  Widget _buildTextButtonWithDialog(String text) => TextButton(
        onPressed: _showDialog,
        child: Text(text),
      );

  Widget _buildIconButton(IconData icon) => IconButton(
        onPressed: () {},
        icon: Icon(icon),
      );

  Widget _buildDropdown() {
    return DropdownButton<String>(
      focusColor: Colors.transparent,
      value: dropdownMenuItemSelected,
      items: const [
        DropdownMenuItem(value: 'First', child: Text('First')),
        DropdownMenuItem(value: 'Second', child: Text('Second')),
        DropdownMenuItem(value: 'Third', child: Text('Third')),
        DropdownMenuItem(value: 'Fourth', child: Text('Fourth')),
      ],
      onChanged: (String? newValue) {
        setState(() {
          dropdownMenuItemSelected = newValue!;
        });
      },
      hint: const Text("Select an item"),
    );
  }

  Widget _buildStyledDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButton<String>(
        value: dropdownMenuItemSelected,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        underline: const SizedBox(),
        dropdownColor: Colors.white,
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
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _floatingActionButtons() {
    return Stack(
      children: <Widget>[
        if (_isExpanded) ...[
          _buildFloatingActionButton(Icons.edit, _showDialog2, bottom: 160),
          _buildFloatingActionButton(Icons.share, _showDialog3, bottom: 90),
          _buildFloatingActionButton(Icons.settings, _showDialog4, bottom: 230),
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
    );
  }

  Widget _buildFloatingActionButton(IconData icon, VoidCallback onPressed,
      {required double bottom}) {
    return Positioned(
      bottom: bottom,
      right: 20,
      child: FloatingActionButton(
        onPressed: onPressed,
        child: Icon(icon),
      ),
    );
  }

  void _toggleButtons() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  DropdownMenuItem<String> _buildDropdownMenuItem(String text, IconData icon) {
    return DropdownMenuItem<String>(
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
  }

  void _showDialog() {
    _showCustomDialog('Test', Colors.lightBlue);
  }

  void _showDialog2() {
    _showCustomDialog('Edit', Colors.green);
  }

  void _showDialog3() {
    _showCustomDialog('Share', Colors.purple);
  }

  void _showDialog4() {
    _showCustomDialog('Settings', Colors.orange);
  }

  void _showCustomDialog(String text, Color color) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: SizedBox(
          height: 100,
          width: 150,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
