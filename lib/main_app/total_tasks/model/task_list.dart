class MyTaskCard {
  String? taskTitle;
  String? startDate;
  String? endDate;

  MyTaskCard({
    this.taskTitle,
    this.startDate,
    this.endDate,
  });
}

List<MyTaskCard> tasksCardData = [
  MyTaskCard(
      taskTitle: 'Task 01', startDate: '12/02/2021', endDate: '12/02/2021'),
];
