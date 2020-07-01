class TrainingModel {
  int id;
  String kind;
  String division;
  String dateStart;
  String dateEnd;
  String createdAt;
  String updatedAt;
  int clientId;
  int trainerId;
  List<Exercises> exercises;

  TrainingModel(
      {this.id,
      this.kind,
      this.division,
      this.dateStart,
      this.dateEnd,
      this.createdAt,
      this.updatedAt,
      this.clientId,
      this.trainerId,
      this.exercises});

  TrainingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kind = json['kind'];
    division = json['division'];
    dateStart = json['date_start'];
    dateEnd = json['date_end'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    clientId = json['client_id'];
    trainerId = json['trainer_id'];
    if (json['exercises'] != null) {
      exercises = new List<Exercises>();
      json['exercises'].forEach((v) {
        exercises.add(new Exercises.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['division'] = this.division;
    data['date_start'] = this.dateStart;
    data['date_end'] = this.dateEnd;
    data['client_id'] = this.clientId;
    data['trainer_id'] = this.trainerId;
    if (this.exercises != null) {
      data['exercises'] = this.exercises.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Exercises {
  int id;
  String name;
  String description;
  String equipment;
  String times;
  int trainingId;
  String createdAt;
  String updatedAt;
  String series;

  Exercises(
      {this.id,
      this.name,
      this.description,
      this.equipment,
      this.times,
      this.trainingId,
      this.createdAt,
      this.updatedAt,
      this.series});

  Exercises.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    equipment = json['equipment'];
    times = json['times'];
    trainingId = json['training_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    series = json['series'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['equipment'] = this.equipment;
    data['times'] = this.times;
    data['training_id'] = this.trainingId;
    data['series'] = this.series;
    return data;
  }
}
