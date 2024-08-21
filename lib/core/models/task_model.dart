class TaskModel{
  String id;
  String title;
  String desc;
  int date;
  bool isDone;

  TaskModel({
    required this.title,
    required this.desc,
    this.isDone = false,
    required this.date,
    this.id = ''
  });

  factory TaskModel.fromJson(Map<String, dynamic> json){
    return TaskModel(
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
      "title": title,
      "desc": desc,
      "date": date,
      "isDone": isDone
    };
  }
}