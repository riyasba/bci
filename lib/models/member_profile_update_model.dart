class MemberProfileUpdateModel {
  String name;
  String email;
  String mobile;
  String occupation;
  String fatherName;
  String motherName;
  String dateOfBirth;
  String isMarried;

  MemberProfileUpdateModel(
      {required this.name,
      required this.email,
      required this.occupation,
      required this.fatherName,
      required this.motherName,
      required this.mobile,
      required this.dateOfBirth,
      required this.isMarried});
}
