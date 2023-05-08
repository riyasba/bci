import 'package:bci/constands/constands.dart';
import 'package:flutter/material.dart';

//import '../../../constands/constands.dart';

class Dropdown_hotel extends StatefulWidget {
  final String label;
  final List<String> options;

  Dropdown_hotel({required this.label, required this.options});

  @override
  _Dropdown_hotelState createState() => _Dropdown_hotelState();
}

class _Dropdown_hotelState extends State<Dropdown_hotel> {
  var _selectedOption ;
 final List<String> options = [''];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(height: 40,
        child: DropdownButtonFormField<String>(style: TextStyle(color: Colors.grey),
          decoration: InputDecoration( 
      
            floatingLabelBehavior: FloatingLabelBehavior
                                      .never,
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
              child: Text(option),
            );
          }).toList(),
        ),
      ),
    );
  }
}
