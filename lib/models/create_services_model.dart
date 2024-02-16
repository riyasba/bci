import 'package:image_picker/image_picker.dart';

class CreateServiceModel {
  String title;
  String category;
  String saleAmount;
  String actualAmount;
  // String share;
  // String bvcAmount;
  String booking;
  List<Amenty> amenities;
  List<XFile> image;
  String description;
  String isOfferAvailable;
  String isCouponsAvailable;
  dynamic offerPercentage;
  dynamic offerAmount;
  dynamic couponAmount;
  dynamic unit;
  dynamic quantity;
  dynamic cgst;
  dynamic sgst;
  dynamic startTime;
  dynamic endTime;
  dynamic available;
  dynamic isCoastAvailable;


  CreateServiceModel(
      {required this.title,
      required this.category,
      required this.saleAmount,
      required this.actualAmount,
      // required this.share,
      required this.amenities,
      required this.booking,
      // required this.bvcAmount,
      required this.description,
      this.offerAmount,
      this.couponAmount,
      required this.isCouponsAvailable,
      required this.isOfferAvailable,
      this.offerPercentage,
      this.quantity,
      this.unit,
      this.cgst,
      this.sgst,
      this.startTime,
      this.endTime,
      this.available,
      this.isCoastAvailable,
      required this.image});
}

class Amenty {
  String value;

  Amenty({
    required this.value,
  });

  factory Amenty.fromJson(Map<String, dynamic> json) => Amenty(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "\"value\"": "\"$value\"",
      };
}
