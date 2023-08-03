class MemberProfileUpdateModel {
  String name;
  String email;
  String mobile;
  String occupation;
  String fatherName;
  String motherName;
  String dateOfBirth;
  String isMarried;
  String qualification;
  String gender;
  String weddingDate;
  String gstNo;
  String panNo;
  String adharNo;
  String branch;
  String spouse;
  String alternateMob;
  String adharproofimg;
  String panproofimg;
  String children;


  MemberProfileUpdateModel(
      {required this.name,
      required this.email,
      required this.occupation,
      required this.fatherName,
      required this.motherName,
      required this.mobile,
      required this.dateOfBirth,
      required this.isMarried,
      required this.qualification,
      required this.adharNo,
      required this.branch,
      required this.gender,
      required this.gstNo,
      required this.panNo,
      required this.spouse,
      required this.weddingDate,
      required this.alternateMob,
      required this.adharproofimg,
      required this.panproofimg,
      required this.children
      });
}
