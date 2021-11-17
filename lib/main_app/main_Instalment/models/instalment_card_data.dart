// ignore_for_file: non_constant_identifier_names

class MyCurrentIndex {
  String? startDate;
  int? dueDateFine;
  int? instalment;

  MyCurrentIndex({
    this.startDate,
    this.dueDateFine,
    this.instalment,
  });
}

List<MyCurrentIndex> InstalmentCardData = [
  MyCurrentIndex(
    startDate: _startDate,
    dueDateFine: 5,
    instalment: 30,
  ),
  MyCurrentIndex(
    startDate: _startDate,
    dueDateFine: 5,
    instalment: 20,
  ),
  MyCurrentIndex(
    startDate: _startDate,
    dueDateFine: 5,
    instalment: 10,
  ),
  MyCurrentIndex(
    startDate: _startDate,
    dueDateFine: 5,
    instalment: 10,
  ),
  MyCurrentIndex(
    startDate: _startDate,
    dueDateFine: 5,
    instalment: 10,
  ),
  MyCurrentIndex(
    startDate: _startDate,
    dueDateFine: 5,
    instalment: 10,
  ),
  MyCurrentIndex(
    startDate: _startDate,
    dueDateFine: 5,
    instalment: 40,
  ),
];

String _startDate = '02-12-2021';
