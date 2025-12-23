class ScheduleEntity {
  String? id;
  String name;
  DateTime startDate;
  DateTime endDate;
  String target;
  String description;
  
  ScheduleEntity({
    this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.target,
    required this.description,
  });
}
