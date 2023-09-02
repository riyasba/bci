import 'dart:io';

class UpdateBankModel {
  
  String bankName;
  String bankAccountName;
  String bankAccountNumber;
  String accountType;
  String ifscCode;

  UpdateBankModel({
    required this.accountType,
    required this.bankAccountName,
    required this.bankAccountNumber,
    required this.bankName,
    required this.ifscCode,
  });
}
