// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

// List<MainProjectBCard> projectBData = [
//   MainProjectBCard(
//       header: _header,
//       bodyContent: _bodyContent,
//       startDate: _startDate,
//       endDate: _endDate,
//       milestones: _milestones),
// ];

// String _header = 'Tower';
// String _bodyContent =
//     'Hello guys, we have discussed about post-corona vacation plan and our decision is to go to Bali.';
// String _startDate = '10-12-2021';
// String _endDate = '10-12-2021';
// int _milestones = 15;

class ProjectDetailModel {
  String? projectName;
  String? ownerName;
  String? companyName;
  String? area;
  String? salePrice;
  String? downpayment;
  String? installment;
  String? installmentAmount;
  DateTime? startDate;
  DateTime? endDate;
  DateTime? dueDate;
  String? description;
  String? type;
  List<MileDataModel> milestone = [];

  ProjectDetailModel({
    this.projectName,
    this.companyName,
    this.ownerName,
    this.area,
    this.salePrice,
    this.startDate,
    this.endDate,
    this.dueDate,
    this.description,
    this.type,
    this.downpayment,
    this.installment,
    this.installmentAmount,
    //---------------------//
    // this.milestone,
  });
}

class MileDataModel {
  String? mileName;
  String? milDes;
  DateTime? startDate;
  DateTime? endDate;
  var statusValue;
  List<String>? imageList;
  List<TaskModel> taskList = [];

  MileDataModel({
    this.mileName,
    this.milDes,
    this.startDate,
    this.endDate,
    this.imageList,
    this.statusValue,
  });
}

class TaskModel {
  String? taskTitle;
  DateTime? startDate;
  DateTime? endDate;

  TaskModel({
    this.taskTitle,
    this.startDate,
    this.endDate,
  });
}

List<ProjectDetailModel> projectData = [
  ProjectDetailModel(
    projectName: 'Starboy',
    ownerName: 'Soud',
    companyName: 'Apex Legends',
    area: '4500',
    salePrice: '45',
    startDate: DateTime.parse("2020-01-01"),
    endDate: DateTime.now(),
    dueDate: DateTime.now(),
    type: 'Software',
    downpayment: '120',
    installment: '7',
    installmentAmount: '240',
    description: des,
    // milestone: mileData,
  ),
];

// List<MileDataModel> mileData = [
//   // MileDataModel(
//   //   mileName: 'Soud Haroon',
//   //   milDes:
//   //       "Like a moth to a flame I'll pull you in, I'll pull you back to What you need initially.",
//   //   startDate: DateTime.now(),
//   //   endDate: DateTime.now(),
//   // ),
// ];

String des =
    "Like a moth to a flame I'll pull you in, I'll pull you back to What you need initially It's just one call away And you'll leave him, you're loyal to me But this time I'll let you be";
