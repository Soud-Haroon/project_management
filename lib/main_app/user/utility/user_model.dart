// 1st final LeaveCard Data

class UserCardModel {
  String? imagePath;
  String? userName;
  String? userDesignation;

  UserCardModel({this.imagePath, this.userName, this.userDesignation});
}

List<UserCardModel> userCardData = [
  UserCardModel(
    imagePath: 'T1',
    userName: 'Soud',
    userDesignation: 'Flutter'
  ),
  UserCardModel(
    imagePath: 'T2',
    userName: 'Ali',
    userDesignation: 'Flutter'
  ),
];
