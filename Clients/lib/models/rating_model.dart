import 'dart:ffi';

class RatingModel {
  int id;
  String ratingDate;
  Float ratingValue;
  String createdAt;
  String updatedAt;
  int clientId;
  int trainerId;

  RatingModel(
      {this.id,
      this.ratingDate,
      this.ratingValue,
      this.createdAt,
      this.updatedAt,
      this.clientId,
      this.trainerId});

  RatingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ratingDate = json['rating_date'];
    ratingValue = json['rating_value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    clientId = json['client_id'];
    trainerId = json['trainer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating_date'] = this.ratingDate;
    data['rating_value'] = this.ratingValue;
    data['client_id'] = this.clientId;
    data['trainer_id'] = this.trainerId;
    return data;
  }
}
