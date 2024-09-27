import 'package:flutter/material.dart';

class SwitchListScreen extends StatefulWidget {
  const SwitchListScreen({super.key});

  @override
  _SwitchListScreenState createState() => _SwitchListScreenState();
}

class _SwitchListScreenState extends State<SwitchListScreen> {
  List<bool> switchValues = [false, false, false];
  List<String> switchLabels = ['Switch 1', 'Switch 2', 'Switch 3'];
  List<bool> isEditing = [false, false, false];
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    for (final label in switchLabels) {
      controllers.add(TextEditingController(text: label));
    }
  }

  void _addSwitch() {
    setState(() {
      switchValues.add(false);
      switchLabels.add('Switch ${switchLabels.length + 1}');
      isEditing.add(false);
      controllers.add(TextEditingController(text: 'Switch ${switchLabels.length}'));
    });
  }

  void _deleteSwitch(int index) {
    setState(() {
      switchValues.removeAt(index);
      switchLabels.removeAt(index);
      isEditing.removeAt(index);
      controllers[index].dispose();
      controllers.removeAt(index);
    });
  }

  void _toggleEdit(int index) {
    setState(() {
      isEditing[index] = !isEditing[index];
    });
  }

  void _updateLabel(int index) {
    setState(() {
      switchLabels[index] = controllers[index].text;
      isEditing[index] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Switch List'),
      backgroundColor: Colors.cyan,
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(child: _buildSwitchList()),
        _buildAddSwitchButton(),
      ],
    );
  }

  Widget _buildSwitchList() {
    return ListView.builder(
      itemCount: switchValues.length,
      itemBuilder: (context, index) {
        return _buildSwitchTile(index);
      },
    );
  }

  Widget _buildSwitchTile(int index) {
    return ListTile(
      title: isEditing[index]
          ? _buildEditTextField(index)
          : Text(switchLabels[index]),
      trailing: _buildSwitchActions(index),
    );
  }

  Widget _buildEditTextField(int index) {
    return TextField(
      controller: controllers[index],
      decoration: const InputDecoration(
        labelText: 'Edit Label',
      ),
      onSubmitted: (newLabel) {
        _updateLabel(index);
      },
    );
  }

  Widget _buildSwitchActions(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Switch(
          value: switchValues[index],
          onChanged: (bool value) {
            setState(() {
              switchValues[index] = value;
            });
          },
        ),
        IconButton(
          icon: Icon(isEditing[index] ? Icons.check : Icons.edit),
          onPressed: () {
            if (isEditing[index]) {
              _updateLabel(index);
            } else {
              _toggleEdit(index);
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            _deleteSwitch(index);
          },
        ),
      ],
    );
  }

  Widget _buildAddSwitchButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: _addSwitch,
        child: const Text('Add Switch'),
      ),
    );
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
