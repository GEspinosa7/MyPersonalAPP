class StudentProfileModel {
  int id;
  String name;
  String lastName;
  String birthDate;
  double height;
  double weight;
  String objective;
  String activeTime;
  String createdAt;
  String updatedAt;
   String uid;

  StudentProfileModel(
      {this.id,
      this.name,
      this.lastName,
      this.birthDate,
      this.height,
      this.weight,
      this.objective,
      this.activeTime,
      this.createdAt,
      this.updatedAt,
      this.uid});

  StudentProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['last_name'];
    birthDate = json['birth_date'];
    height = json['height'];
    weight = json['weight'];
    objective = json['objective'];
    activeTime = json['active_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['last_name'] = this.lastName;
    data['birth_date'] = this.birthDate;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['objective'] = this.objective;
    data['active_time'] = this.activeTime;
    data['uid'] = this.uid;
    return data;
  }
}