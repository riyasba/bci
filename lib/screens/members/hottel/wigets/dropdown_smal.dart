import 'package:bci/constands/constands.dart';
import 'package:flutter/material.dart';

//import '../../../constands/constands.dart';

class Dropdown_small extends StatefulWidget {
  final String label;
  final List<String> options;

  Dropdown_small({required this.label, required this.options});

  @override
  _Dropdown_smallState createState() => _Dropdown_smallState();
}

class _Dropdown_smallState extends State<Dropdown_small> {
  var _selectedOption;
  final List<String> options = ['1', '2', '3'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        child: DropdownButtonFormField<String>(
          style: TextStyle(color: Colors.grey),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: kwhite,
            focusColor: kwhite,
            isDense: true,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            labelText: widget.label,
            labelStyle: TextStyle(color: Colors.black),
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
              child: Text(
                option,
                style: TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
