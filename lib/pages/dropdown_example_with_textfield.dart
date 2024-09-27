import 'package:flutter/material.dart';

class DropdownWithTextField extends StatefulWidget {
  const DropdownWithTextField({super.key});

  @override
  _DropdownWithTextFieldState createState() => _DropdownWithTextFieldState();
}

class _DropdownWithTextFieldState extends State<DropdownWithTextField> {
  String? _selectedItem;
  List<String> _items = ['Item 1', 'Item 2', 'Item 3'];
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dropdown with Dynamic Items')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDropdown(),
            const SizedBox(height: 16),
            _buildTextField(),
            const SizedBox(height: 16),
            _buildAddItemButton(),
          ],
        ),
      ),
    );
  }

  DropdownButton<String> _buildDropdown() {
    return DropdownButton<String>(
      value: _selectedItem,
      hint: const Text('Select an item'),
      onChanged: (String? newValue) {
        setState(() {
          _selectedItem = newValue;
        });
      },
      items: _items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }

  TextField _buildTextField() {
    return TextField(
      controller: _textController,
      decoration: InputDecoration(
        labelText: 'Enter item to remove',
        suffixIcon: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            _removeItem(_textController.text);
            _textController.clear();
          },
        ),
      ),
    );
  }

  ElevatedButton _buildAddItemButton() {
    return ElevatedButton(
      onPressed: () {
        _addItem(_textController.text);
        _textController.clear();
      },
      child: const Text('Add Item'),
    );
  }

  void _addItem(String newItem) {
    if (newItem.isNotEmpty) {
      setState(() {
        _items.add(newItem);
      });
    } else {
      _showDialog('Please enter a valid item.');
    }
  }

  void _removeItem(String itemToRemove) {
    if (_items.contains(itemToRemove)) {
      setState(() {
        _items.remove(itemToRemove);
        if (_selectedItem == itemToRemove) {
          _selectedItem = null;
        }
      });
    } else {
      _showDialog('Item does not exist.');
    }
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
