import 'package:flutter/material.dart';

import '../../../constands/constands.dart';

class MyDropdown extends StatefulWidget {
  final String label;
  final List<String> options;

  MyDropdown({required this.label, required this.options});

  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  var _selectedOption ;
 final List<String> options = ['Option 1', 'Option 2', 'Option 3'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(style:const TextStyle(color: Colors.grey),
      decoration: InputDecoration( 
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: kblue,
      focusColor: kblue,
      isDense: true,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
      ),
          labelText: widget.label,
          labelStyle: TextStyle(color: kwhite),
        ),
        value: _selectedOption,
        onChanged: (newValue) {
          setState(() {
            _selectedOption = newValue!;
          });
        },
        items: options.map((option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
      ),
    );
  }
}
