import 'package:bci/constands/constands.dart';
import 'package:flutter/material.dart';

//import '../../../constands/constands.dart';

class Dropdown_Small extends StatefulWidget {
  final String label;
  final List<String> options;

  Dropdown_Small({required this.label, required this.options});

  @override
  _Dropdown_SmallState createState() => _Dropdown_SmallState();
}

class _Dropdown_SmallState extends State<Dropdown_Small> {
  var _selectedOption ;
 final List<String> options = ['1','2','3'];
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
     
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration( 
    
        floatingLabelBehavior: FloatingLabelBehavior
                                  .never,
    fillColor: kwhite,
    focusColor: kwhite,
     isDense: true,
     isCollapsed: true,
     contentPadding: EdgeInsets.only(left: 10,right: 3),
    //  enabledBorder: ,
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black
      ),
      borderRadius: BorderRadius.circular(2),
    ),
    enabledBorder:OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black
      ),
      borderRadius: BorderRadius.circular(2),
    ) ,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black
      ),
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
          child: Text(option,style: TextStyle(color: Colors.black),),
        );
      }).toList(),
    );
  }
}
