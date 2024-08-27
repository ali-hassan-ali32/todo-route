class TaskModel{
  String id;
  String title;
  String userId;
  String time;
  String desc;
  int date;
  bool isDone;

  TaskModel(
      {required this.time,
      required this.title,
      required this.desc,
    this.isDone = false,
    required this.date,
      this.userId = '',
      this.id = ''});

  factory TaskModel.fromJson(Map<String, dynamic> json){
    return TaskModel(
        userId: json['userId'],
        time: json['time'],
        title: json["title"],
        desc: json["desc"],
        date: json['date'],
        isDone: json["isDone"],
        id: json['id']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "time": time,
      'userId': userId,
      "title": title,
      "desc": desc,
      "date": date,
      "isDone": isDone
    };
  }
}