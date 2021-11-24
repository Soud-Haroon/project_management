// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

class ProjectDetailModel {
  String? projectName;
  String? ownerName;
  String? companyName;
  String? area;
  String? salePrice;
  String? downpayment;
  String? installment;
  String? installmentAmount;
  var statusValue;
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
    this.statusValue,
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
  String? taskDescription;
  String backGroundImage = 'assets/content/imageback2.png';
  List<String>? taskImageList;
  var taskStatusValue;
  DateTime? startDate;
  DateTime? endDate;

  TaskModel({
    this.taskTitle,
    this.taskDescription,
    this.taskImageList,
    this.taskStatusValue,
    this.startDate,
    this.endDate,
  });
}

List<ProjectDetailModel> projectData = [
  ProjectDetailModel(
    projectName: 'Starboy',
    ownerName: 'Soud',
    companyName: 'Apex Legends',
    area: '2400',
    salePrice: '50',
    startDate: DateTime.parse("2020-01-01"),
    endDate: DateTime.now(),
    dueDate: DateTime.now(),
    type: 'Software',
    downpayment: '120',
    installment: '7',
    statusValue: 'Status.inprogress',
    installmentAmount: '240',
    description: des,
    // milestone: mileData,
  ),
  ProjectDetailModel(
    projectName: 'Starboy',
    ownerName: 'Soud',
    companyName: 'Apex Legends',
    area: '2400',
    salePrice: '50',
    startDate: DateTime.parse("2020-01-01"),
    endDate: DateTime.now(),
    dueDate: DateTime.now(),
    type: 'Software',
    downpayment: '120',
    installment: '7',
    statusValue: 'Status.done',
    installmentAmount: '240',
    description: des,
    // milestone: mileData,
  ),
  ProjectDetailModel(
    projectName: 'Starboy',
    ownerName: 'Soud',
    companyName: 'Apex Legends',
    area: '2400',
    salePrice: '50',
    startDate: DateTime.parse("2020-01-01"),
    endDate: DateTime.now(),
    dueDate: DateTime.now(),
    type: 'Software',
    downpayment: '120',
    installment: '7',
    statusValue: 'Status.onhold',
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
