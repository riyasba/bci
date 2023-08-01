import 'package:flutter/material.dart';

class BusContactDetailsModel {
  String seats;
  String gender;
  var nameController;
  var ageController;

  BusContactDetailsModel({
    required this.seats,
    required this.gender,
     this.nameController ,
     this.ageController,
  });
}