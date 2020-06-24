class TrainerModel {
  int id;
  String name;
  String lastname;
  String birthDate;
  String timeActing;
  String qualifications;
  String availability;
  String price;
  String uid;
  String createdAt;
  String updatedAt;

  TrainerModel(
      {this.id,
      this.name,
      this.lastname,
      this.birthDate,
      this.timeActing,
      this.qualifications,
      this.availability,
      this.price,
      this.uid,
      this.createdAt,
      this.updatedAt});

  TrainerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastname = json['lastname'];
    birthDate = json['birth_date'];
    timeActing = json['time_acting'];
    qualifications = json['qualifications'];
    availability = json['availability'];
    price = json['price'];
    uid = json['uid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['lastname'] = this.lastname;
    data['birth_date'] = this.birthDate;
    data['time_acting'] = this.timeActing;
    data['qualifications'] = this.qualifications;
    data['availability'] = this.availability;
    data['price'] = this.price;
    data['uid'] = this.uid;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}