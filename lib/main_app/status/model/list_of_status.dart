enum mystatus {active, inActive}

class StatusModel {
  String? title;
  String? status;
  String? color;

  StatusModel({
    this.title,
    this.status,
    this.color,
  });
}

List<StatusModel> statusData = [
  StatusModel(title: 'Completed', status: 'Active', color: 'Green'),
  StatusModel(title: 'Close', status: 'InActive', color: 'Red'),
  // StatusModel(title: 'Completed', status: 'Active', color: 'Yellow'),
  // StatusModel(title: 'Completed', status: 'InActive', color: 'Blue'),
  // StatusModel(title: 'Close', status: 'Active', color: 'Green'),
];
