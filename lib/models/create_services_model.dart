class CreateServiceModel {
  String title;
  String category;
  String saleAmount;
  String actualAmount;
  String share;
  String bvcAmount;
  String booking;
  List<Amenty> amenities;
  String image;
  String description;
  String isOfferAvailable;
  String isCouponsAvailable;
  dynamic offerPercentage;
  dynamic offerAmount;
  dynamic couponAmount;

  CreateServiceModel(
      {required this.title,
      required this.category,
      required this.saleAmount,
      required this.actualAmount,
      required this.share,
      required this.amenities,
      required this.booking,
      required this.bvcAmount,
      required this.description,
      this.offerAmount,
      this.couponAmount,
      required this.isCouponsAvailable,
      required this.isOfferAvailable,
      this.offerPercentage,
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
        "value": value,
      };
}
