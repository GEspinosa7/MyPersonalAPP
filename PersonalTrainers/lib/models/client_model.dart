class ClientModel {
  int id;
  String name;
  String lastname;
  String birthDate;
  String weight;
  String height;
  String goal;
  String timeActive;
  String availability;
  String createdAt;
  String updatedAt;
  String uid;
  int age;

  // int get calculateAge {
  //   DateTime currentDate = DateTime.now();
  //   int age = currentDate.year - this.birthDate.year;
  //   int month1 = currentDate.month;
  //   int month2 = birthDate.month;
  //   if (month2 > month1) {
  //     age--;
  //   } else if (month1 == month2) {
  //     int day1 = currentDate.day;
  //     int day2 = birthDate.day;
  //     if (day2 > day1) {
  //       age--;
  //     }
  //   }
  //   this.age = age;
  //   return this.age;
  // }

  ClientModel({
    this.id,
    this.name,
    this.lastname,
    this.birthDate,
    this.weight,
    this.height,
    this.goal,
    this.timeActive,
    this.availability,
    this.createdAt,
    this.updatedAt,
    this.uid,
  });

  ClientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastname = json['lastname'];
    birthDate = json['birth_date'];
    weight = json['weight'];
    height = json['height'];
    goal = json['goal'];
    timeActive = json['time_active'];
    availability = json['availability'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    uid = json['uid'];

    // DateTime.parse(birthDate);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['lastname'] = this.lastname;
    data['birth_date'] = this.birthDate;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['goal'] = this.goal;
    data['time_active'] = this.timeActive;
    data['availability'] = this.availability;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['uid'] = this.uid;
    return data;
  }
}
