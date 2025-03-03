class TaskModel {
  String id;
  String title;
  String category;
  String location;
  String description;
  int date;
  int time;
  bool isDone;

  TaskModel({
    required this.id,
    required this.title,
    required this.category,
    required this.location,
    required this.description,
    required this.date,
    required this.time,
    required this.isDone,
  });


  TaskModel.fromJson(Map<String, dynamic> json):this(
    id: json['id'],
    title: json['title'],
    category: json['category'],
    location: json['location'],
    description: json['description'],
    date: json['date'],
    time: json['time'],
    isDone: json['isDone'],
  );

  Map <String , dynamic> toJson(){
    return{
      "id" : id,
      "title" : title,
      "category" : category,
      "location" : location,
      "description" : description,
      "date" : date,
      "time" : time,
      "isDone" : isDone,
    };
  }
}
