import 'package:flutter/material.dart';

class ChildDetailsModel {
  String? name;
  TextEditingController nameController;
  TextEditingController dateOfBirthController;
  String? dob;
  bool isNew;

  ChildDetailsModel(
      { this.dob,
       this.name,
      required this.nameController,
       this.isNew = true,
      required this.dateOfBirthController});
}
