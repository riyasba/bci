class BusCancelSeatDetailsModel {
  String seatNumber;
  String ticketNumber;
  String pnrNumber;
  String fare;

  BusCancelSeatDetailsModel({
    required this.pnrNumber,
    required this.seatNumber,
    required this.ticketNumber,
    required this.fare,
  });
}
