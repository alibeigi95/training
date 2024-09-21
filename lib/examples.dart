import 'package:flutter/material.dart';

class DropdownWithTextField extends StatefulWidget {
  @override
  _DropdownWithTextFieldState createState() => _DropdownWithTextFieldState();
}

class _DropdownWithTextFieldState extends State<DropdownWithTextField> {
  String? _selectedItem;
  List<String> _items = ['Item 1', 'Item 2', 'Item 3'];
  final TextEditingController _textController = TextEditingController();

  void _addItem(String newItem) {
    setState(() {
      _items.add(newItem);
    });
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
      _showDialog('Text is not exists');
    }
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Dropdown with Dynamic Items')),
        body: Column(
          children: [
            DropdownButton<String>(
              value: _selectedItem,
              hint: Text('Select an item'),
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
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter item to remove',
                suffixIcon: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _removeItem(_textController.text);
                    _textController.clear();
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _addItem(_textController.text);
                _textController.clear();
              },
              child: Text('Add Item'),
            ),
          ],
        ),
      );
}
