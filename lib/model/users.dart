class UserModel {
  String? email;
  String? docId;
  String? nickName;
  int? firstChildSchoolId;
  int? secondChildSchoolId;
  DateTime? createdTime;
  DateTime? lastLoginTime;

  UserModel({
    this.email,
    this.docId,
    this.nickName,
    this.firstChildSchoolId,
    this.secondChildSchoolId,
    this.createdTime,
    this.lastLoginTime,
  });
}
