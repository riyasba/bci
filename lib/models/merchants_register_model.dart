// To parse this JSON data, do
//
//     final merchantRegisterModel = merchantRegisterModelFromJson(jsonString);

import 'dart:convert';

MerchantRegisterModel merchantRegisterModelFromJson(String str) =>
    MerchantRegisterModel.fromJson(json.decode(str));

String merchantRegisterModelToJson(MerchantRegisterModel data) =>
    json.encode(data.toJson());

class MerchantRegisterModel {
 
  //String subcategoryId;
  String name;
  String email;
  String mobile;
 
  String roleId;


  MerchantRegisterModel({
  
    //required this.subcategoryId,
    required this.name,
    required this.email,
    required this.mobile,
    
    required this.roleId,
  
  });

  factory MerchantRegisterModel.fromJson(Map<String, dynamic> json) =>
      MerchantRegisterModel(
    
        //subcategoryId: json["subcategory_id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        roleId: json["role_id"],
  
      );

  Map<String, dynamic> toJson() => {
 
        //"subcategory_id": subcategoryId,
        "name": name,
        "email": email,
        "mobile": mobile,
        "role_id": roleId,

      }; 
}
