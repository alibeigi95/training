import 'package:flutter/material.dart';

class DropdownWithTextFieldUpdate extends StatefulWidget {
  const DropdownWithTextFieldUpdate({super.key});

  @override
  _DropdownWithTextFieldUpdateState createState() => _DropdownWithTextFieldUpdateState();
}

class _DropdownWithTextFieldUpdateState extends State<DropdownWithTextFieldUpdate> {
  String? _selectedItem;
  List<String> _items = ['Item 1', 'Item 2', 'Item 3'];
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _updateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dropdown with Update')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDropdown(),
            const SizedBox(height: 16),
            _buildRemoveItemTextField(),
            const SizedBox(height: 16),
            _buildAddItemButton(),
            const SizedBox(height: 20),
            _buildUpdateItemTextField(),
            const SizedBox(height: 16),
            _buildUpdateItemButton(),
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
          if (newValue != null) {
            _updateController.text = newValue; // Fill update field
          }
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

  TextField _buildRemoveItemTextField() {
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

  TextField _buildUpdateItemTextField() {
    return TextField(
      controller: _updateController,
      decoration: const InputDecoration(
        labelText: 'Update selected item',
      ),
    );
  }

  ElevatedButton _buildUpdateItemButton() {
    return ElevatedButton(
      onPressed: () {
        _updateItem(_updateController.text);
      },
      child: const Text('Update Item'),
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
          _updateController.clear(); // Clear update field if removed
        }
      });
    } else {
      _showDialog('Item does not exist.');
    }
  }

  void _updateItem(String updatedItem) {
    if (_selectedItem != null && _items.contains(_selectedItem)) {
      setState(() {
        int index = _items.indexOf(_selectedItem!);
        _items[index] = updatedItem;
        _selectedItem = updatedItem;
        _updateController.clear(); // Clear update field after updating
      });
    } else {
      _showDialog('No item selected to update');
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
