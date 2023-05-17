class MerchantUpdateModel {
  String categoryId;
  String name;
  dynamic email;
  String mobile;
  String alternateMobile;
  String gstNo;
  String address;

  MerchantUpdateModel({
    required this.categoryId,
    required this.name,
    this.email,
    required this.mobile,
    required this.alternateMobile,
    required this.gstNo,
    required this.address,
  });
}
